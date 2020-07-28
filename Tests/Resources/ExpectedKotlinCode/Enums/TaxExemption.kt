
@file:Suppress("UNUSED_PARAMETER")
package com.shopify.syrup.enums

import com.shopify.foundation.syrupsupport.*
import com.google.gson.annotations.SerializedName
import javax.annotation.Generated

@Generated("com.shopify.syrup")
enum class TaxExemption(val value: String) {

    /**
     * This customer is exempt from specific taxes for holding a valid COMMERCIAL_FISHERY_EXEMPTION in British Columbia.
     */
    @SerializedName("CA_BC_COMMERCIAL_FISHERY_EXEMPTION")
    CA_BC_COMMERCIAL_FISHERY_EXEMPTION("CA_BC_COMMERCIAL_FISHERY_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid CONTRACTOR_EXEMPTION in British Columbia.
     */
    @SerializedName("CA_BC_CONTRACTOR_EXEMPTION")
    CA_BC_CONTRACTOR_EXEMPTION("CA_BC_CONTRACTOR_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid PRODUCTION_AND_MACHINERY_EXEMPTION in British Columbia.
     */
    @SerializedName("CA_BC_PRODUCTION_AND_MACHINERY_EXEMPTION")
    CA_BC_PRODUCTION_AND_MACHINERY_EXEMPTION("CA_BC_PRODUCTION_AND_MACHINERY_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid RESELLER_EXEMPTION in British Columbia.
     */
    @SerializedName("CA_BC_RESELLER_EXEMPTION")
    CA_BC_RESELLER_EXEMPTION("CA_BC_RESELLER_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid SUB_CONTRACTOR_EXEMPTION in British Columbia.
     */
    @SerializedName("CA_BC_SUB_CONTRACTOR_EXEMPTION")
    CA_BC_SUB_CONTRACTOR_EXEMPTION("CA_BC_SUB_CONTRACTOR_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid DIPLOMAT_EXEMPTION in Canada.
     */
    @SerializedName("CA_DIPLOMAT_EXEMPTION")
    CA_DIPLOMAT_EXEMPTION("CA_DIPLOMAT_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid COMMERCIAL_FISHERY_EXEMPTION in Manitoba.
     */
    @SerializedName("CA_MB_COMMERCIAL_FISHERY_EXEMPTION")
    CA_MB_COMMERCIAL_FISHERY_EXEMPTION("CA_MB_COMMERCIAL_FISHERY_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid FARMER_EXEMPTION in Manitoba.
     */
    @SerializedName("CA_MB_FARMER_EXEMPTION")
    CA_MB_FARMER_EXEMPTION("CA_MB_FARMER_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid RESELLER_EXEMPTION in Manitoba.
     */
    @SerializedName("CA_MB_RESELLER_EXEMPTION")
    CA_MB_RESELLER_EXEMPTION("CA_MB_RESELLER_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid COMMERCIAL_FISHERY_EXEMPTION in Nova Scotia.
     */
    @SerializedName("CA_NS_COMMERCIAL_FISHERY_EXEMPTION")
    CA_NS_COMMERCIAL_FISHERY_EXEMPTION("CA_NS_COMMERCIAL_FISHERY_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid FARMER_EXEMPTION in Nova Scotia.
     */
    @SerializedName("CA_NS_FARMER_EXEMPTION")
    CA_NS_FARMER_EXEMPTION("CA_NS_FARMER_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid PURCHASE_EXEMPTION in Ontario.
     */
    @SerializedName("CA_ON_PURCHASE_EXEMPTION")
    CA_ON_PURCHASE_EXEMPTION("CA_ON_PURCHASE_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid COMMERCIAL_FISHERY_EXEMPTION in Prince Edward Island.
     */
    @SerializedName("CA_PE_COMMERCIAL_FISHERY_EXEMPTION")
    CA_PE_COMMERCIAL_FISHERY_EXEMPTION("CA_PE_COMMERCIAL_FISHERY_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid COMMERCIAL_FISHERY_EXEMPTION in Saskatchewan.
     */
    @SerializedName("CA_SK_COMMERCIAL_FISHERY_EXEMPTION")
    CA_SK_COMMERCIAL_FISHERY_EXEMPTION("CA_SK_COMMERCIAL_FISHERY_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid CONTRACTOR_EXEMPTION in Saskatchewan.
     */
    @SerializedName("CA_SK_CONTRACTOR_EXEMPTION")
    CA_SK_CONTRACTOR_EXEMPTION("CA_SK_CONTRACTOR_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid FARMER_EXEMPTION in Saskatchewan.
     */
    @SerializedName("CA_SK_FARMER_EXEMPTION")
    CA_SK_FARMER_EXEMPTION("CA_SK_FARMER_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid PRODUCTION_AND_MACHINERY_EXEMPTION in Saskatchewan.
     */
    @SerializedName("CA_SK_PRODUCTION_AND_MACHINERY_EXEMPTION")
    CA_SK_PRODUCTION_AND_MACHINERY_EXEMPTION("CA_SK_PRODUCTION_AND_MACHINERY_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid RESELLER_EXEMPTION in Saskatchewan.
     */
    @SerializedName("CA_SK_RESELLER_EXEMPTION")
    CA_SK_RESELLER_EXEMPTION("CA_SK_RESELLER_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid SUB_CONTRACTOR_EXEMPTION in Saskatchewan.
     */
    @SerializedName("CA_SK_SUB_CONTRACTOR_EXEMPTION")
    CA_SK_SUB_CONTRACTOR_EXEMPTION("CA_SK_SUB_CONTRACTOR_EXEMPTION"),

    /**
     * This customer is exempt from specific taxes for holding a valid STATUS_CARD_EXEMPTION in Canada.
     */
    @SerializedName("CA_STATUS_CARD_EXEMPTION")
    CA_STATUS_CARD_EXEMPTION("CA_STATUS_CARD_EXEMPTION"),

    UNKNOWN_SYRUP_ENUM("UNKNOWN_SYRUP_ENUM");

    companion object {
        fun safeValueOf(name: String): TaxExemption = TaxExemption.values().firstOrNull { it.value == name } ?: TaxExemption.UNKNOWN_SYRUP_ENUM
    }
}
