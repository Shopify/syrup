package com.shopify.swapi

import com.google.gson.Gson
import com.google.gson.JsonObject
import com.shopify.syrup.support.Query
import com.shopify.syrup.support.Response
import io.ktor.client.HttpClient
import io.ktor.client.engine.okhttp.OkHttp
import io.ktor.client.features.json.GsonSerializer
import io.ktor.client.features.json.JsonFeature
import io.ktor.client.request.post
import io.ktor.client.request.url
import io.ktor.client.response.HttpResponse
import io.ktor.client.response.readText
import io.ktor.http.ContentType
import io.ktor.http.contentType

class SimpleGraphqlClient {
    private val httpClient = HttpClient(OkHttp) {
        install(JsonFeature) {
            serializer = GsonSerializer()
        }
    }

    suspend fun <TResponse : Response> query(query: Query<TResponse>): TResponse {
        val response = httpClient.post<HttpResponse> {
            url("https://swapi-graphql.netlify.com/.netlify/functions/index")
            contentType(ContentType.Application.Json)
            body = Gson().fromJson(query.getQueryString(), JsonObject::class.java)
        }

        val content = response.readText()
        val jsonObject = Gson().fromJson(content, JsonObject::class.java).getAsJsonObject("data")

        return query.decodeResponse(jsonObject)
    }
}
