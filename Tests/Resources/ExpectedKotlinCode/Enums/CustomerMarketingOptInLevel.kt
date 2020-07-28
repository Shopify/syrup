
@file:Suppress("UNUSED_PARAMETER")
package com.shopify.syrup.enums

import com.shopify.foundation.syrupsupport.*
import com.google.gson.annotations.SerializedName
import javax.annotation.Generated

@Generated("com.shopify.syrup")
enum class CustomerMarketingOptInLevel(val value: String) {

    /**
     * After providing their email address, the customer received a confirmation email which required them to
     * perform a prescribed action before receiving marketing emails.
     */
    @SerializedName("CONFIRMED_OPT_IN")
    CONFIRMED_OPT_IN("CONFIRMED_OPT_IN"),

    /**
     * The customer started receiving marketing email(s) after providing their email address, without any
     * intermediate steps.
     */
    @SerializedName("SINGLE_OPT_IN")
    SINGLE_OPT_IN("SINGLE_OPT_IN"),

    /**
     * The customer receives marketing emails, but the original opt-in process is unknown.
     */
    @SerializedName("UNKNOWN")
    UNKNOWN("UNKNOWN"),

    UNKNOWN_SYRUP_ENUM("UNKNOWN_SYRUP_ENUM");

    companion object {
        fun safeValueOf(name: String): CustomerMarketingOptInLevel = CustomerMarketingOptInLevel.values().firstOrNull { it.value == name } ?: CustomerMarketingOptInLevel.UNKNOWN_SYRUP_ENUM
    }
}
