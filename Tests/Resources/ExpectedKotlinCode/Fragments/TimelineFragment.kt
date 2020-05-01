
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
        const val typeName = "EventConnection"

        fun getSelections(operationVariables: Map<String, String>): List<Selection> {
            return listOf<Selection>(
Selection(
name = "pageInfo",
type = "PageInfo",
cacheKey = "pageInfo",
passedGID = null,
typeCondition = "EventConnection",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "hasNextPage",
type = "Boolean",
cacheKey = "hasNextPage",
passedGID = null,
typeCondition = "PageInfo",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))), 
Selection(
name = "edges",
type = "EventEdge",
cacheKey = "edges",
passedGID = null,
typeCondition = "EventConnection",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "cursor",
type = "String",
cacheKey = "cursor",
passedGID = null,
typeCondition = "EventEdge",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "node",
type = "Event",
cacheKey = "node",
passedGID = null,
typeCondition = "EventEdge",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "id",
type = "ID",
cacheKey = "id",
passedGID = null,
typeCondition = "Event",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "createdAt",
type = "DateTime",
cacheKey = "createdAt",
passedGID = null,
typeCondition = "Event",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "message",
type = "FormattedString",
cacheKey = "message",
passedGID = null,
typeCondition = "Event",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "attributeToApp",
type = "Boolean",
cacheKey = "attributeToApp",
passedGID = null,
typeCondition = "Event",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "attributeToUser",
type = "Boolean",
cacheKey = "attributeToUser",
passedGID = null,
typeCondition = "Event",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "criticalAlert",
type = "Boolean",
cacheKey = "criticalAlert",
passedGID = null,
typeCondition = "Event",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "edited",
type = "Boolean",
cacheKey = "edited",
passedGID = null,
typeCondition = "CommentEvent",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "canEdit",
type = "Boolean",
cacheKey = "canEdit",
passedGID = null,
typeCondition = "CommentEvent",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "canDelete",
type = "Boolean",
cacheKey = "canDelete",
passedGID = null,
typeCondition = "CommentEvent",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "attachments",
type = "CommentEventAttachment",
cacheKey = "attachments",
passedGID = null,
typeCondition = "CommentEvent",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "id",
type = "ID",
cacheKey = "id",
passedGID = null,
typeCondition = "CommentEventAttachment",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "name",
type = "String",
cacheKey = "name",
passedGID = null,
typeCondition = "CommentEventAttachment",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "size",
type = "Int",
cacheKey = "size",
passedGID = null,
typeCondition = "CommentEventAttachment",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "fileExtension",
type = "String",
cacheKey = "fileExtension",
passedGID = null,
typeCondition = "CommentEventAttachment",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "url",
type = "URL",
cacheKey = "url",
passedGID = null,
typeCondition = "CommentEventAttachment",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "image",
type = "Image",
cacheKey = "image",
passedGID = null,
typeCondition = "CommentEventAttachment",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "transformedSrc",
type = "URL",
cacheKey = "transformedSrc",
passedGID = null,
typeCondition = "Image",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))))))))
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
        companion object {
            const val typeName = "PageInfo"
        }
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
        companion object {
            const val typeName = "EventEdge"
        }
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
        /**
         * Globally unique identifier.
         */
        val id: ID,
        /**
         * The date and time when the event was created.
         */
        val createdAt: DateTime,
        /**
         * Human readable text that describes the event.
         */
        val message: String,
        /**
         * Whether the event was created by an app.
         */
        val attributeToApp: Boolean,
        /**
         * Whether the event was caused by an admin user.
         */
        val attributeToUser: Boolean,
        /**
         * Whether the event is critical.
         */
        val criticalAlert: Boolean,
        /**
         * Whether the comment event has been edited. If true, then the comment event has been edited.
         */
        val edited: Boolean,
        /**
         * Whether the comment event can be edited. If true, then the comment event can be edited.
         */
        val canEdit: Boolean,
        /**
         * Whether the comment event can be deleted. If true, then the comment event can be deleted.
         */
        val canDelete: Boolean,
        /**
         * The attachments associated with the comment event.
         */
        val attachments: ArrayList<Attachments>
    ) : Realized() {
        constructor(jsonObject: JsonObject) : this(
            id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java),
            createdAt = OperationGsonBuilder.gson.fromJson(jsonObject.get("createdAt"), DateTime::class.java),
            message = OperationGsonBuilder.gson.fromJson(jsonObject.get("message"), String::class.java),
            attributeToApp = OperationGsonBuilder.gson.fromJson(jsonObject.get("attributeToApp"), Boolean::class.java),
            attributeToUser = OperationGsonBuilder.gson.fromJson(jsonObject.get("attributeToUser"), Boolean::class.java),
            criticalAlert = OperationGsonBuilder.gson.fromJson(jsonObject.get("criticalAlert"), Boolean::class.java),
            edited = OperationGsonBuilder.gson.fromJson(jsonObject.get("edited"), Boolean::class.java),
            canEdit = OperationGsonBuilder.gson.fromJson(jsonObject.get("canEdit"), Boolean::class.java),
            canDelete = OperationGsonBuilder.gson.fromJson(jsonObject.get("canDelete"), Boolean::class.java),
            attachments = if(!jsonObject.has("attachments") || jsonObject.get("attachments").isJsonNull) arrayListOf<Attachments>() else jsonObject.getAsJsonArray("attachments").run {
    val list: ArrayList<Attachments> = ArrayList()
    this.forEach { 
    		val attachments = Attachments(it.asJsonObject)
    		list.add(attachments)
    }
    list
    }
        )
        companion object {
            const val typeName = "CommentEvent"
        }
            data class Attachments(
            /**
             * Globally unique identifier.
             */
            val id: ID,
            /**
             * The filename of the comment event attachment.
             */
            val name: String,
            /**
             * The size of the attachment.
             */
            val size: Int,
            /**
             * The file extension of the comment event attachment, indicating the file format.
             */
            val fileExtension: String?,
            /**
             * The URL of the attachment.
             */
            val url: String,
            /**
             * The image attached to the comment event.
             */
            val image: Image?
        ) : Response {
            constructor(jsonObject: JsonObject) : this(
                id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java),
                name = OperationGsonBuilder.gson.fromJson(jsonObject.get("name"), String::class.java),
                size = OperationGsonBuilder.gson.fromJson(jsonObject.get("size"), Int::class.java),
                fileExtension = if (!jsonObject.has("fileExtension") || jsonObject.get("fileExtension").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("fileExtension"), String::class.java),
                url = OperationGsonBuilder.gson.fromJson(jsonObject.get("url"), String::class.java),
                image = if (jsonObject.has("image") && !jsonObject.get("image").isJsonNull) Image(jsonObject.getAsJsonObject("image")) else null
            )
            companion object {
                const val typeName = "CommentEventAttachment"
            }
                data class Image(
                /**
                 * The location of the transformed image as a URL.
                 * All transformation arguments are considered "best-effort". If they can be applied to an image, they will be.
                 * Otherwise any transformations which an image type does not support will be ignored.
                 */
                val transformedSrc: String
            ) : Response {
                constructor(jsonObject: JsonObject) : this(
                    transformedSrc = OperationGsonBuilder.gson.fromJson(jsonObject.get("transformedSrc"), String::class.java)
                )
                companion object {
                    const val typeName = "Image"
                }
            }
        }
    }
        object Other: Realized()
    }
    }
    }

}
