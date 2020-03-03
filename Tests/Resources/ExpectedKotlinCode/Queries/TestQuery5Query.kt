
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
class TestQuery5Query(): Query<TestQuery5Response> {

    val rawQueryString = "query TestQuery5 { __typename shop { __typename name currencyCode weightUnit billingAddress { __typename city company latitude longitude } fulfillmentServices { __typename serviceName handle } } }"

    override fun decodeResponse(jsonObject: JsonObject): TestQuery5Response {
        return TestQuery5Response(jsonObject)
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
name = "shop",
type = "Shop",
cacheKey = "shop",
passedGID = null,
backingGIDReference = null,
typeCondition = "QueryRoot",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "name",
type = "String",
cacheKey = "name",
passedGID = null,
backingGIDReference = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "currencyCode",
type = "CurrencyCode",
cacheKey = "currencyCode",
passedGID = null,
backingGIDReference = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "weightUnit",
type = "WeightUnit",
cacheKey = "weightUnit",
passedGID = null,
backingGIDReference = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "billingAddress",
type = "MailingAddress",
cacheKey = "billingAddress",
passedGID = null,
backingGIDReference = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "city",
type = "String",
cacheKey = "city",
passedGID = null,
backingGIDReference = null,
typeCondition = "MailingAddress",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "company",
type = "String",
cacheKey = "company",
passedGID = null,
backingGIDReference = null,
typeCondition = "MailingAddress",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "latitude",
type = "Float",
cacheKey = "latitude",
passedGID = null,
backingGIDReference = null,
typeCondition = "MailingAddress",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "longitude",
type = "Float",
cacheKey = "longitude",
passedGID = null,
backingGIDReference = null,
typeCondition = "MailingAddress",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))), 
Selection(
name = "fulfillmentServices",
type = "FulfillmentService",
cacheKey = "fulfillmentServices",
passedGID = null,
backingGIDReference = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "serviceName",
type = "String",
cacheKey = "serviceName",
passedGID = null,
backingGIDReference = null,
typeCondition = "FulfillmentService",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "handle",
type = "String",
cacheKey = "handle",
passedGID = null,
backingGIDReference = null,
typeCondition = "FulfillmentService",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))))
}
