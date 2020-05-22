
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class TestQuery2Response(

    /**
     * Returns a Shop resource corresponding to access token used in request.
     */
    val shop: Shop
) : Response {
    constructor(jsonObject: JsonObject) : this(
        shop = Shop(jsonObject.getAsJsonObject("shop"))
    )

        data class Shop(
        /**
         * The shop's name.
         */
        val name: String,
        /**
         * Globally unique identifier.
         */
        val id: ID,
        /**
         * The shop owner's email address.
         * Shopify will use this email address to communicate with the shop owner.
         */
        val email: String,
        /**
         * Alert message that appears in the Shopify admin.
         */
        val alerts: ArrayList<Alerts>
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            name = OperationGsonBuilder.gson.fromJson(jsonObject.get("name"), String::class.java),
            id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java),
            email = OperationGsonBuilder.gson.fromJson(jsonObject.get("email"), String::class.java),
            alerts = if(!jsonObject.has("alerts") || jsonObject.get("alerts").isJsonNull) arrayListOf<Alerts>() else jsonObject.getAsJsonArray("alerts").run {
    val list: ArrayList<Alerts> = ArrayList()
    this.forEach { 
    		val alerts = Alerts(it.asJsonObject)
    		list.add(alerts)
    }
    list
    }
        )
            data class Alerts(
            /**
             * Button in the alert that links to related information.
             */
            val action: Action,
            /**
             * Description of the alert.
             */
            val description: String
        ) : Response {
            constructor(jsonObject: JsonObject) : this(
                action = Action(jsonObject.getAsJsonObject("action")),
                description = OperationGsonBuilder.gson.fromJson(jsonObject.get("description"), String::class.java)
            )
                data class Action(
                /**
                 * Action title.
                 */
                val title: String,
                /**
                 * Action target URL.
                 */
                val url: String
            ) : Response {
                constructor(jsonObject: JsonObject) : this(
                    title = OperationGsonBuilder.gson.fromJson(jsonObject.get("title"), String::class.java),
                    url = OperationGsonBuilder.gson.fromJson(jsonObject.get("url"), String::class.java)
                )
            }
        }
    }

}
