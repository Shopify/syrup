
@file:Suppress("UNUSED_PARAMETER")
package com.shopify.syrup.enums

import com.shopify.foundation.syrupsupport.*
import com.google.gson.annotations.SerializedName
import javax.annotation.Generated

@Generated("com.shopify.syrup")
enum class ProductVariantInventoryPolicy(val value: String) {

    /**
     * Continue selling a product variant when it is out of stock.
     */
    @SerializedName("CONTINUE")
    CONTINUE("CONTINUE"),

    /**
     * Stop selling a product variant when it is out of stock.
     */
    @SerializedName("DENY")
    DENY("DENY"),

    UNKNOWN_SYRUP_ENUM("UNKNOWN_SYRUP_ENUM");

    companion object {
        fun safeValueOf(name: String): ProductVariantInventoryPolicy = ProductVariantInventoryPolicy.values().firstOrNull { it.value == name } ?: ProductVariantInventoryPolicy.UNKNOWN_SYRUP_ENUM
    }
}
