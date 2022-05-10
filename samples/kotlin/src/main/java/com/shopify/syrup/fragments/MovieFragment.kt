
package com.shopify.syrup.fragments

// Syrup auto-generated file
import com.shopify.syrup.support.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class MovieFragment(

    /**
     * The title of this film.
     */
    val title: String?,

    /**
     * The name of the director of this film.
     */
    @Deprecated("""Use assistant name instead""")
    val director: String?,

    /**
     * The opening paragraphs at the beginning of this film.
     */
    val openingCrawl: String?
) : Response {
    constructor(jsonObject: JsonObject) : this(
        title = if (!jsonObject.has("title") || jsonObject.get("title").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("title"), String::class.java),
        director = if (!jsonObject.has("director") || jsonObject.get("director").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("director"), String::class.java),
        openingCrawl = if (!jsonObject.has("openingCrawl") || jsonObject.get("openingCrawl").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("openingCrawl"), String::class.java)
    )

    companion object {
        fun getSelections(operationVariables: Map<String, String>): List<Selection> {
            return listOf<Selection>(
Selection(
name = "title",
type = "String",
cacheKey = "title",
passedGID = null,
typeCondition = "Film",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "director",
type = "String",
cacheKey = "director",
passedGID = null,
typeCondition = "Film",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "openingCrawl",
type = "String",
cacheKey = "openingCrawl",
passedGID = null,
typeCondition = "Film",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))
        }
    }

}
