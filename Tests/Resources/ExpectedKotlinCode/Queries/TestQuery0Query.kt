
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
class TestQuery0Query(): Query<TestQuery0Response> {

    override val rawQueryString = "query TestQuery0 { __typename nodes(ids: [\\\"gid://shopify/Customer/350635977\\\"]) { __typename id } }"

    override fun decodeResponse(jsonObject: JsonObject): TestQuery0Response {
        return TestQuery0Response(jsonObject)
    }

    override val operationVariables = mapOf<String, String>(
    )

    override val selections = listOf<Selection>(
Selection(
name = "nodes",
type = "Node",
cacheKey = "nodes(ids: [gid://shopify/Customer/350635977])",
passedGID = null,
typeCondition = "QueryRoot",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "id",
type = "ID",
cacheKey = "id",
passedGID = null,
typeCondition = "Node",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))
}
