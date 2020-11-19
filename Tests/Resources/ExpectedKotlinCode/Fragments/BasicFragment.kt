
package com.shopify.syrup.fragments

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class BasicFragment(

    /**
     * Globally unique identifier.
     */
    val id: ID,

    /**
     * The customer's last name.
     */
    val lastName: String?
) : Response {
    constructor(jsonObject: JsonObject) : this(
        id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java),
        lastName = if (!jsonObject.has("lastName") || jsonObject.get("lastName").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("lastName"), String::class.java)
    )

    companion object {
        fun getSelections(operationVariables: Map<String, String>): List<Selection> {
            return listOf<Selection>(
Selection(
name = "__typename",
cacheKey = "__typename",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "id",
cacheKey = "id",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "lastName",
cacheKey = "lastName",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))
        }
    }

}
