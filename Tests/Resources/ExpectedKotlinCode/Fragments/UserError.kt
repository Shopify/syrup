
package com.shopify.syrup.fragments

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class UserError(

    /**
     * The error message.
     */
    val message: String,

    /**
     * Path to the input field which caused the error.
     */
    val field: ArrayList<String>?
) : Response {
    constructor(jsonObject: JsonObject) : this(
        message = OperationGsonBuilder.gson.fromJson(jsonObject.get("message"), String::class.java),
        field = if(!jsonObject.has("field") || jsonObject.get("field").isJsonNull) null else jsonObject.getAsJsonArray("field")?.run {
val list: ArrayList<String> = ArrayList()
this.forEach { list.add(OperationGsonBuilder.gson.fromJson(it, String::class.java)) }
list
}
    )

    companion object {
        fun getSelections(operationVariables: Map<String, String>): List<Selection> {
            return listOf<Selection>(
Selection(
name = "message",
type = "String",
cacheKey = "message",
passedGID = null,
typeCondition = "UserError",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()), 
Selection(
name = "field",
type = "String",
cacheKey = "field",
passedGID = null,
typeCondition = "UserError",
shouldSkipBasedOnConditionalDirective = false,
selections = listOf<Selection>()))
        }
    }

}
