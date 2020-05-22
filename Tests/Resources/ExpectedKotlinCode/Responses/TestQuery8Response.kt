
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class TestQuery8Response(

    /**
     * Returns a Shop resource corresponding to access token used in request.
     */
    val shop: Shop
) : Response {
    constructor(jsonObject: JsonObject) : this(
        shop = Shop(jsonObject.getAsJsonObject("shop"))
    )

        data class Shop(
        /**
         * Globally unique identifier.
         */
        val id: ID,
        /**
         * List of the shop's products.
         */
        @Deprecated("""Use `QueryRoot.products`.""")
        val firstProduct: FirstProduct,
        /**
         * List of the shop's products.
         */
        @Deprecated("""Use `QueryRoot.products`.""")
        val lastProduct: LastProduct
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java),
            firstProduct = FirstProduct(jsonObject.getAsJsonObject("firstProduct")),
            lastProduct = LastProduct(jsonObject.getAsJsonObject("lastProduct"))
        )
            data class FirstProduct(
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
                 * A cursor for use in pagination.
                 */
                val cursor: String,
                /**
                 * The item at the end of ProductEdge.
                 */
                val node: Node
            ) : Response {
                constructor(jsonObject: JsonObject) : this(
                    cursor = OperationGsonBuilder.gson.fromJson(jsonObject.get("cursor"), String::class.java),
                    node = Node(jsonObject.getAsJsonObject("node"))
                )
                    data class Node(
                    /**
                     * The title of the product.
                     */
                    val title: String
                ) : Response {
                    constructor(jsonObject: JsonObject) : this(
                        title = OperationGsonBuilder.gson.fromJson(jsonObject.get("title"), String::class.java)
                    )
                }
            }
        }
            data class LastProduct(
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
                 * A cursor for use in pagination.
                 */
                val cursor: String,
                /**
                 * The item at the end of ProductEdge.
                 */
                val node: Node
            ) : Response {
                constructor(jsonObject: JsonObject) : this(
                    cursor = OperationGsonBuilder.gson.fromJson(jsonObject.get("cursor"), String::class.java),
                    node = Node(jsonObject.getAsJsonObject("node"))
                )
                    data class Node(
                    /**
                     * The title of the product.
                     */
                    val title: String
                ) : Response {
                    constructor(jsonObject: JsonObject) : this(
                        title = OperationGsonBuilder.gson.fromJson(jsonObject.get("title"), String::class.java)
                    )
                }
            }
        }
    }

}
