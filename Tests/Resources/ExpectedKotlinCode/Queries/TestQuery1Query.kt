
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
class TestQuery1Query(): Query<TestQuery1Response> {

    val rawQueryString = "query TestQuery1 { __typename shop { __typename id name currencyCode weightUnit billingAddress { __typename city company latitude longitude } alerts { __typename description } shipsToCountries paymentSettings { __typename supportedDigitalWallets } } }"

    override fun decodeResponse(jsonObject: JsonObject): TestQuery1Response {
        return TestQuery1Response(jsonObject)
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
name = "id",
type = "ID",
cacheKey = "id",
passedGID = null,
backingGIDReference = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
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
name = "alerts",
type = "ShopAlert",
cacheKey = "alerts",
passedGID = null,
backingGIDReference = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "description",
type = "String",
cacheKey = "description",
passedGID = null,
backingGIDReference = null,
typeCondition = "ShopAlert",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))), 
Selection(
name = "shipsToCountries",
type = "CountryCode",
cacheKey = "shipsToCountries",
passedGID = null,
backingGIDReference = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "paymentSettings",
type = "PaymentSettings",
cacheKey = "paymentSettings",
passedGID = null,
backingGIDReference = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "supportedDigitalWallets",
type = "DigitalWallet",
cacheKey = "supportedDigitalWallets",
passedGID = null,
backingGIDReference = null,
typeCondition = "PaymentSettings",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))))
}
