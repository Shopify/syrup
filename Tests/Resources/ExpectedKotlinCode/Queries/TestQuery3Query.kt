
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

    override val rawQueryString = "query TestQuery3 { __typename customer(id: \\\"\\\") { __typename addresses { __typename country } defaultAddress { __typename city longitude latitude } } }"

    override fun decodeResponse(jsonObject: JsonObject): TestQuery3Response {
        return TestQuery3Response(jsonObject)
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
name = "customer",
cacheKey = "customer(id: )",
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
name = "addresses",
cacheKey = "addresses",
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
name = "country",
cacheKey = "country",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))), 
Selection(
name = "defaultAddress",
cacheKey = "defaultAddress",
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
name = "city",
cacheKey = "city",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "longitude",
cacheKey = "longitude",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "latitude",
cacheKey = "latitude",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))))
}
