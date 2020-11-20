
package com.shopify.syrup.fragments

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class TimelineFragment(

    /**
     * Information to aid in pagination.
     */
    val pageInfo: PageInfo,

    /**
     * A list of edges.
     */
    val edges: ArrayList<Edges>
) : Response {
    constructor(jsonObject: JsonObject) : this(
        pageInfo = PageInfo(jsonObject.getAsJsonObject("pageInfo")),
        edges = if(!jsonObject.has("edges") || jsonObject.get("edges").isJsonNull) arrayListOf<Edges>() else jsonObject.getAsJsonArray("edges").run {
val list: ArrayList<Edges> = ArrayList()
this.forEach { 
		val edges = Edges(it.asJsonObject)
		list.add(edges)
}
list
}
    )

    companion object {
        fun getSelections(operationVariables: Map<String, String>): List<Selection> {
            return listOf<Selection>(
Selection(
name = "__typename",
cacheKey = "__typename",
passedGID = null,
typeCondition = "EventConnection",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "pageInfo",
cacheKey = "pageInfo",
passedGID = null,
typeCondition = "EventConnection",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "__typename",
cacheKey = "__typename",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "hasNextPage",
cacheKey = "hasNextPage",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))), 
Selection(
name = "edges",
cacheKey = "edges",
passedGID = null,
typeCondition = "EventConnection",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "__typename",
cacheKey = "__typename",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "cursor",
cacheKey = "cursor",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "node",
cacheKey = "node",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "__typename",
cacheKey = "__typename",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "id",
cacheKey = "id",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "createdAt",
cacheKey = "createdAt",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "message",
cacheKey = "message",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "attributeToApp",
cacheKey = "attributeToApp",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "attributeToUser",
cacheKey = "attributeToUser",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "criticalAlert",
cacheKey = "criticalAlert",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>())) + CommentEventFragment.getSelections(operationVariables)))))
        }
    }

        data class PageInfo(
        /**
         * Indicates if there are more pages to fetch.
         */
        val hasNextPage: Boolean
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            hasNextPage = OperationGsonBuilder.gson.fromJson(jsonObject.get("hasNextPage"), Boolean::class.java)
        )
    }
        data class Edges(
        /**
         * A cursor for use in pagination.
         */
        val cursor: String,
        /**
         * The item at the end of EventEdge.
         */
        val node: Node
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            cursor = OperationGsonBuilder.gson.fromJson(jsonObject.get("cursor"), String::class.java),
            node = Node(jsonObject.getAsJsonObject("node"))
        )
    data class Node(
        val realized: Realized,
        val id: ID ,
        val createdAt: DateTime ,
        val message: String ,
        val attributeToApp: Boolean ,
        val attributeToUser: Boolean ,
        val criticalAlert: Boolean 
    ): Response {
        constructor(jsonObject: JsonObject) : this (
            realized = when (jsonObject.get("__typename").asString) {
                "CommentEvent" -> Realized.CommentEvent(jsonObject)
                else -> Realized.Other
            },
            id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java),
            createdAt = OperationGsonBuilder.gson.fromJson(jsonObject.get("createdAt"), DateTime::class.java),
            message = OperationGsonBuilder.gson.fromJson(jsonObject.get("message"), String::class.java),
            attributeToApp = OperationGsonBuilder.gson.fromJson(jsonObject.get("attributeToApp"), Boolean::class.java),
            attributeToUser = OperationGsonBuilder.gson.fromJson(jsonObject.get("attributeToUser"), Boolean::class.java),
            criticalAlert = OperationGsonBuilder.gson.fromJson(jsonObject.get("criticalAlert"), Boolean::class.java)
        )
     companion object {
       const val typeName = "Event"
     }
     sealed class Realized {
    data class CommentEvent(
        val commentEventFragment: com.shopify.syrup.fragments.CommentEventFragment
    ) : Realized() {
        constructor(jsonObject: JsonObject) : this(
            commentEventFragment = com.shopify.syrup.fragments.CommentEventFragment(jsonObject)
        )
    }
        object Other: Realized()
    }
    }
    }

}
