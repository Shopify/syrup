
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

    override val rawQueryString = "query TestQuery10(\$priceRuleId: ID!) { __typename priceRule(id: \$priceRuleId) { __typename id value { __typename __typename ... on PriceRulePercentValue { __typename percentage }... on PriceRuleFixedAmountValue { __typename amount } } valueV2 { __typename __typename ... on MoneyV2 { __typename amount }... on PricingPercentageValue { __typename percentage } } } }"

    override fun decodeResponse(jsonObject: JsonObject): TestQuery10Response {
        return TestQuery10Response(jsonObject)
    }

    override val operationVariables = mapOf<String, String>(
        "priceRuleId" to "$priceRuleId"
    )

    override val selections = listOf<Selection>(
Selection(
name = "priceRule",
type = "PriceRule",
cacheKey = "priceRule(id: ${operationVariables["priceRuleId"]})",
passedGID = "${operationVariables["priceRuleId"]}",
typeCondition = "QueryRoot",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "id",
type = "ID",
cacheKey = "id",
passedGID = null,
typeCondition = "PriceRule",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "value",
type = "PriceRuleValue",
cacheKey = "value",
passedGID = null,
typeCondition = "PriceRule",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "percentage",
type = "Float",
cacheKey = "percentage",
passedGID = null,
typeCondition = "PriceRulePercentValue",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "amount",
type = "Money",
cacheKey = "amount",
passedGID = null,
typeCondition = "PriceRuleFixedAmountValue",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))), 
Selection(
name = "valueV2",
type = "PricingValue",
cacheKey = "valueV2",
passedGID = null,
typeCondition = "PriceRule",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "amount",
type = "Decimal",
cacheKey = "amount",
passedGID = null,
typeCondition = "MoneyV2",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "percentage",
type = "Float",
cacheKey = "percentage",
passedGID = null,
typeCondition = "PricingPercentageValue",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))))
}
