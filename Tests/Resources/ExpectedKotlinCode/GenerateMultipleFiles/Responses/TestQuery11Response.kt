
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class TestQuery11Response(

    /**
     * Returns a specific node by ID.
     */
    val node: Node?
) : Response {
    constructor(jsonObject: JsonObject) : this(
        node = if (jsonObject.has("node") && !jsonObject.get("node").isJsonNull) Node(jsonObject.getAsJsonObject("node")) else null
    )

data class Node(
    val realized: Realized
): Response {
    constructor(jsonObject: JsonObject) : this (
        realized = when (jsonObject.get("__typename").asString) {
            "Product" -> Realized.Product(jsonObject)
            "ProductOption" -> Realized.ProductOption(jsonObject)
            else -> Realized.Other
        }
    )
 companion object {
   const val typeName = "Node"
 }
 sealed class Realized {
data class Product(
    /**
     * Globally unique identifier.
     */
    val id: ID,
    /**
     * A list of the collections that include the product.
     */
    val collections: Collections
) : Realized() {
    constructor(jsonObject: JsonObject) : this(
        id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java),
        collections = Collections(jsonObject.getAsJsonObject("collections"))
    )
        data class Collections(
        /**
         * A list of edges.
         */
        val edges: ArrayList<Edges>
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            edges = if(!jsonObject.has("edges") || jsonObject.get("edges").isJsonNull) arrayListOf<Edges>() else jsonObject.getAsJsonArray("edges").run {
    val list: ArrayList<Edges> = ArrayList()
    this.forEach { 
    		val edges = Edges(it.asJsonObject)
    		list.add(edges)
    }
    list
    }
        )
            data class Edges(
            /**
             * The item at the end of CollectionEdge.
             */
            val node: Node
        ) : Response {
            constructor(jsonObject: JsonObject) : this(
                node = Node(jsonObject.getAsJsonObject("node"))
            )
                data class Node(
                /**
                 * Globally unique identifier.
                 */
                val id: ID,
                /**
                 * The title of the collection.
                 */
                val title: String
            ) : Response {
                constructor(jsonObject: JsonObject) : this(
                    id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java),
                    title = OperationGsonBuilder.gson.fromJson(jsonObject.get("title"), String::class.java)
                )
            }
        }
    }
}
data class ProductOption(
    /**
     * Globally unique identifier.
     */
    val id: ID
) : Realized() {
    constructor(jsonObject: JsonObject) : this(
        id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java)
    )
}
    object Other: Realized()
}
}
}
