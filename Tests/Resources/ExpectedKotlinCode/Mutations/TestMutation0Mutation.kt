
package com.shopify.syrup.mutations

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
class TestMutation0Mutation(var input: CustomerInput): Mutation<TestMutation0Response> {

    val rawQueryString = "mutation TestMutation0(\$input: CustomerInput!) { __typename customerUpdate(input: \$input) { __typename customer { __typename id } } }"

    override fun decodeResponse(jsonObject: JsonObject): TestMutation0Response {
        return TestMutation0Response(jsonObject)
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
        "input" to "$input"
    )

    override val selections = listOf<Selection>(
Selection(
name = "customerUpdate",
type = "CustomerUpdatePayload",
cacheKey = "customerUpdate(input: ${operationVariables["input"]})",
passedGID = null,
backingGIDReference = null,
typeCondition = "Mutation",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "customer",
type = "Customer",
cacheKey = "customer",
passedGID = null,
backingGIDReference = "id",
typeCondition = "CustomerUpdatePayload",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>(
Selection(
name = "id",
type = "ID",
cacheKey = "id",
passedGID = null,
backingGIDReference = null,
typeCondition = "Customer",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))))))
}
