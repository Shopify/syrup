
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class Subscription1Response(

    val presenceChanged: Boolean
) : Response {
    constructor(jsonObject: JsonObject) : this(
        presenceChanged = OperationGsonBuilder.gson.fromJson(jsonObject.get("presenceChanged"), Boolean::class.java)
    )

}
