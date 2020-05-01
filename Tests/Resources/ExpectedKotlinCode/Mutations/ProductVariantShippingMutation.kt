
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
class ProductVariantShippingMutation(var variantInput: ProductVariantInput): Mutation<ProductVariantShippingResponse> {

    override val rawQueryString = "mutation ProductVariantShipping(\$variantInput: ProductVariantInput!) { __typename productVariantUpdate(input: \$variantInput) { __typename productVariant { __typename id weight weightUnit requiresShipping harmonizedSystemCode } userErrors { __typename message field } } }"

    override fun decodeResponse(jsonObject: JsonObject): ProductVariantShippingResponse {
        return ProductVariantShippingResponse(jsonObject)
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
selections = listOf<Selection>()), 
Selection(
name = "weight",
type = "Float",
cacheKey = "weight",
passedGID = null,
typeCondition = "ProductVariant",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "weightUnit",
type = "WeightUnit",
cacheKey = "weightUnit",
passedGID = null,
typeCondition = "ProductVariant",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "requiresShipping",
type = "Boolean",
cacheKey = "requiresShipping",
passedGID = null,
typeCondition = "ProductVariant",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "harmonizedSystemCode",
type = "String",
cacheKey = "harmonizedSystemCode",
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
selections = listOf<Selection>(
Selection(
name = "message",
type = "String",
cacheKey = "message",
passedGID = null,
typeCondition = "UserError",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "field",
type = "String",
cacheKey = "field",
passedGID = null,
typeCondition = "UserError",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))))
}
