
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import com.shopify.syrup.fragments.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class ProductVariantShippingWithUserErrorsResponse(

    /**
     * Updates a product variant.
     */
    val productVariantUpdate: ProductVariantUpdate?
) : ResponseWithUserErrors {
    constructor(jsonObject: JsonObject) : this(
        productVariantUpdate = if (jsonObject.has("productVariantUpdate") && !jsonObject.get("productVariantUpdate").isJsonNull) ProductVariantUpdate(jsonObject.getAsJsonObject("productVariantUpdate")) else null
    )

    override val userErrors: ArrayList<out UserErrorsInterface>?
    get() = productVariantUpdate?.userErrors

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
            val id: ID
        ) : Response {
            constructor(jsonObject: JsonObject) : this(
                id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java)
            )
        }
            data class UserErrors(
            val userError: com.shopify.syrup.fragments.UserError
        ) : Response, UserErrorsInterface() {
            constructor(jsonObject: JsonObject) : this(
                userError = com.shopify.syrup.fragments.UserError(jsonObject)
            )
                    override val message
                        get() = userError.message
                    override val field
                        get() = userError.field
        }
    }

}
