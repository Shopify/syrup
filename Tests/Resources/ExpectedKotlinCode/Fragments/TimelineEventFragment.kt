
package com.shopify.syrup.fragments

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class TimelineEventFragment(
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
   fun getSelections(operationVariables: Map<String, String>): List<Selection> {
     return listOf<Selection>(
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
selections = listOf<Selection>()), 
Selection(
name = "__typename",
cacheKey = "__typename",
passedGID = null,
typeCondition = "CommentEvent",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "edited",
cacheKey = "edited",
passedGID = null,
typeCondition = "CommentEvent",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "canEdit",
cacheKey = "canEdit",
passedGID = null,
typeCondition = "CommentEvent",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "canDelete",
cacheKey = "canDelete",
passedGID = null,
typeCondition = "CommentEvent",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "attachments",
cacheKey = "attachments",
passedGID = null,
typeCondition = "CommentEvent",
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
name = "name",
cacheKey = "name",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "size",
cacheKey = "size",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "fileExtension",
cacheKey = "fileExtension",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "url",
cacheKey = "url",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "image",
cacheKey = "image",
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
name = "transformedSrc",
cacheKey = "transformedSrc(maxWidth: ${operationVariables["maxImageWidth"]}, maxHeight: ${operationVariables["maxImageHeight"]})",
passedGID = null,
typeCondition = null,
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))))
   }
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
        }
    }
}
    object Other: Realized()
}

}
