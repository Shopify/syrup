
package com.shopify.syrup.subscriptions

import com.shopify.foundation.syrupsupport.*
import com.google.gson.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.shopify.syrup.enums.*
import com.shopify.syrup.inputs.*
import com.shopify.syrup.fragments.*
import com.shopify.syrup.responses.*
import javax.annotation.Generated

@Generated("com.shopify.syrup")
class Subscription1Subscription(): Subscription<Subscription1Response> {

    override val rawQueryString = "subscription Subscription1 { presenceChanged }"

    override fun decodeResponse(jsonObject: JsonObject): Subscription1Response {
        return Subscription1Response(jsonObject)
    }

    override val operationVariables = mapOf<String, String>(
    )

    override val selections = listOf<Selection>(
Selection(
name = "presenceChanged",
type = "Boolean",
cacheKey = "presenceChanged",
passedGID = null,
typeCondition = "Subscription",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))
}
