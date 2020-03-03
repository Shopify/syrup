
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class MarketingOptInLevelResponse(

    /**
     * List of customers.
     */
    val customers: Customers
) : Response {
    constructor(jsonObject: JsonObject) : this(
        customers = Customers(jsonObject.getAsJsonObject("customers"))
    )

    companion object {
        const val typeName = "QueryRoot"

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
                 * The marketing subscription opt-in level (as described by the M3AAWG best practices guideline) that the
                 * customer gave when they consented to receive marketing material by email.
                 * If the customer does not accept email marketing, then this property will be null.
                 */
                val marketingOptInLevel: CustomerMarketingOptInLevel?
            ) : Response {
                constructor(jsonObject: JsonObject) : this(
                    marketingOptInLevel = if (jsonObject.has("marketingOptInLevel") && !jsonObject.get("marketingOptInLevel").isJsonNull) CustomerMarketingOptInLevel.safeValueOf(jsonObject.decodeEnumValue<CustomerMarketingOptInLevel>("marketingOptInLevel")) else null
                )
                companion object {
                    const val typeName = "Customer"
                }
            }
        }
    }

}
