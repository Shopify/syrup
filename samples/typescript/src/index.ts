import { SyrupClient } from "./shared/client";
import FilmsQuery, { FilmsQueryData } from "./data/syrup/Queries/FilmsQuery"

const client = new SyrupClient()

client.run<FilmsQueryData, {}>(FilmsQuery).then(films => {
  films.allFilms?.edges?.forEach(edge => {
    console.log(`Movie: ${edge?.node?.title}`)
    console.log(`Director: ${edge?.node?.director}`)
    console.log("---------------------------------------")
    console.log(`${edge?.node?.openingCrawl}\n`)
  })
}).catch(error => {
  console.log(`Query has failed: ${error}`)
})
