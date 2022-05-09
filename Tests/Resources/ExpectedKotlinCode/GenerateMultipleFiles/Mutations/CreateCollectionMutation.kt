
package com.shopify.syrup.mutations

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
class CreateCollectionMutation(var input: CollectionInput): Mutation<CreateCollectionResponse> {

    override val rawQueryString = "mutation CreateCollection(\$input: CollectionInput!) { __typename collectionCreate(input: \$input) { __typename userErrors { __typename field message } collection { __typename title id feedback { __typename summary } } } }"

    override fun decodeResponse(jsonObject: JsonObject): CreateCollectionResponse {
        return CreateCollectionResponse(jsonObject)
    }

    override val operationVariables = mapOf<String, String>(
        "input" to "$input"
    )

    override val selections = listOf<Selection>(
Selection(
name = "collectionCreate",
type = "CollectionCreatePayload",
cacheKey = "collectionCreate(input: ${operationVariables["input"]})",
passedGID = null,
typeCondition = "Mutation",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "userErrors",
type = "UserError",
cacheKey = "userErrors",
passedGID = null,
typeCondition = "CollectionCreatePayload",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "field",
type = "String",
cacheKey = "field",
passedGID = null,
typeCondition = "UserError",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "message",
type = "String",
cacheKey = "message",
passedGID = null,
typeCondition = "UserError",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))), 
Selection(
name = "collection",
type = "Collection",
cacheKey = "collection",
passedGID = null,
typeCondition = "CollectionCreatePayload",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "title",
type = "String",
cacheKey = "title",
passedGID = null,
typeCondition = "Collection",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "id",
type = "ID",
cacheKey = "id",
passedGID = null,
typeCondition = "Collection",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "feedback",
type = "ResourceFeedback",
cacheKey = "feedback",
passedGID = null,
typeCondition = "Collection",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "summary",
type = "String",
cacheKey = "summary",
passedGID = null,
typeCondition = "ResourceFeedback",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))))))
}
