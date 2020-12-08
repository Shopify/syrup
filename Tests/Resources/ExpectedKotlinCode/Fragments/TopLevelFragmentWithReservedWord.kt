
package com.shopify.syrup.fragments

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class TopLevelFragmentWithReservedWord(

    /**
     * Returns a specific node by ID.
     */
    val node: Node?
) : Response {
    constructor(jsonObject: JsonObject) : this(
        node = if (jsonObject.has("node") && !jsonObject.get("node").isJsonNull) Node(jsonObject.getAsJsonObject("node")) else null
    )

    companion object {
        fun getSelections(operationVariables: Map<String, String>): List<Selection> {
            return listOf<Selection>(
Selection(
name = "node",
type = "Node",
cacheKey = "node(id: )",
passedGID = null,
typeCondition = "QueryRoot",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "var",
type = "ID",
cacheKey = "var",
passedGID = null,
typeCondition = "Node",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))
        }
    }

data class Node(
    val realized: Realized,
    val `var`: ID 
): Response {
    constructor(jsonObject: JsonObject) : this (
        realized = when (jsonObject.get("__typename").asString) {
            else -> Realized.Other
        },
        `var` = OperationGsonBuilder.gson.fromJson(jsonObject.get("var"), ID::class.java)
    )
 companion object {
   const val typeName = "Node"
 }
 sealed class Realized {
    object Other: Realized()
}
}
}
