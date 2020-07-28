
@file:Suppress("UNUSED_PARAMETER")
package com.shopify.syrup.enums

import com.shopify.foundation.syrupsupport.*
import com.google.gson.annotations.SerializedName
import javax.annotation.Generated

@Generated("com.shopify.syrup")
enum class MetafieldValueType(val value: String) {

    /**
     * An integer.
     */
    @SerializedName("INTEGER")
    INTEGER("INTEGER"),

    /**
     * A JSON string.
     */
    @SerializedName("JSON_STRING")
    JSON_STRING("JSON_STRING"),

    /**
     * A string.
     */
    @SerializedName("STRING")
    STRING("STRING"),

    UNKNOWN_SYRUP_ENUM("UNKNOWN_SYRUP_ENUM");

    companion object {
        fun safeValueOf(name: String): MetafieldValueType = MetafieldValueType.values().firstOrNull { it.value == name } ?: MetafieldValueType.UNKNOWN_SYRUP_ENUM
    }
}
