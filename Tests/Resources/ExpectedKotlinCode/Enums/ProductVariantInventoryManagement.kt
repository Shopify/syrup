
@file:Suppress("UNUSED_PARAMETER")
package com.shopify.syrup.enums

import com.shopify.foundation.syrupsupport.*
import com.google.gson.annotations.SerializedName
import javax.annotation.Generated

@Generated("com.shopify.syrup")
enum class ProductVariantInventoryManagement(val value: String) {

    /**
     * A third-party fulfillment service tracks this product variant's inventory.
     */
    @SerializedName("FULFILLMENT_SERVICE")
    FULFILLMENT_SERVICE("FULFILLMENT_SERVICE"),

    /**
     * This product variant's inventory is not tracked.
     */
    @SerializedName("NOT_MANAGED")
    NOT_MANAGED("NOT_MANAGED"),

    /**
     * Shopify tracks this product variant's inventory.
     */
    @SerializedName("SHOPIFY")
    SHOPIFY("SHOPIFY"),

    UNKNOWN_SYRUP_ENUM("UNKNOWN_SYRUP_ENUM");

    companion object {
        fun safeValueOf(name: String): ProductVariantInventoryManagement = ProductVariantInventoryManagement.values().firstOrNull { it.value == name } ?: ProductVariantInventoryManagement.UNKNOWN_SYRUP_ENUM
    }
}
