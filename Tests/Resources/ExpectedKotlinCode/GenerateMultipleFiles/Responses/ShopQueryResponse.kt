
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import com.shopify.syrup.fragments.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class ShopQueryResponse(
    val shop: com.shopify.syrup.fragments.Shop
) : Response {
    constructor(jsonObject: JsonObject) : this(
        shop = com.shopify.syrup.fragments.Shop(jsonObject)
    )

}
