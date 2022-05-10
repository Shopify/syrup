
@file:Suppress("UNUSED_PARAMETER")
package com.shopify.syrup.enums

// Syrup auto-generated file
import com.shopify.syrup.support.*
import com.google.gson.annotations.SerializedName
import javax.annotation.Generated

@Generated("com.shopify.syrup")
enum class TrilogyType(val value: String) {

    /**
     * Episodes 4 to 6
     */
    @SerializedName("THE_OLD_ONE")
    THE_OLD_ONE("THE_OLD_ONE"),

    /**
     * Episodes 1 to 3
     */
    @SerializedName("THE_OK_ONE")
    THE_OK_ONE("THE_OK_ONE"),

    /**
     * Episodes 7 to 9
     */
    @SerializedName("THE_BAD_ONE")
    THE_BAD_ONE("THE_BAD_ONE"),

    UNKNOWN_SYRUP_ENUM("UNKNOWN_SYRUP_ENUM");

    companion object {
        fun safeValueOf(name: String): TrilogyType = TrilogyType.values().firstOrNull { it.value == name } ?: TrilogyType.UNKNOWN_SYRUP_ENUM
    }
}
