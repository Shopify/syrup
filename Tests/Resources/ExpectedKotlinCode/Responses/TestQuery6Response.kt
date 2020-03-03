
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class TestQuery6Response(

    /**
     * Returns a Shop resource corresponding to access token used in request.
     */
    val shop: Shop
) : Response {
    constructor(jsonObject: JsonObject) : this(
        shop = Shop(jsonObject.getAsJsonObject("shop"))
    )

    companion object {
        const val typeName = "QueryRoot"

    }

        data class Shop(
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
         * List of the shop's installed fulfillment services.
         */
        val fulfillmentServices: ArrayList<FulfillmentServices>,
        /**
         * List of orders placed on the shop.
         */
        @Deprecated("""Use `QueryRoot.orders` instead.""")
        val orders: Orders
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            name = OperationGsonBuilder.gson.fromJson(jsonObject.get("name"), String::class.java),
            currencyCode = CurrencyCode.safeValueOf(jsonObject.decodeEnumValue<CurrencyCode>("currencyCode")),
            weightUnit = WeightUnit.safeValueOf(jsonObject.decodeEnumValue<WeightUnit>("weightUnit")),
            billingAddress = BillingAddress(jsonObject.getAsJsonObject("billingAddress")),
            fulfillmentServices = if(!jsonObject.has("fulfillmentServices") || jsonObject.get("fulfillmentServices").isJsonNull) arrayListOf<FulfillmentServices>() else jsonObject.getAsJsonArray("fulfillmentServices").run {
    val list: ArrayList<FulfillmentServices> = ArrayList()
    this.forEach { 
    		val fulfillmentServices = FulfillmentServices(it.asJsonObject)
    		list.add(fulfillmentServices)
    }
    list
    },
            orders = Orders(jsonObject.getAsJsonObject("orders"))
        )
        companion object {
            const val typeName = "Shop"
        }
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
            companion object {
                const val typeName = "MailingAddress"
            }
        }
            data class FulfillmentServices(
            /**
             * The name of the fulfillment service as seen by merchants.
             */
            val serviceName: String,
            /**
             * Human-readable unique identifier for this fulfillment service.
             */
            val handle: String
        ) : Response {
            constructor(jsonObject: JsonObject) : this(
                serviceName = OperationGsonBuilder.gson.fromJson(jsonObject.get("serviceName"), String::class.java),
                handle = OperationGsonBuilder.gson.fromJson(jsonObject.get("handle"), String::class.java)
            )
            companion object {
                const val typeName = "FulfillmentService"
            }
        }
            data class Orders(
            /**
             * A list of edges.
             */
            val edges: ArrayList<Edges>
        ) : Response {
            constructor(jsonObject: JsonObject) : this(
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
                const val typeName = "OrderConnection"
            }
                data class Edges(
                /**
                 * The item at the end of OrderEdge.
                 */
                val node: Node
            ) : Response {
                constructor(jsonObject: JsonObject) : this(
                    node = Node(jsonObject.getAsJsonObject("node"))
                )
                companion object {
                    const val typeName = "OrderEdge"
                }
                    data class Node(
                    /**
                     * Unique identifier for the order that appears on the order.
                     * For example, _#1000_ or _Store1001.
                     * This value is not unique across multiple stores.
                     */
                    val name: String,
                    /**
                     * Fulfillment status for the order that can be shown to the merchant.
                     * This field does not capture all the possible details of an order's fulfillment state. It should only be used for display summary purposes.
                     */
                    val displayFulfillmentStatus: OrderDisplayFulfillmentStatus
                ) : Response {
                    constructor(jsonObject: JsonObject) : this(
                        name = OperationGsonBuilder.gson.fromJson(jsonObject.get("name"), String::class.java),
                        displayFulfillmentStatus = OrderDisplayFulfillmentStatus.safeValueOf(jsonObject.decodeEnumValue<OrderDisplayFulfillmentStatus>("displayFulfillmentStatus"))
                    )
                    companion object {
                        const val typeName = "Order"
                    }
                }
            }
        }
    }

}
