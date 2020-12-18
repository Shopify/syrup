
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class CreateCollectionResponse(

    /**
     * Creates a collection.
     */
    val collectionCreate: CollectionCreate?
) : ResponseWithUserErrors {
    constructor(jsonObject: JsonObject) : this(
        collectionCreate = if (jsonObject.has("collectionCreate") && !jsonObject.get("collectionCreate").isJsonNull) CollectionCreate(jsonObject.getAsJsonObject("collectionCreate")) else null
    )

    override val userErrors: ArrayList<out UserErrorsInterface>?
    get() = collectionCreate?.userErrors

        data class CollectionCreate(
        /**
         * List of errors that occurred executing the mutation.
         */
        val userErrors: ArrayList<UserErrors>,
        /**
         * The collection that has been created.
         */
        val collection: Collection?
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            userErrors = if(!jsonObject.has("userErrors") || jsonObject.get("userErrors").isJsonNull) arrayListOf<UserErrors>() else jsonObject.getAsJsonArray("userErrors").run {
    val list: ArrayList<UserErrors> = ArrayList()
    this.forEach { 
    		val userErrors = UserErrors(it.asJsonObject)
    		list.add(userErrors)
    }
    list
    },
            collection = if (jsonObject.has("collection") && !jsonObject.get("collection").isJsonNull) Collection(jsonObject.getAsJsonObject("collection")) else null
        )
            data class UserErrors(
            /**
             * Path to the input field which caused the error.
             */
            override val field: ArrayList<String>?,
            /**
             * The error message.
             */
            override val message: String
        ) : Response, UserErrorsInterface() {
            constructor(jsonObject: JsonObject) : this(
                field = if(!jsonObject.has("field") || jsonObject.get("field").isJsonNull) null else jsonObject.getAsJsonArray("field")?.run {
        val list: ArrayList<String> = ArrayList()
        this.forEach { list.add(OperationGsonBuilder.gson.fromJson(it, String::class.java)) }
        list
        },
                message = OperationGsonBuilder.gson.fromJson(jsonObject.get("message"), String::class.java)
            )
        }
            data class Collection(
            /**
             * The title of the collection.
             */
            val title: String,
            /**
             * Globally unique identifier.
             */
            val id: ID,
            /**
             * Information about the collection that's provided through resource feedback.
             */
            val feedback: Feedback?
        ) : Response {
            constructor(jsonObject: JsonObject) : this(
                title = OperationGsonBuilder.gson.fromJson(jsonObject.get("title"), String::class.java),
                id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java),
                feedback = if (jsonObject.has("feedback") && !jsonObject.get("feedback").isJsonNull) Feedback(jsonObject.getAsJsonObject("feedback")) else null
            )
                data class Feedback(
                /**
                 * Summary of resource feedback pertaining to the resource.
                 */
                val summary: String
            ) : Response {
                constructor(jsonObject: JsonObject) : this(
                    summary = OperationGsonBuilder.gson.fromJson(jsonObject.get("summary"), String::class.java)
                )
            }
        }
    }

}
