
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class TestQuery10Response(

    /**
     * Lookup a price rule by ID.
     */
    val priceRule: PriceRule?
) : Response {
    constructor(jsonObject: JsonObject) : this(
        priceRule = if (jsonObject.has("priceRule") && !jsonObject.get("priceRule").isJsonNull) PriceRule(jsonObject.getAsJsonObject("priceRule")) else null
    )

    companion object {
        const val typeName = "QueryRoot"

    }

        data class PriceRule(
        /**
         * Globally unique identifier.
         */
        val id: ID,
        /**
         * The value of the price rule.
         */
        @Deprecated("""Use `valueV2` instead""")
        val value: Value,
        /**
         * The value of the price rule.
         */
        val valueV2: ValueV2
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java),
            value = Value(jsonObject.getAsJsonObject("value")),
            valueV2 = ValueV2(jsonObject.getAsJsonObject("valueV2"))
        )
        companion object {
            const val typeName = "PriceRule"
        }
    data class Value(
        val realized: Realized
    ): Response {
        constructor(jsonObject: JsonObject) : this (
            realized = when (jsonObject.get("__typename").asString) {
            "PriceRuleFixedAmountValue" -> Realized.PriceRuleFixedAmountValue(jsonObject)
            "PriceRulePercentValue" -> Realized.PriceRulePercentValue(jsonObject)
            else -> Realized.Other
            }
        )
     companion object {
       const val typeName = ""
     }
     sealed class Realized {
    data class PriceRuleFixedAmountValue(
        /**
         * The monetary value of the price rule.
         */
        val amount: BigDecimal
    ) : Realized() {
        constructor(jsonObject: JsonObject) : this(
            amount = OperationGsonBuilder.gson.fromJson(jsonObject.get("amount"), BigDecimal::class.java)
        )
        companion object {
            const val typeName = "PriceRuleFixedAmountValue"
        }
    }
    data class PriceRulePercentValue(
        /**
         * The percent value of the price rule.
         */
        val percentage: Double
    ) : Realized() {
        constructor(jsonObject: JsonObject) : this(
            percentage = OperationGsonBuilder.gson.fromJson(jsonObject.get("percentage"), Double::class.java)
        )
        companion object {
            const val typeName = "PriceRulePercentValue"
        }
    }
        object Other: Realized()
      }
    }
    data class ValueV2(
        val realized: Realized
    ): Response {
        constructor(jsonObject: JsonObject) : this (
            realized = when (jsonObject.get("__typename").asString) {
            "MoneyV2" -> Realized.MoneyV2(jsonObject)
            "PricingPercentageValue" -> Realized.PricingPercentageValue(jsonObject)
            else -> Realized.Other
            }
        )
     companion object {
       const val typeName = ""
     }
     sealed class Realized {
    data class MoneyV2(
        /**
         * Decimal money amount.
         */
        val amount: BigDecimal
    ) : Realized() {
        constructor(jsonObject: JsonObject) : this(
            amount = OperationGsonBuilder.gson.fromJson(jsonObject.get("amount"), BigDecimal::class.java)
        )
        companion object {
            const val typeName = "MoneyV2"
        }
    }
    data class PricingPercentageValue(
        /**
         * The percentage value of the object.
         */
        val percentage: Double
    ) : Realized() {
        constructor(jsonObject: JsonObject) : this(
            percentage = OperationGsonBuilder.gson.fromJson(jsonObject.get("percentage"), Double::class.java)
        )
        companion object {
            const val typeName = "PricingPercentageValue"
        }
    }
        object Other: Realized()
      }
    }
    }

}
