
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class ProductVariantShippingResponse(

    /**
     * Updates a product variant.
     */
    val productVariantUpdate: ProductVariantUpdate?
) : Response {
    constructor(jsonObject: JsonObject) : this(
        productVariantUpdate = if (jsonObject.has("productVariantUpdate") && !jsonObject.get("productVariantUpdate").isJsonNull) ProductVariantUpdate(jsonObject.getAsJsonObject("productVariantUpdate")) else null
    )

        data class ProductVariantUpdate(
        /**
         * The updated variant.
         */
        val productVariant: ProductVariant?,
        /**
         * List of errors that occurred executing the mutation.
         */
        val userErrors: ArrayList<UserErrors>
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            productVariant = if (jsonObject.has("productVariant") && !jsonObject.get("productVariant").isJsonNull) ProductVariant(jsonObject.getAsJsonObject("productVariant")) else null,
            userErrors = if(!jsonObject.has("userErrors") || jsonObject.get("userErrors").isJsonNull) arrayListOf<UserErrors>() else jsonObject.getAsJsonArray("userErrors").run {
    val list: ArrayList<UserErrors> = ArrayList()
    this.forEach { 
    		val userErrors = UserErrors(it.asJsonObject)
    		list.add(userErrors)
    }
    list
    }
        )
            data class ProductVariant(
            /**
             * Globally unique identifier.
             */
            val id: ID,
            /**
             * The weight of the product variant in the unit system specified with weight_unit.
             */
            val weight: Double?,
            /**
             * The unit of measurement that applies to the product variant's weight. If you don't specify a value for weight_unit, then the shop's default unit of measurement is applied. Valid values: `g`, `kg`, `oz`, `lb`.
             */
            val weightUnit: WeightUnit,
            /**
             * Whether a customer needs to provide a shipping address when placing an order for the product variant.
             */
            @Deprecated("""Use `InventoryItem.requiresShipping` instead.""")
            val requiresShipping: Boolean,
            /**
             * The Harmonized System Code (or HS Tariff Code) for the variant.
             */
            @Deprecated("""Use `InventoryItem.harmonizedSystemCode` instead.""")
            val harmonizedSystemCode: String?
        ) : Response {
            constructor(jsonObject: JsonObject) : this(
                id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java),
                weight = if (!jsonObject.has("weight") || jsonObject.get("weight").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("weight"), Double::class.java),
                weightUnit = WeightUnit.safeValueOf(jsonObject.decodeEnumValue<WeightUnit>("weightUnit")),
                requiresShipping = OperationGsonBuilder.gson.fromJson(jsonObject.get("requiresShipping"), Boolean::class.java),
                harmonizedSystemCode = if (!jsonObject.has("harmonizedSystemCode") || jsonObject.get("harmonizedSystemCode").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get("harmonizedSystemCode"), String::class.java)
            )
        }
            data class UserErrors(
            /**
             * The error message.
             */
            override val message: String,
            /**
             * Path to the input field which caused the error.
             */
            override val field: ArrayList<String>?
        ) : Response, UserErrorsInterface() {
            constructor(jsonObject: JsonObject) : this(
                message = OperationGsonBuilder.gson.fromJson(jsonObject.get("message"), String::class.java),
                field = if(!jsonObject.has("field") || jsonObject.get("field").isJsonNull) null else jsonObject.getAsJsonArray("field")?.run {
        val list: ArrayList<String> = ArrayList()
        this.forEach { list.add(OperationGsonBuilder.gson.fromJson(it, String::class.java)) }
        list
        }
            )
        }
    }

}
