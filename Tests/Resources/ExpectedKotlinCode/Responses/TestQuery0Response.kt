
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class TestQuery0Response(

    /**
     * Returns the list of nodes with the given IDs.
     */
    val nodes: ArrayList<Nodes?>
) : Response {
    constructor(jsonObject: JsonObject) : this(
        nodes = if(!jsonObject.has("nodes") || jsonObject.get("nodes").isJsonNull) arrayListOf<Nodes?>() else jsonObject.getAsJsonArray("nodes").run {
val list: ArrayList<Nodes?> = ArrayList()
this.forEach { 
		val nodes = if(it.isJsonNull) null else Nodes(it.asJsonObject)
		list.add(nodes)
}
list
}
    )

data class Nodes(
    val realized: Realized,
    val id: ID 
): Response {
    constructor(jsonObject: JsonObject) : this (
        realized = when (jsonObject.get("__typename").asString) {
            else -> Realized.Other
        },
        id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java)
    )
 companion object {
   const val typeName = "Node"
 }
 sealed class Realized {
    object Other: Realized()
}
}
}
