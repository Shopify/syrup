
@file:Suppress("UNUSED_PARAMETER")
package com.shopify.syrup.enums

import com.shopify.foundation.syrupsupport.*
import com.google.gson.annotations.SerializedName
import javax.annotation.Generated

@Generated("com.shopify.syrup")
enum class PrivateMetafieldValueType(val value: String) {

    /**
     * A private metafield value type.
     */
    @SerializedName("STRING")
    STRING("STRING"),

    /**
     * A private metafield value type.
     */
    @SerializedName("INTEGER")
    INTEGER("INTEGER"),

    /**
     * A private metafield value type.
     */
    @SerializedName("JSON_STRING")
    JSON_STRING("JSON_STRING"),

    UNKNOWN_SYRUP_ENUM("UNKNOWN_SYRUP_ENUM");

    companion object {
        fun safeValueOf(name: String): PrivateMetafieldValueType = PrivateMetafieldValueType.values().firstOrNull { it.value == name } ?: PrivateMetafieldValueType.UNKNOWN_SYRUP_ENUM
    }
}
