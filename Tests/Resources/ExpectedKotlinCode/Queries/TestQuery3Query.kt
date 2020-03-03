
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
class TestQuery3Query(): Query<TestQuery3Response> {

    val rawQueryString = "query TestQuery3 { __typename customer(id: \\\"\\\") { __typename addresses { __typename country } defaultAddress { __typename city longitude latitude } } }"

    override fun decodeResponse(jsonObject: JsonObject): TestQuery3Response {
        return TestQuery3Response(jsonObject)
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
name = "customer",
type = "Customer",
cacheKey = "customer(id: )",
passedGID = null,
backingGIDReference = null,
typeCondition = "QueryRoot",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "addresses",
type = "MailingAddress",
cacheKey = "addresses",
passedGID = null,
backingGIDReference = null,
typeCondition = "Customer",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "country",
type = "String",
cacheKey = "country",
passedGID = null,
backingGIDReference = null,
typeCondition = "MailingAddress",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))), 
Selection(
name = "defaultAddress",
type = "MailingAddress",
cacheKey = "defaultAddress",
passedGID = null,
backingGIDReference = null,
typeCondition = "Customer",
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
name = "longitude",
type = "Float",
cacheKey = "longitude",
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
selections = listOf<Selection>()))))))
}
