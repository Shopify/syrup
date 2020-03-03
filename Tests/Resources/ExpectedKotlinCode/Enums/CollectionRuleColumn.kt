
@file:Suppress("UNUSED_PARAMETER")
package com.shopify.syrup.enums

import com.shopify.foundation.syrupsupport.*
import com.google.gson.annotations.SerializedName
import javax.annotation.Generated

@Generated("com.shopify.syrup")
enum class CollectionRuleColumn(val value: String) {

    /**
     * The `tag` attribute.
     */
    @SerializedName("TAG")
    TAG("TAG"),

    /**
     * The `title` attribute.
     */
    @SerializedName("TITLE")
    TITLE("TITLE"),

    /**
     * The `type` attribute.
     */
    @SerializedName("TYPE")
    TYPE("TYPE"),

    /**
     * The `vendor` attribute.
     */
    @SerializedName("VENDOR")
    VENDOR("VENDOR"),

    /**
     * The `variant_price` attribute.
     */
    @SerializedName("VARIANT_PRICE")
    VARIANT_PRICE("VARIANT_PRICE"),

    /**
     * The `is_price_reduced` attribute.
     */
    @SerializedName("IS_PRICE_REDUCED")
    IS_PRICE_REDUCED("IS_PRICE_REDUCED"),

    /**
     * The `variant_compare_at_price` attribute.
     */
    @SerializedName("VARIANT_COMPARE_AT_PRICE")
    VARIANT_COMPARE_AT_PRICE("VARIANT_COMPARE_AT_PRICE"),

    /**
     * The `variant_weight` attribute.
     */
    @SerializedName("VARIANT_WEIGHT")
    VARIANT_WEIGHT("VARIANT_WEIGHT"),

    /**
     * The `variant_inventory` attribute.
     */
    @SerializedName("VARIANT_INVENTORY")
    VARIANT_INVENTORY("VARIANT_INVENTORY"),

    /**
     * The `variant_title` attribute.
     */
    @SerializedName("VARIANT_TITLE")
    VARIANT_TITLE("VARIANT_TITLE"),

    UNKNOWN_SYRUP_ENUM("UNKNOWN_SYRUP_ENUM");

    companion object {
        fun safeValueOf(name: String): CollectionRuleColumn = CollectionRuleColumn.values().firstOrNull { it.value == name } ?: CollectionRuleColumn.UNKNOWN_SYRUP_ENUM
    }
}
