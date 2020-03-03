
package com.shopify.syrup.queries

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
class ShopQueryQuery(var first: Int): Query<ShopQueryResponse> {

    val rawQueryString = "fragment Shop on QueryRoot { __typename shop { __typename availableChannelApps(first: \$first) { __typename edges { __typename node { __typename id } } } } } query ShopQuery(\$first: Int!) { __typename ... Shop }"

    override fun decodeResponse(jsonObject: JsonObject): ShopQueryResponse {
        return ShopQueryResponse(jsonObject)
    }

    override fun getQueryString(): String {
        val gson = OperationGsonBuilder.gson
        var variables = gson.toJson(this)
        if (variables != "{}") {
            variables = setDefinedNulls(variables)
            return "{ \"query\": \"$rawQueryString\", \"variables\": $variables}"
        }
        return "{ \"query\": \"$rawQueryString\" }"
    }

    val operationVariables = mapOf<String, String>(
        "first" to "$first"
    )

    override val selections = listOf<Selection>() + Shop.getSelections(operationVariables)
}
