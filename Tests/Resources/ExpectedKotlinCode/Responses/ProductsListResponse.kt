
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class ProductsListResponse(

    /**
     * List of products.
     */
    val products: Products
) : Response {
    constructor(jsonObject: JsonObject) : this(
        products = Products(jsonObject.getAsJsonObject("products"))
    )

        data class Products(
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
             * The item at the end of ProductEdge.
             */
            val node: Node,
            /**
             * A cursor for use in pagination.
             */
            val cursor: String
        ) : Response {
            constructor(jsonObject: JsonObject) : this(
                node = Node(jsonObject.getAsJsonObject("node")),
                cursor = OperationGsonBuilder.gson.fromJson(jsonObject.get("cursor"), String::class.java)
            )
                data class Node(
                /**
                 * Globally unique identifier.
                 */
                val id: ID,
                /**
                 * The title of the product.
                 */
                val title: String,
                /**
                 * A stripped description of the product, single line with HTML tags removed.
                 */
                val description: String
            ) : Response {
                constructor(jsonObject: JsonObject) : this(
                    id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java),
                    title = OperationGsonBuilder.gson.fromJson(jsonObject.get("title"), String::class.java),
                    description = OperationGsonBuilder.gson.fromJson(jsonObject.get("description"), String::class.java)
                )
            }
        }
    }

}
