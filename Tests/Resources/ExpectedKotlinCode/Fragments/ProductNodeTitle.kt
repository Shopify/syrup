
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
        const val typeName = "Product"

        fun getSelections(operationVariables: Map<String, String>): List<Selection> {
            return listOf<Selection>(
Selection(
name = "title",
type = "String",
cacheKey = "title",
passedGID = null,
typeCondition = "Product",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))
        }
    }

}
