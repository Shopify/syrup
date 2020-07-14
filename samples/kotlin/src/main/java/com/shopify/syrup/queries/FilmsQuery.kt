
package com.shopify.syrup.queries

// Syrup auto-generated file
import com.google.gson.*
import com.shopify.syrup.fragments.*
import com.shopify.syrup.responses.*
import com.shopify.syrup.support.*
import javax.annotation.Generated

@Generated("com.shopify.syrup")
class FilmsQuery() : Query<FilmsResponse> {

    val rawQueryString = "fragment MovieFragment on Film { __typename title director openingCrawl } query Films { __typename allFilms { __typename edges { __typename node { __typename ... MovieFragment } } } }"

    override fun decodeResponse(jsonObject: JsonObject): FilmsResponse {
        return FilmsResponse(jsonObject)
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

    val operationVariables = mapOf<String, String>()

    override val selections = listOf<Selection>(
        Selection(
            name = "allFilms",
            type = "FilmsConnection",
            cacheKey = "allFilms",
            passedGID = null,
            backingGIDReference = null,
            typeCondition = "Root",
            shouldSkipBasedOnConditionalDirective = false,
            selections = listOf<Selection>(
                Selection(
                    name = "edges",
                    type = "FilmsEdge",
                    cacheKey = "edges",
                    passedGID = null,
                    backingGIDReference = null,
                    typeCondition = "FilmsConnection",
                    shouldSkipBasedOnConditionalDirective = false,
                    selections = listOf<Selection>(
                        Selection(
                            name = "node",
                            type = "Film",
                            cacheKey = "node",
                            passedGID = null,
                            backingGIDReference = null,
                            typeCondition = "FilmsEdge",
                            shouldSkipBasedOnConditionalDirective = false,
                            selections = listOf<Selection>() + MovieFragment.getSelections(operationVariables).map { it.copy(typeCondition = "Film") }
                        )
                    )
                )
            )
        )
    )
}
