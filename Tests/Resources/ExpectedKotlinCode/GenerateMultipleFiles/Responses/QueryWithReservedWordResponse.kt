
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class QueryWithReservedWordResponse(

    /**
     * Returns a Shop resource corresponding to access token used in request.
     */
    val `class`: Class
) : Response {
    constructor(jsonObject: JsonObject) : this(
        `class` = Class(jsonObject.getAsJsonObject("class"))
    )

        data class Class(
        /**
         * Globally unique identifier.
         */
        val `return`: ID,
        /**
         * The shop's name.
         */
        val `fun`: String
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            `return` = OperationGsonBuilder.gson.fromJson(jsonObject.get("return"), ID::class.java),
            `fun` = OperationGsonBuilder.gson.fromJson(jsonObject.get("fun"), String::class.java)
        )
    }

}
