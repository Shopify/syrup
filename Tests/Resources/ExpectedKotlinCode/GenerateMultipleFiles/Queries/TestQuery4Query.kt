
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
class TestQuery4Query(): Query<TestQuery4Response> {

    override val rawQueryString = "query TestQuery4 { __typename shop { __typename id availableChannelApps(first: 250) { __typename edges { __typename node { __typename id title } } } } }"

    override fun decodeResponse(jsonObject: JsonObject): TestQuery4Response {
        return TestQuery4Response(jsonObject)
    }

    override val operationVariables = mapOf<String, String>(
    )

    override val selections = listOf<Selection>(
Selection(
name = "shop",
type = "Shop",
cacheKey = "shop",
passedGID = null,
typeCondition = "QueryRoot",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "id",
type = "ID",
cacheKey = "id",
passedGID = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "availableChannelApps",
type = "AppConnection",
cacheKey = "availableChannelApps(first: 250)",
passedGID = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "edges",
type = "AppEdge",
cacheKey = "edges",
passedGID = null,
typeCondition = "AppConnection",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "node",
type = "App",
cacheKey = "node",
passedGID = null,
typeCondition = "AppEdge",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "id",
type = "ID",
cacheKey = "id",
passedGID = null,
typeCondition = "App",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "title",
type = "String",
cacheKey = "title",
passedGID = null,
typeCondition = "App",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))))))))
}
