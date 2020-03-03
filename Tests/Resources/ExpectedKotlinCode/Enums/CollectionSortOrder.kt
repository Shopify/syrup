
@file:Suppress("UNUSED_PARAMETER")
package com.shopify.syrup.enums

import com.shopify.foundation.syrupsupport.*
import com.google.gson.annotations.SerializedName
import javax.annotation.Generated

@Generated("com.shopify.syrup")
enum class CollectionSortOrder(val value: String) {

    /**
     * Alphabetically, in ascending order (A - Z).
     */
    @SerializedName("ALPHA_ASC")
    ALPHA_ASC("ALPHA_ASC"),

    /**
     * Alphabetically, in descending order (Z - A).
     */
    @SerializedName("ALPHA_DESC")
    ALPHA_DESC("ALPHA_DESC"),

    /**
     * By best-selling products.
     */
    @SerializedName("BEST_SELLING")
    BEST_SELLING("BEST_SELLING"),

    /**
     * By date created, in ascending order (oldest - newest).
     */
    @SerializedName("CREATED")
    CREATED("CREATED"),

    /**
     * By date created, in descending order (newest - oldest).
     */
    @SerializedName("CREATED_DESC")
    CREATED_DESC("CREATED_DESC"),

    /**
     * In the order set manually by the merchant.
     */
    @SerializedName("MANUAL")
    MANUAL("MANUAL"),

    /**
     * By price, in ascending order (lowest - highest).
     */
    @SerializedName("PRICE_ASC")
    PRICE_ASC("PRICE_ASC"),

    /**
     * By price, in descending order (highest - lowest).
     */
    @SerializedName("PRICE_DESC")
    PRICE_DESC("PRICE_DESC"),

    UNKNOWN_SYRUP_ENUM("UNKNOWN_SYRUP_ENUM");

    companion object {
        fun safeValueOf(name: String): CollectionSortOrder = CollectionSortOrder.values().firstOrNull { it.value == name } ?: CollectionSortOrder.UNKNOWN_SYRUP_ENUM
    }
}
