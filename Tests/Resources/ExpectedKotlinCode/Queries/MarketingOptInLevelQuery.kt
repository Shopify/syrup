
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

    val rawQueryString = "query MarketingOptInLevel { __typename customers(first: 5) { __typename edges { __typename node { __typename marketingOptInLevel } } } }"

    override fun decodeResponse(jsonObject: JsonObject): MarketingOptInLevelResponse {
        return MarketingOptInLevelResponse(jsonObject)
    }

    override fun getQueryString(): String {
        val gson = OperationGsonBuilder.gson
        var variables = gson.toJson(this)
        if (variables != "{}") {
            variables = setDefinedNulls(variables)
            return "{ \"query\": \"$rawQueryString\", \"variables\": $variables}"
        }
        return "{ \"query\": \"$rawQueryString\" }"
    }

    val operationVariables = mapOf<String, String>(
    )

    override val selections = listOf<Selection>(
Selection(
name = "customers",
type = "CustomerConnection",
cacheKey = "customers(first: 5)",
passedGID = null,
backingGIDReference = null,
typeCondition = "QueryRoot",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "edges",
type = "CustomerEdge",
cacheKey = "edges",
passedGID = null,
backingGIDReference = null,
typeCondition = "CustomerConnection",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "node",
type = "Customer",
cacheKey = "node",
passedGID = null,
backingGIDReference = null,
typeCondition = "CustomerEdge",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "marketingOptInLevel",
type = "CustomerMarketingOptInLevel",
cacheKey = "marketingOptInLevel",
passedGID = null,
backingGIDReference = null,
typeCondition = "Customer",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))))))
}
