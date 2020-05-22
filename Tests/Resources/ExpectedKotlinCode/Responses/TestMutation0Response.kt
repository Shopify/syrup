
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class TestMutation0Response(

    /**
     * Updates a customer's attributes.
     */
    val customerUpdate: CustomerUpdate?
) : Response {
    constructor(jsonObject: JsonObject) : this(
        customerUpdate = if (jsonObject.has("customerUpdate") && !jsonObject.get("customerUpdate").isJsonNull) CustomerUpdate(jsonObject.getAsJsonObject("customerUpdate")) else null
    )

        data class CustomerUpdate(
        /**
         * The updated customer.
         */
        val customer: Customer?
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            customer = if (jsonObject.has("customer") && !jsonObject.get("customer").isJsonNull) Customer(jsonObject.getAsJsonObject("customer")) else null
        )
            data class Customer(
            /**
             * Globally unique identifier.
             */
            val id: ID
        ) : Response {
            constructor(jsonObject: JsonObject) : this(
                id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java)
            )
        }
    }

}
