
package com.shopify.syrup.responses

// Syrup auto-generated file
import com.shopify.syrup.support.*
import com.shopify.syrup.enums.*
import com.shopify.syrup.fragments.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class FilmsResponse(

    val allFilms: AllFilms?
) : Response {
    constructor(jsonObject: JsonObject) : this(
        allFilms = if (jsonObject.has("allFilms") && !jsonObject.get("allFilms").isJsonNull) AllFilms(jsonObject.getAsJsonObject("allFilms")) else null
    )

        data class AllFilms(
        /**
         * A list of edges.
         */
        val edges: ArrayList<Edges?>?
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            edges = if(!jsonObject.has("edges") || jsonObject.get("edges").isJsonNull) null else jsonObject.getAsJsonArray("edges").run {
    val list: ArrayList<Edges?>? = ArrayList()
    this.forEach { 
    		val edges = if(it.isJsonNull) null else Edges(it.asJsonObject)
    		list?.add(edges)
    }
    list
    }
        )
            data class Edges(
            /**
             * The item at the end of the edge
             */
            val node: Node?
        ) : Response {
            constructor(jsonObject: JsonObject) : this(
                node = if (jsonObject.has("node") && !jsonObject.get("node").isJsonNull) Node(jsonObject.getAsJsonObject("node")) else null
            )
                data class Node(
                val movieFragment: com.shopify.syrup.fragments.MovieFragment
            ) : Response {
                constructor(jsonObject: JsonObject) : this(
                    movieFragment = com.shopify.syrup.fragments.MovieFragment(jsonObject)
                )
            }
        }
    }

}
