
package com.shopify.syrup.fragments

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class ProductNodeTitle(

    /**
     * The title of the product.
     */
    val title: String
) : Response {
    constructor(jsonObject: JsonObject) : this(
        title = OperationGsonBuilder.gson.fromJson(jsonObject.get("title"), String::class.java)
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
name = "title",
cacheKey = "title",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))
        }
    }

}
