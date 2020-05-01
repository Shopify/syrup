
package com.shopify.syrup.fragments

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class FragmentWithConditional(

    /**
     * The shop's name.
     */
    val name: String?
) : Response {
    constructor(jsonObject: JsonObject) : this(
        name = if (!jsonObject.has("name") || jsonObject.get("name").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("name"), String::class.java)
    )

    companion object {
        const val typeName = "Shop"

        fun getSelections(operationVariables: Map<String, String>): List<Selection> {
            return listOf<Selection>(
Selection(
name = "name",
type = "String",
cacheKey = "name",
passedGID = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = !"${operationVariables["getName"]}".toBoolean(),
selections = listOf<Selection>()))
        }
    }

}
