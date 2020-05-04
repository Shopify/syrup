
package com.shopify.syrup.fragments

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class Shop(

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

        fun getSelections(operationVariables: Map<String, String>): List<Selection> {
            return listOf<Selection>(
Selection(
name = "shop",
type = "Shop",
cacheKey = "shop",
passedGID = null,
typeCondition = "QueryRoot",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "availableChannelApps",
type = "AppConnection",
cacheKey = "availableChannelApps(first: ${operationVariables["first"]})",
passedGID = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "edges",
type = "AppEdge",
cacheKey = "edges",
passedGID = null,
typeCondition = "AppConnection",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "node",
type = "App",
cacheKey = "node",
passedGID = null,
typeCondition = "AppEdge",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "id",
type = "ID",
cacheKey = "id",
passedGID = null,
typeCondition = "App",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))))))))
        }
    }

        data class Shop(
        /**
         * List of sales channels not currently installed on the shop.
         */
        val availableChannelApps: AvailableChannelApps
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            availableChannelApps = AvailableChannelApps(jsonObject.getAsJsonObject("availableChannelApps"))
        )
        companion object {
            const val typeName = "Shop"
        }
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
            companion object {
                const val typeName = "AppConnection"
            }
                data class Edges(
                /**
                 * The item at the end of AppEdge.
                 */
                val node: Node
            ) : Response {
                constructor(jsonObject: JsonObject) : this(
                    node = Node(jsonObject.getAsJsonObject("node"))
                )
                companion object {
                    const val typeName = "AppEdge"
                }
                    data class Node(
                    /**
                     * Globally unique identifier.
                     */
                    val id: ID
                ) : Response {
                    constructor(jsonObject: JsonObject) : this(
                        id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java)
                    )
                    companion object {
                        const val typeName = "App"
                    }
                }
            }
        }
    }

}
