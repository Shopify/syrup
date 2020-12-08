
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
class QueryWithReservedWordOnInlineFragmentQuery(): Query<QueryWithReservedWordOnInlineFragmentResponse> {

    override val rawQueryString = "query QueryWithReservedWordOnInlineFragment { __typename node(id: \\\"123\\\") { __typename id ... on Product { __typename val: title } } }"

    override fun decodeResponse(jsonObject: JsonObject): QueryWithReservedWordOnInlineFragmentResponse {
        return QueryWithReservedWordOnInlineFragmentResponse(jsonObject)
    }

    override val operationVariables = mapOf<String, String>(
    )

    override val selections = listOf<Selection>(
Selection(
name = "node",
type = "Node",
cacheKey = "node(id: 123)",
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
selections = listOf<Selection>()), 
Selection(
name = "val",
type = "String",
cacheKey = "val",
passedGID = null,
typeCondition = "Product",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))
}
