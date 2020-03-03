
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
class TestQuery2Query(): Query<TestQuery2Response> {

    val rawQueryString = "query TestQuery2 { __typename shop { __typename name id email alerts { __typename action { __typename title url } description } } }"

    override fun decodeResponse(jsonObject: JsonObject): TestQuery2Response {
        return TestQuery2Response(jsonObject)
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
backingGIDReference = "id",
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
name = "id",
type = "ID",
cacheKey = "id",
passedGID = null,
backingGIDReference = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "email",
type = "String",
cacheKey = "email",
passedGID = null,
backingGIDReference = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "alerts",
type = "ShopAlert",
cacheKey = "alerts",
passedGID = null,
backingGIDReference = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "action",
type = "ShopAlertAction",
cacheKey = "action",
passedGID = null,
backingGIDReference = null,
typeCondition = "ShopAlert",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "title",
type = "String",
cacheKey = "title",
passedGID = null,
backingGIDReference = null,
typeCondition = "ShopAlertAction",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "url",
type = "URL",
cacheKey = "url",
passedGID = null,
backingGIDReference = null,
typeCondition = "ShopAlertAction",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))), 
Selection(
name = "description",
type = "String",
cacheKey = "description",
passedGID = null,
backingGIDReference = null,
typeCondition = "ShopAlert",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))))
}
