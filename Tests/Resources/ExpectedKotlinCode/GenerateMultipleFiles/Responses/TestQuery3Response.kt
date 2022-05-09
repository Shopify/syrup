
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class TestQuery3Response(

    /**
     * Returns a Customer resource by ID.
     */
    val customer: Customer?
) : Response {
    constructor(jsonObject: JsonObject) : this(
        customer = if (jsonObject.has("customer") && !jsonObject.get("customer").isJsonNull) Customer(jsonObject.getAsJsonObject("customer")) else null
    )

        data class Customer(
        /**
         * A list of addresses associated with the customer.
         */
        val addresses: ArrayList<Addresses>,
        /**
         * The default address associated with the customer.
         */
        val defaultAddress: DefaultAddress?
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            addresses = if(!jsonObject.has("addresses") || jsonObject.get("addresses").isJsonNull) arrayListOf<Addresses>() else jsonObject.getAsJsonArray("addresses").run {
    val list: ArrayList<Addresses> = ArrayList()
    this.forEach { 
    		val addresses = Addresses(it.asJsonObject)
    		list.add(addresses)
    }
    list
    },
            defaultAddress = if (jsonObject.has("defaultAddress") && !jsonObject.get("defaultAddress").isJsonNull) DefaultAddress(jsonObject.getAsJsonObject("defaultAddress")) else null
        )
            data class Addresses(
            /**
             * The name of the country.
             */
            val country: String?
        ) : Response {
            constructor(jsonObject: JsonObject) : this(
                country = if (!jsonObject.has("country") || jsonObject.get("country").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("country"), String::class.java)
            )
        }
            data class DefaultAddress(
            /**
             * The name of the city, district, village, or town.
             */
            val city: String?,
            /**
             * The longitude coordinate of the customer address.
             */
            val longitude: Double?,
            /**
             * The latitude coordinate of the customer address.
             */
            val latitude: Double?
        ) : Response {
            constructor(jsonObject: JsonObject) : this(
                city = if (!jsonObject.has("city") || jsonObject.get("city").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("city"), String::class.java),
                longitude = if (!jsonObject.has("longitude") || jsonObject.get("longitude").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("longitude"), Double::class.java),
                latitude = if (!jsonObject.has("latitude") || jsonObject.get("latitude").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("latitude"), Double::class.java)
            )
        }
    }

}
