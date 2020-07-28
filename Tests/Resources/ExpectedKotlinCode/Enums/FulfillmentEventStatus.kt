
@file:Suppress("UNUSED_PARAMETER")
package com.shopify.syrup.enums

import com.shopify.foundation.syrupsupport.*
import com.google.gson.annotations.SerializedName
import javax.annotation.Generated

@Generated("com.shopify.syrup")
enum class FulfillmentEventStatus(val value: String) {

    /**
     * A delivery was attempted.
     */
    @SerializedName("ATTEMPTED_DELIVERY")
    ATTEMPTED_DELIVERY("ATTEMPTED_DELIVERY"),

    /**
     * The fulfillment is confirmed.
     */
    @SerializedName("CONFIRMED")
    CONFIRMED("CONFIRMED"),

    /**
     * The fulfillment was successfully delivered.
     */
    @SerializedName("DELIVERED")
    DELIVERED("DELIVERED"),

    /**
     * The fulfillment request failed.
     */
    @SerializedName("FAILURE")
    FAILURE("FAILURE"),

    /**
     * The fulfillment is in transit.
     */
    @SerializedName("IN_TRANSIT")
    IN_TRANSIT("IN_TRANSIT"),

    /**
     * A purchased shipping label has been printed.
     */
    @SerializedName("LABEL_PRINTED")
    LABEL_PRINTED("LABEL_PRINTED"),

    /**
     * A shipping label has been purchased.
     */
    @SerializedName("LABEL_PURCHASED")
    LABEL_PURCHASED("LABEL_PURCHASED"),

    /**
     * The fulfillment is out for delivery.
     */
    @SerializedName("OUT_FOR_DELIVERY")
    OUT_FOR_DELIVERY("OUT_FOR_DELIVERY"),

    /**
     * The fulfillment is ready to be picked up.
     */
    @SerializedName("READY_FOR_PICKUP")
    READY_FOR_PICKUP("READY_FOR_PICKUP"),

    UNKNOWN_SYRUP_ENUM("UNKNOWN_SYRUP_ENUM");

    companion object {
        fun safeValueOf(name: String): FulfillmentEventStatus = FulfillmentEventStatus.values().firstOrNull { it.value == name } ?: FulfillmentEventStatus.UNKNOWN_SYRUP_ENUM
    }
}
