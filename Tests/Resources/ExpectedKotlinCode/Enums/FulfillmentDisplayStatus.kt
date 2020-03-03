
@file:Suppress("UNUSED_PARAMETER")
package com.shopify.syrup.enums

import com.shopify.foundation.syrupsupport.*
import com.google.gson.annotations.SerializedName
import javax.annotation.Generated

@Generated("com.shopify.syrup")
enum class FulfillmentDisplayStatus(val value: String) {

    /**
     * Displayed as **Attempted delivery**.
     */
    @SerializedName("ATTEMPTED_DELIVERY")
    ATTEMPTED_DELIVERY("ATTEMPTED_DELIVERY"),

    /**
     * Displayed as **Canceled**.
     */
    @SerializedName("CANCELED")
    CANCELED("CANCELED"),

    /**
     * Displayed as **Confirmed**.
     */
    @SerializedName("CONFIRMED")
    CONFIRMED("CONFIRMED"),

    /**
     * Displayed as **Delivered**.
     */
    @SerializedName("DELIVERED")
    DELIVERED("DELIVERED"),

    /**
     * Displayed as **Failure**.
     */
    @SerializedName("FAILURE")
    FAILURE("FAILURE"),

    /**
     * Displayed as **Fulfilled**.
     */
    @SerializedName("FULFILLED")
    FULFILLED("FULFILLED"),

    /**
     * Displayed as **In transit**.
     */
    @SerializedName("IN_TRANSIT")
    IN_TRANSIT("IN_TRANSIT"),

    /**
     * Displayed as **Label printed**.
     */
    @SerializedName("LABEL_PRINTED")
    LABEL_PRINTED("LABEL_PRINTED"),

    /**
     * Displayed as **Label purchased**.
     */
    @SerializedName("LABEL_PURCHASED")
    LABEL_PURCHASED("LABEL_PURCHASED"),

    /**
     * Displayed as **Label voided**.
     */
    @SerializedName("LABEL_VOIDED")
    LABEL_VOIDED("LABEL_VOIDED"),

    /**
     * Displayed as **Marked as fulfilled**.
     */
    @SerializedName("MARKED_AS_FULFILLED")
    MARKED_AS_FULFILLED("MARKED_AS_FULFILLED"),

    /**
     * Displayed as **Not delivered**.
     */
    @SerializedName("NOT_DELIVERED")
    NOT_DELIVERED("NOT_DELIVERED"),

    /**
     * Displayed as **Out for delivery**.
     */
    @SerializedName("OUT_FOR_DELIVERY")
    OUT_FOR_DELIVERY("OUT_FOR_DELIVERY"),

    /**
     * Displayed as **Ready for pickup**.
     */
    @SerializedName("READY_FOR_PICKUP")
    READY_FOR_PICKUP("READY_FOR_PICKUP"),

    /**
     * Displayed as **Submitted**.
     */
    @SerializedName("SUBMITTED")
    SUBMITTED("SUBMITTED"),

    UNKNOWN_SYRUP_ENUM("UNKNOWN_SYRUP_ENUM");

    companion object {
        fun safeValueOf(name: String): FulfillmentDisplayStatus = FulfillmentDisplayStatus.values().firstOrNull { it.value == name } ?: FulfillmentDisplayStatus.UNKNOWN_SYRUP_ENUM
    }
}
