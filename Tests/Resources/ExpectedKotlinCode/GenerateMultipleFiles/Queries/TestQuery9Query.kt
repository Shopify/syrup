
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
class TestQuery9Query(): Query<TestQuery9Response> {

    override val rawQueryString = "fragment BasicFragment on Customer { __typename id lastName } query TestQuery9 { __typename shop { __typename customers(first: 1) { __typename edges { __typename node { __typename id ... BasicFragment } } } } }"

    override fun decodeResponse(jsonObject: JsonObject): TestQuery9Response {
        return TestQuery9Response(jsonObject)
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
name = "customers",
type = "CustomerConnection",
cacheKey = "customers(first: 1)",
passedGID = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "edges",
type = "CustomerEdge",
cacheKey = "edges",
passedGID = null,
typeCondition = "CustomerConnection",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "node",
type = "Customer",
cacheKey = "node",
passedGID = null,
typeCondition = "CustomerEdge",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "id",
type = "ID",
cacheKey = "id",
passedGID = null,
typeCondition = "Customer",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>())) + BasicFragment.getSelections(operationVariables).map { it.copy(typeCondition = "Customer") }))))))))
}
