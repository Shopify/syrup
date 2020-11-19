
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
class MarketingOptInLevelQuery(): Query<MarketingOptInLevelResponse> {

    override val rawQueryString = "query MarketingOptInLevel { __typename customers(first: 5) { __typename edges { __typename node { __typename marketingOptInLevel } } } }"

    override fun decodeResponse(jsonObject: JsonObject): MarketingOptInLevelResponse {
        return MarketingOptInLevelResponse(jsonObject)
    }

    override val operationVariables = mapOf<String, String>(
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
name = "customers",
cacheKey = "customers(first: 5)",
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
name = "edges",
cacheKey = "edges",
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
name = "node",
cacheKey = "node",
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
name = "marketingOptInLevel",
cacheKey = "marketingOptInLevel",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))))))
}
