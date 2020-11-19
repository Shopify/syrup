
package com.shopify.syrup.queries

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
class TestQuery10Query(var priceRuleId: ID): Query<TestQuery10Response> {

    override val rawQueryString = "query TestQuery10(\$priceRuleId: ID!) { __typename priceRule(id: \$priceRuleId) { __typename id value { __typename ... on PriceRulePercentValue { __typename percentage }... on PriceRuleFixedAmountValue { __typename amount } } valueV2 { __typename ... on MoneyV2 { __typename amount }... on PricingPercentageValue { __typename percentage } } } }"

    override fun decodeResponse(jsonObject: JsonObject): TestQuery10Response {
        return TestQuery10Response(jsonObject)
    }

    override val operationVariables = mapOf<String, String>(
        "priceRuleId" to "$priceRuleId"
    )

    override val selections = listOf<Selection>(
Selection(
name = "__typename",
cacheKey = "__typename",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "priceRule",
cacheKey = "priceRule(id: ${operationVariables["priceRuleId"]})",
passedGID = "${operationVariables["priceRuleId"]}",
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
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
name = "value",
cacheKey = "value",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "__typename",
cacheKey = "__typename",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "__typename",
cacheKey = "__typename",
passedGID = null,
typeCondition = "PriceRulePercentValue",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "percentage",
cacheKey = "percentage",
passedGID = null,
typeCondition = "PriceRulePercentValue",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "__typename",
cacheKey = "__typename",
passedGID = null,
typeCondition = "PriceRuleFixedAmountValue",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "amount",
cacheKey = "amount",
passedGID = null,
typeCondition = "PriceRuleFixedAmountValue",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))), 
Selection(
name = "valueV2",
cacheKey = "valueV2",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "__typename",
cacheKey = "__typename",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "__typename",
cacheKey = "__typename",
passedGID = null,
typeCondition = "MoneyV2",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "amount",
cacheKey = "amount",
passedGID = null,
typeCondition = "MoneyV2",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "__typename",
cacheKey = "__typename",
passedGID = null,
typeCondition = "PricingPercentageValue",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "percentage",
cacheKey = "percentage",
passedGID = null,
typeCondition = "PricingPercentageValue",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))))
}
