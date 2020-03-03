import UIKit
import PlaygroundSupport

let query = StarWarsAPI.FilmsQuery(first: 10)

let client = GraphQLClient(endpoint: URL(string: "https://swapi-graphql.netlify.com/.netlify/functions/index")!)

client.query(query, responseType: StarWarsAPI.FilmsResponse.self) { (response, error) in
	if let response = response {
		response.allFilms?.edges?.forEach { edge in
			if let node = edge?.node, let title = node.title, let director = node.director, let openingCrawl = node.openingCrawl {
				print("Title: \(title) Directed by: \(director)\nA long time ago, in a galaxy far, far away...\n\(openingCrawl)\n")
			}
		}
	}
}

PlaygroundPage.current.needsIndefiniteExecution = true
