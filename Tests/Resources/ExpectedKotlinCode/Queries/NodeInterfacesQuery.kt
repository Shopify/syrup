
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
class NodeInterfacesQuery(var nodeId: ID): Query<NodeInterfacesResponse> {

    override val rawQueryString = "fragment NodeId on Node { __typename id } fragment ProductNodeTitle on Product { __typename title } query NodeInterfaces(\$nodeId: ID!) { __typename node(id: \$nodeId) { __typename __typename ... NodeId ... on Product { __typename ... ProductNodeTitle } } }"

    override fun decodeResponse(jsonObject: JsonObject): NodeInterfacesResponse {
        return NodeInterfacesResponse(jsonObject)
    }

    override val operationVariables = mapOf<String, String>(
        "nodeId" to "$nodeId"
    )

    override val selections = listOf<Selection>(
Selection(
name = "node",
type = "Node",
cacheKey = "node(id: ${operationVariables["nodeId"]})",
passedGID = "${operationVariables["nodeId"]}",
typeCondition = "QueryRoot",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>() + NodeId.getSelections(operationVariables) + ProductNodeTitle.getSelections(operationVariables)))
}
