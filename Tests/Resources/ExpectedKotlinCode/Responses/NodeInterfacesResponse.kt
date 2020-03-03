
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import com.shopify.syrup.fragments.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class NodeInterfacesResponse(

    /**
     * Returns a specific node by ID.
     */
    val node: Node?
) : Response {
    constructor(jsonObject: JsonObject) : this(
        node = if (jsonObject.has("node") && !jsonObject.get("node").isJsonNull) Node(jsonObject.getAsJsonObject("node")) else null
    )

    companion object {
        const val typeName = "QueryRoot"

    }

data class Node(
    val realized: Realized,
    val nodeId: NodeId 
): Response {
    constructor(jsonObject: JsonObject) : this (
        realized = when (jsonObject.get("__typename").asString) {
            "Product" -> Realized.Product(jsonObject)
            else -> Realized.Other
        },
        nodeId = NodeId(jsonObject)
    )
 companion object {
   const val typeName = "Node"
 }
 sealed class Realized {
data class Product(
    val nodeId: com.shopify.syrup.fragments.NodeId,
    val productNodeTitle: com.shopify.syrup.fragments.ProductNodeTitle
) : Realized() {
    constructor(jsonObject: JsonObject) : this(
        nodeId = com.shopify.syrup.fragments.NodeId(jsonObject),
        productNodeTitle = com.shopify.syrup.fragments.ProductNodeTitle(jsonObject)
    )
    companion object {
        const val typeName = "Product"
    }
}
    object Other: Realized()
}
}
}
