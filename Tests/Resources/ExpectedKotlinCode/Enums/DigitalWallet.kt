
@file:Suppress("UNUSED_PARAMETER")
package com.shopify.syrup.enums

import com.shopify.foundation.syrupsupport.*
import com.google.gson.annotations.SerializedName
import javax.annotation.Generated

@Generated("com.shopify.syrup")
enum class DigitalWallet(val value: String) {

    /**
     * Apple Pay.
     */
    @SerializedName("APPLE_PAY")
    APPLE_PAY("APPLE_PAY"),

    /**
     * Android Pay.
     */
    @SerializedName("ANDROID_PAY")
    ANDROID_PAY("ANDROID_PAY"),

    /**
     * Google Pay.
     */
    @SerializedName("GOOGLE_PAY")
    GOOGLE_PAY("GOOGLE_PAY"),

    /**
     * Shopify Pay.
     */
    @SerializedName("SHOPIFY_PAY")
    SHOPIFY_PAY("SHOPIFY_PAY"),

    UNKNOWN_SYRUP_ENUM("UNKNOWN_SYRUP_ENUM");

    companion object {
        fun safeValueOf(name: String): DigitalWallet = DigitalWallet.values().firstOrNull { it.value == name } ?: DigitalWallet.UNKNOWN_SYRUP_ENUM
    }
}
