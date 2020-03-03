
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import com.shopify.syrup.fragments.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class QueryWithFragmentConditionalResponse(

    /**
     * Returns a Shop resource corresponding to access token used in request.
     */
    val shop: Shop
) : Response {
    constructor(jsonObject: JsonObject) : this(
        shop = Shop(jsonObject.getAsJsonObject("shop"))
    )

    companion object {
        const val typeName = "QueryRoot"

    }

        data class Shop(
        /**
         * Globally unique identifier.
         */
        val id: ID,
        val fragmentWithConditional: com.shopify.syrup.fragments.FragmentWithConditional
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java),
            fragmentWithConditional = com.shopify.syrup.fragments.FragmentWithConditional(jsonObject)
        )
        companion object {
            const val typeName = "Shop"
        }
    }

}
