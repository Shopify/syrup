
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class TestQuery4Response(

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
         * List of sales channels not currently installed on the shop.
         */
        val availableChannelApps: AvailableChannelApps
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java),
            availableChannelApps = AvailableChannelApps(jsonObject.getAsJsonObject("availableChannelApps"))
        )
            data class AvailableChannelApps(
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
                 * The item at the end of AppEdge.
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
                     * Name of the app.
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

}
