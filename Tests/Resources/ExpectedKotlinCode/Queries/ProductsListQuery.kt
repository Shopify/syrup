
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
class ProductsListQuery(var first: Int? = null, var before: String? = null, var after: String? = null): Query<ProductsListResponse> {

    override val rawQueryString = "query ProductsList(\$first: Int, \$before: String, \$after: String) { __typename products(first: \$first, reverse: true, before: \$before, after: \$after, sortKey: CREATED_AT) { __typename edges { __typename node { __typename id title description } cursor } } }"

    override fun decodeResponse(jsonObject: JsonObject): ProductsListResponse {
        return ProductsListResponse(jsonObject)
    }

    override val operationVariables = mapOf<String, String>(
        "first" to "$first",
"before" to "$before",
"after" to "$after"
    )

    override val selections = listOf<Selection>(
Selection(
name = "products",
type = "ProductConnection",
cacheKey = "products(first: ${operationVariables["first"]}, reverse: true, before: ${operationVariables["before"]}, after: ${operationVariables["after"]}, sortKey: CREATED_AT)",
passedGID = null,
typeCondition = "QueryRoot",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "edges",
type = "ProductEdge",
cacheKey = "edges",
passedGID = null,
typeCondition = "ProductConnection",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "node",
type = "Product",
cacheKey = "node",
passedGID = null,
typeCondition = "ProductEdge",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "id",
type = "ID",
cacheKey = "id",
passedGID = null,
typeCondition = "Product",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "title",
type = "String",
cacheKey = "title",
passedGID = null,
typeCondition = "Product",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "description",
type = "String",
cacheKey = "description",
passedGID = null,
typeCondition = "Product",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))), 
Selection(
name = "cursor",
type = "String",
cacheKey = "cursor",
passedGID = null,
typeCondition = "ProductEdge",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))))
}
