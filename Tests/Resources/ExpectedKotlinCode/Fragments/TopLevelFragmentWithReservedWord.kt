
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
typeCondition = "Product",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))
        }
    }

data class Node(
    val realized: Realized
): Response {
    constructor(jsonObject: JsonObject) : this (
        realized = when (jsonObject.get("__typename").asString) {
            "Product" -> Realized.Product(jsonObject)
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
    val `var`: ID
) : Realized() {
    constructor(jsonObject: JsonObject) : this(
        `var` = OperationGsonBuilder.gson.fromJson(jsonObject.get("var"), ID::class.java)
    )
}
    object Other: Realized()
}
}
}
