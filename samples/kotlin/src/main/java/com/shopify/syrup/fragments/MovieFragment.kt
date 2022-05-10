
package com.shopify.syrup.fragments

// Syrup auto-generated file
import com.shopify.syrup.support.*
import com.shopify.syrup.enums.*
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
    val openingCrawl: String?,

    /**
     * The name of the main character of this film.
     */
    val mainCharacter: String?,

    /**
     * The type of the trilogy
     */
    val trilogyType: TrilogyType?
) : Response {
    constructor(jsonObject: JsonObject) : this(
        title = if (!jsonObject.has("title") || jsonObject.get("title").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("title"), String::class.java),
        director = if (!jsonObject.has("director") || jsonObject.get("director").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("director"), String::class.java),
        openingCrawl = if (!jsonObject.has("openingCrawl") || jsonObject.get("openingCrawl").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("openingCrawl"), String::class.java),
        mainCharacter = if (!jsonObject.has("mainCharacter") || jsonObject.get("mainCharacter").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("mainCharacter"), String::class.java),
        trilogyType = if (jsonObject.has("trilogyType") && !jsonObject.get("trilogyType").isJsonNull) TrilogyType.safeValueOf(jsonObject.decodeEnumValue<TrilogyType>("trilogyType")) else null
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
selections = listOf<Selection>()), 
Selection(
name = "mainCharacter",
type = "String",
cacheKey = "mainCharacter",
passedGID = null,
typeCondition = "Film",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "trilogyType",
type = "TrilogyType",
cacheKey = "trilogyType",
passedGID = null,
typeCondition = "Film",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))
        }
    }

}
