
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class QueryWithReservedWordOnInlineFragmentResponse(

    /**
     * Returns a specific node by ID.
     */
    val node: Node?
) : Response {
    constructor(jsonObject: JsonObject) : this(
        node = if (jsonObject.has("node") && !jsonObject.get("node").isJsonNull) Node(jsonObject.getAsJsonObject("node")) else null
    )

data class Node(
    val realized: Realized,
    val id: ID 
): Response {
    constructor(jsonObject: JsonObject) : this (
        realized = when (jsonObject.get("__typename").asString) {
            "Product" -> Realized.Product(jsonObject)
            else -> Realized.Other
        },
        id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java)
    )
 companion object {
   const val typeName = "Node"
 }
 sealed class Realized {
data class Product(
    /**
     * Globally unique identifier.
     */
    val id: ID,
    /**
     * The title of the product.
     */
    val `val`: String
) : Realized() {
    constructor(jsonObject: JsonObject) : this(
        id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java),
        `val` = OperationGsonBuilder.gson.fromJson(jsonObject.get("val"), String::class.java)
    )
}
    object Other: Realized()
}
}
}
