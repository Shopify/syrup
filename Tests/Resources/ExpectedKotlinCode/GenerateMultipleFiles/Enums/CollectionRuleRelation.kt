
@file:Suppress("UNUSED_PARAMETER")
package com.shopify.syrup.enums

import com.shopify.foundation.syrupsupport.*
import com.google.gson.annotations.SerializedName
import javax.annotation.Generated

@Generated("com.shopify.syrup")
enum class CollectionRuleRelation(val value: String) {

    /**
     * The attribute contains the condition.
     */
    @SerializedName("CONTAINS")
    CONTAINS("CONTAINS"),

    /**
     * The attribute ends with the condition.
     */
    @SerializedName("ENDS_WITH")
    ENDS_WITH("ENDS_WITH"),

    /**
     * The attribute is equal to the condition.
     */
    @SerializedName("EQUALS")
    EQUALS("EQUALS"),

    /**
     * The attribute is greater than the condition.
     */
    @SerializedName("GREATER_THAN")
    GREATER_THAN("GREATER_THAN"),

    /**
     * The attribute is not set.
     */
    @SerializedName("IS_NOT_SET")
    IS_NOT_SET("IS_NOT_SET"),

    /**
     * The attribute is set.
     */
    @SerializedName("IS_SET")
    IS_SET("IS_SET"),

    /**
     * The attribute is less than the condition.
     */
    @SerializedName("LESS_THAN")
    LESS_THAN("LESS_THAN"),

    /**
     * The attribute does not contain the condition.
     */
    @SerializedName("NOT_CONTAINS")
    NOT_CONTAINS("NOT_CONTAINS"),

    /**
     * The attribute does not equal the condition.
     */
    @SerializedName("NOT_EQUALS")
    NOT_EQUALS("NOT_EQUALS"),

    /**
     * The attribute starts with the condition.
     */
    @SerializedName("STARTS_WITH")
    STARTS_WITH("STARTS_WITH"),

    UNKNOWN_SYRUP_ENUM("UNKNOWN_SYRUP_ENUM");

    companion object {
        fun safeValueOf(name: String): CollectionRuleRelation = CollectionRuleRelation.values().firstOrNull { it.value == name } ?: CollectionRuleRelation.UNKNOWN_SYRUP_ENUM
    }
}
