
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
class QueryWithReservedWordQuery(): Query<QueryWithReservedWordResponse> {

    override val rawQueryString = "query QueryWithReservedWord { __typename class: shop { __typename return: id fun: name } }"

    override fun decodeResponse(jsonObject: JsonObject): QueryWithReservedWordResponse {
        return QueryWithReservedWordResponse(jsonObject)
    }

    override val operationVariables = mapOf<String, String>(
    )

    override val selections = listOf<Selection>(
Selection(
name = "class",
type = "Shop",
cacheKey = "class",
passedGID = null,
typeCondition = "QueryRoot",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "return",
type = "ID",
cacheKey = "return",
passedGID = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "fun",
type = "String",
cacheKey = "fun",
passedGID = null,
typeCondition = "Shop",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))
}
