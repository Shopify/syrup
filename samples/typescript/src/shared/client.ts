import { SyrupOperation } from '../data/syrup/GraphApi';
import fetch from 'node-fetch';

export class SyrupClient {
  run<Data, Variables>(operation: SyrupOperation<Data, Variables>, variables?: Variables): Promise<Data> {
    return fetch("https://swapi-graphql.netlify.com/.netlify/functions/index", {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        query: operation.source,
        variables: variables ?? {}
      })
    }).then(response => response.json()).catch(reason => Promise.reject(reason)).then(jsonResponse => jsonResponse.data)
  }
}
