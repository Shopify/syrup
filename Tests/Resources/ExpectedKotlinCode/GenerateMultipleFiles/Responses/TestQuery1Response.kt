
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class TestQuery1Response(

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
         * Globally unique identifier.
         */
        val id: ID,
        /**
         * The shop's name.
         */
        val name: String,
        /**
         * The three letter code for the shop's currency.
         */
        val currencyCode: CurrencyCode,
        /**
         * The shop's primary unit of weight for products and shipping.
         */
        val weightUnit: WeightUnit,
        /**
         * The shop's billing address information.
         */
        val billingAddress: BillingAddress,
        /**
         * Alert message that appears in the Shopify admin.
         */
        val alerts: ArrayList<Alerts>,
        /**
         * Countries that the shop ships to.
         */
        val shipsToCountries: ArrayList<CountryCode>,
        /**
         * Settings related to payments.
         */
        val paymentSettings: PaymentSettings
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java),
            name = OperationGsonBuilder.gson.fromJson(jsonObject.get("name"), String::class.java),
            currencyCode = CurrencyCode.safeValueOf(jsonObject.decodeEnumValue<CurrencyCode>("currencyCode")),
            weightUnit = WeightUnit.safeValueOf(jsonObject.decodeEnumValue<WeightUnit>("weightUnit")),
            billingAddress = BillingAddress(jsonObject.getAsJsonObject("billingAddress")),
            alerts = if(!jsonObject.has("alerts") || jsonObject.get("alerts").isJsonNull) arrayListOf<Alerts>() else jsonObject.getAsJsonArray("alerts").run {
    val list: ArrayList<Alerts> = ArrayList()
    this.forEach { 
    		val alerts = Alerts(it.asJsonObject)
    		list.add(alerts)
    }
    list
    },
            shipsToCountries = with(jsonObject.getAsJsonArray("shipsToCountries")) {
    val list: ArrayList<CountryCode> = ArrayList()
    this.forEach { list.add(CountryCode.safeValueOf(it.asString)) }
    list
    },
            paymentSettings = PaymentSettings(jsonObject.getAsJsonObject("paymentSettings"))
        )
            data class BillingAddress(
            /**
             * The name of the city, district, village, or town.
             */
            val city: String?,
            /**
             * The name of the customer's company or organization.
             */
            val company: String?,
            /**
             * The latitude coordinate of the customer address.
             */
            val latitude: Double?,
            /**
             * The longitude coordinate of the customer address.
             */
            val longitude: Double?
        ) : Response {
            constructor(jsonObject: JsonObject) : this(
                city = if (!jsonObject.has("city") || jsonObject.get("city").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("city"), String::class.java),
                company = if (!jsonObject.has("company") || jsonObject.get("company").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("company"), String::class.java),
                latitude = if (!jsonObject.has("latitude") || jsonObject.get("latitude").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("latitude"), Double::class.java),
                longitude = if (!jsonObject.has("longitude") || jsonObject.get("longitude").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("longitude"), Double::class.java)
            )
        }
            data class Alerts(
            /**
             * Description of the alert.
             */
            val description: String
        ) : Response {
            constructor(jsonObject: JsonObject) : this(
                description = OperationGsonBuilder.gson.fromJson(jsonObject.get("description"), String::class.java)
            )
        }
            data class PaymentSettings(
            /**
             * List of the digital wallets which the shop supports.
             */
            val supportedDigitalWallets: ArrayList<DigitalWallet>
        ) : Response {
            constructor(jsonObject: JsonObject) : this(
                supportedDigitalWallets = with(jsonObject.getAsJsonArray("supportedDigitalWallets")) {
        val list: ArrayList<DigitalWallet> = ArrayList()
        this.forEach { list.add(DigitalWallet.safeValueOf(it.asString)) }
        list
        }
            )
        }
    }

}
