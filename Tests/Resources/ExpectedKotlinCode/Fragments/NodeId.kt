
package com.shopify.syrup.fragments

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class NodeId(
    val realized: Realized,
    val id: ID 
): Response {
    constructor(jsonObject: JsonObject) : this (
        realized = when (jsonObject.get("__typename").asString) {
            else -> Realized.Other
        },
        id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java)
    )
 companion object {
   const val typeName = "Node"
   fun getSelections(operationVariables: Map<String, String>): List<Selection> {
     return listOf<Selection>(
Selection(
name = "__typename",
cacheKey = "__typename",
passedGID = null,
typeCondition = "Node",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "id",
cacheKey = "id",
passedGID = null,
typeCondition = "Node",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))
   }
 }
 sealed class Realized {
    object Other: Realized()
}

}
