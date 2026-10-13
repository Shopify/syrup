
package com.shopify.syrup.responses

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime
import com.google.gson.JsonObject
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class TestDeprecatedFieldsResponse(

    /**
     * List of the active sales channels.
     */
    @Deprecated("Use `publications` instead")
    val channels: Channels
) : Response {
    constructor(jsonObject: JsonObject) : this(
        channels = Channels(jsonObject.getAsJsonObject("channels"))
    )

        data class Channels(
        /**
         * A list of edges.
         */
        val edges: ArrayList<Edges>
    ) : Response {
        constructor(jsonObject: JsonObject) : this(
            edges = if(!jsonObject.has("edges") || jsonObject.get("edges").isJsonNull) arrayListOf<Edges>() else jsonObject.getAsJsonArray("edges").run {
    val list: ArrayList<Edges> = ArrayList()
    this.forEach { 
    		val edges = Edges(it.asJsonObject)
    		list.add(edges)
    }
    list
    }
        )
            data class Edges(
            /**
             * The item at the end of ChannelEdge.
             */
            val node: Node
        ) : Response {
            constructor(jsonObject: JsonObject) : this(
                node = Node(jsonObject.getAsJsonObject("node"))
            )
                data class Node(
                /**
                 * Underlying app used by the channel.
                 */
                val app: App
            ) : Response {
                constructor(jsonObject: JsonObject) : this(
                    app = App(jsonObject.getAsJsonObject("app"))
                )
                    data class App(
                    /**
                     * Globally unique identifier.
                     */
                    val id: ID,
                    /**
                     * Icon that represents the app.
                     */
                    val icon: Icon
                ) : Response {
                    constructor(jsonObject: JsonObject) : this(
                        id = OperationGsonBuilder.gson.fromJson(jsonObject.get("id"), ID::class.java),
                        icon = Icon(jsonObject.getAsJsonObject("icon"))
                    )
                        data class Icon(
                        /**
                         * The location of the image as a URL.
                         */
                        @Deprecated("Previously an image had a single `src` field. This could either return the original image\nlocation or a URL that contained transformations such as sizing or scale.\n\nThese transformations were specified by arguments on the parent field.\n\nNow an image has two distinct URL fields: `originalSrc` and `transformedSrc`.\n\n* `originalSrc` - the original unmodified image URL\n* `transformedSrc` - the image URL with the specified transformations included\n\nTo migrate to the new fields, image transformations should be moved from the parent field to `transformedSrc`.\n\nBefore:\n```graphql\n{\n  shop {\n    productImages(maxWidth: 200, scale: 2) {\n      edges {\n        node {\n          src\n        }\n      }\n    }\n  }\n}\n```\n\nAfter:\n```graphql\n{\n  shop {\n    productImages {\n      edges {\n        node {\n          transformedSrc(maxWidth: 200, scale: 2)\n        }\n      }\n    }\n  }\n}\n```\n")
                        val src: String
                    ) : Response {
                        constructor(jsonObject: JsonObject) : this(
                            src = OperationGsonBuilder.gson.fromJson(jsonObject.get("src"), String::class.java)
                        )
                    }
                }
            }
        }
    }

}
