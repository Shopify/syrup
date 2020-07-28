
@file:Suppress("UNUSED_PARAMETER")
package com.shopify.syrup.enums

import com.shopify.foundation.syrupsupport.*
import com.google.gson.annotations.SerializedName
import javax.annotation.Generated

@Generated("com.shopify.syrup")
enum class OrderDisplayFulfillmentStatus(val value: String) {

    /**
     * Displayed as **Fulfilled**.
     */
    @SerializedName("FULFILLED")
    FULFILLED("FULFILLED"),

    /**
     * Displayed as **In progress**.
     */
    @SerializedName("IN_PROGRESS")
    IN_PROGRESS("IN_PROGRESS"),

    /**
     * Displayed as **Open**.
     */
    @SerializedName("OPEN")
    OPEN("OPEN"),

    /**
     * Displayed as **Partially fulfilled**.
     */
    @SerializedName("PARTIALLY_FULFILLED")
    PARTIALLY_FULFILLED("PARTIALLY_FULFILLED"),

    /**
     * Displayed as **Pending fulfillment**.
     */
    @SerializedName("PENDING_FULFILLMENT")
    PENDING_FULFILLMENT("PENDING_FULFILLMENT"),

    /**
     * Displayed as **Restocked**.
     */
    @SerializedName("RESTOCKED")
    RESTOCKED("RESTOCKED"),

    /**
     * Displayed as **Unfulfilled**.
     */
    @SerializedName("UNFULFILLED")
    UNFULFILLED("UNFULFILLED"),

    UNKNOWN_SYRUP_ENUM("UNKNOWN_SYRUP_ENUM");

    companion object {
        fun safeValueOf(name: String): OrderDisplayFulfillmentStatus = OrderDisplayFulfillmentStatus.values().firstOrNull { it.value == name } ?: OrderDisplayFulfillmentStatus.UNKNOWN_SYRUP_ENUM
    }
}
