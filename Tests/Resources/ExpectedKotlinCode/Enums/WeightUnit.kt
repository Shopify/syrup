
@file:Suppress("UNUSED_PARAMETER")
package com.shopify.syrup.enums

import com.shopify.foundation.syrupsupport.*
import com.google.gson.annotations.SerializedName
import javax.annotation.Generated

@Generated("com.shopify.syrup")
enum class WeightUnit(val value: String) {

    /**
     * Metric system unit of mass.
     */
    @SerializedName("GRAMS")
    GRAMS("GRAMS"),

    /**
     * 1 kilogram equals 1000 grams.
     */
    @SerializedName("KILOGRAMS")
    KILOGRAMS("KILOGRAMS"),

    /**
     * Imperial system unit of mass.
     */
    @SerializedName("OUNCES")
    OUNCES("OUNCES"),

    /**
     * 1 pound equals 16 ounces.
     */
    @SerializedName("POUNDS")
    POUNDS("POUNDS"),

    UNKNOWN_SYRUP_ENUM("UNKNOWN_SYRUP_ENUM");

    companion object {
        fun safeValueOf(name: String): WeightUnit = WeightUnit.values().firstOrNull { it.value == name } ?: WeightUnit.UNKNOWN_SYRUP_ENUM
    }
}
