
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import com.shopify.syrup.fragments.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class TestQuery9Response(

    /**
     * Returns a Shop resource corresponding to access token used in request.
     */
    val shop: Shop
) : Response {
    constructor(jsonObject: JsonObject) : this(
        shop = Shop(jsonObject.getAsJsonObject("shop"))
    )

    companion object {
        const val typeName = "QueryRoot"

    }

        data class Shop(
        /**
         * Customer accounts associated to the shop.
         */
        @Deprecated("""Use `QueryRoot.customers` instead.""")
        val customers: Customers
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            customers = Customers(jsonObject.getAsJsonObject("customers"))
        )
        companion object {
            const val typeName = "Shop"
        }
            data class Customers(
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
            companion object {
                const val typeName = "CustomerConnection"
            }
                data class Edges(
                /**
                 * The item at the end of CustomerEdge.
                 */
                val node: Node
            ) : Response {
                constructor(jsonObject: JsonObject) : this(
                    node = Node(jsonObject.getAsJsonObject("node"))
                )
                companion object {
                    const val typeName = "CustomerEdge"
                }
                    data class Node(
                    /**
                     * Globally unique identifier.
                     */
                    val id: ID,
                    val basicFragment: com.shopify.syrup.fragments.BasicFragment
                ) : Response {
                    constructor(jsonObject: JsonObject) : this(
                        id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java),
                        basicFragment = com.shopify.syrup.fragments.BasicFragment(jsonObject)
                    )
                    companion object {
                        const val typeName = "Customer"
                    }
                }
            }
        }
    }

}
