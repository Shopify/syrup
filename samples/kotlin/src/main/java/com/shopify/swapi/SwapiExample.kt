package com.shopify.swapi

import com.shopify.syrup.queries.FilmsQuery
import kotlinx.coroutines.runBlocking
import kotlin.system.exitProcess

fun main() {
    runBlocking {
        val allFilmsResponse = SimpleGraphqlClient().query(FilmsQuery())

        allFilmsResponse.allFilms?.edges?.forEach { edge ->
            edge?.node?.movieFragment?.let {
                println("Movie: ${it.title}")
                println("Director: ${it.director}")
                println("---------------------------------------")
                println("${it.openingCrawl}\n")
            }
        }
    }
    exitProcess(0)
}