
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
class TestDeprecatedFieldsQuery(var first: Int? = null): Query<TestDeprecatedFieldsResponse> {

    override val rawQueryString = "query TestDeprecatedFields(\$first: Int) { __typename channels(first: \$first) { __typename edges { __typename node { __typename app { __typename id icon { __typename src } } } } } }"

    override fun decodeResponse(jsonObject: JsonObject): TestDeprecatedFieldsResponse {
        return TestDeprecatedFieldsResponse(jsonObject)
    }

    override val operationVariables = mapOf<String, String>(
        "first" to "$first"
    )

    override val selections = listOf<Selection>(
Selection(
name = "channels",
type = "ChannelConnection",
cacheKey = "channels(first: ${operationVariables["first"]})",
passedGID = null,
typeCondition = "QueryRoot",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "edges",
type = "ChannelEdge",
cacheKey = "edges",
passedGID = null,
typeCondition = "ChannelConnection",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "node",
type = "Channel",
cacheKey = "node",
passedGID = null,
typeCondition = "ChannelEdge",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "app",
type = "App",
cacheKey = "app",
passedGID = null,
typeCondition = "Channel",
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
name = "icon",
type = "Image",
cacheKey = "icon",
passedGID = null,
typeCondition = "App",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "src",
type = "URL",
cacheKey = "src",
passedGID = null,
typeCondition = "Image",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))))))))))
}
