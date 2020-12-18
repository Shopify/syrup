
package com.shopify.syrup.mutations

import com.shopify.foundation.syrupsupport.*
import com.google.gson.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.shopify.syrup.enums.*
import com.shopify.syrup.inputs.*
import com.shopify.syrup.fragments.*
import com.shopify.syrup.responses.*
import javax.annotation.Generated

@Generated("com.shopify.syrup")
class ProductVariantShippingWithUserErrorsMutation(var variantInput: ProductVariantInput): Mutation<ProductVariantShippingWithUserErrorsResponse> {

    override val rawQueryString = "fragment UserError on UserError { __typename message field } mutation ProductVariantShippingWithUserErrors(\$variantInput: ProductVariantInput!) { __typename productVariantUpdate(input: \$variantInput) { __typename productVariant { __typename id } userErrors { __typename ... UserError } } }"

    override fun decodeResponse(jsonObject: JsonObject): ProductVariantShippingWithUserErrorsResponse {
        return ProductVariantShippingWithUserErrorsResponse(jsonObject)
    }

    override val operationVariables = mapOf<String, String>(
        "variantInput" to "$variantInput"
    )

    override val selections = listOf<Selection>(
Selection(
name = "productVariantUpdate",
type = "ProductVariantUpdatePayload",
cacheKey = "productVariantUpdate(input: ${operationVariables["variantInput"]})",
passedGID = null,
typeCondition = "Mutation",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "productVariant",
type = "ProductVariant",
cacheKey = "productVariant",
passedGID = null,
typeCondition = "ProductVariantUpdatePayload",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "id",
type = "ID",
cacheKey = "id",
passedGID = null,
typeCondition = "ProductVariant",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))), 
Selection(
name = "userErrors",
type = "UserError",
cacheKey = "userErrors",
passedGID = null,
typeCondition = "ProductVariantUpdatePayload",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>() + UserError.getSelections(operationVariables).map { it.copy(typeCondition = "UserError") }))))
}
