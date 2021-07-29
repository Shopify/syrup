import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"
import {
  MovieFragmentFragmentData,
  movieFragmentSelections,
} from "../Fragments"

export namespace FilmsQueryData {
  export interface AllFilmsEdgesNode extends MovieFragmentFragmentData {
    __typename: 'Film';
  }
  export interface AllFilmsEdges {
    __typename: 'FilmsEdge';
    /**
     * The item at the end of the edge
     */
    node?: AllFilmsEdgesNode | null;
  }
  export interface AllFilms {
    __typename: 'FilmsConnection';
    /**
     * A list of edges.
     */
    edges?: (AllFilmsEdges | null)[] | null;
  }
}

export interface FilmsQueryData {

  allFilms?: FilmsQueryData.AllFilms | null;
}

const document: SyrupOperation<FilmsQueryData, {}> = {
  id: "8c0e6205bc6559d0ec37327ca7a6472fbe2b876fcbe3c589b597bf96b0585c5a",
  name: "Films",
  source: "fragment MovieFragment on Film { __typename title director openingCrawl } query Films { __typename allFilms { __typename edges { __typename node { __typename ... MovieFragment } } } }",
  operationType: 'query',
  selections: ([
    {
      name: "__typename",
      type: { name: "String", definedType: "Scalar" },
      arguments: {},
      passedGID: null,
      typeCondition: { name: "Root", definedType: "Object" },
      directive: null,
      selections: ([] as GraphSelection[])
    }, 
    {
      name: "allFilms",
      type: { name: "FilmsConnection", definedType: "Object" },
      arguments: {},
      passedGID: null,
      typeCondition: { name: "Root", definedType: "Object" },
      directive: null,
      selections: ([
        {
          name: "__typename",
          type: { name: "String", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "FilmsConnection", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "edges",
          type: { name: "FilmsEdge", definedType: "Object" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "FilmsConnection", definedType: "Object" },
          directive: null,
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "FilmsEdge", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "node",
              type: { name: "Film", definedType: "Object" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "FilmsEdge", definedType: "Object" },
              directive: null,
              selections: ([
                {
                  name: "__typename",
                  type: { name: "String", definedType: "Scalar" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "Film", definedType: "Object" },
                  directive: null,
                  selections: ([] as GraphSelection[])
                }
              ] as GraphSelection[]).concat(movieFragmentSelections).map(x => copyWithTypeCondition(x, { name: "Film", definedType: "Object" }))
            }
          ] as GraphSelection[])
        }
      ] as GraphSelection[])
    }
  ] as GraphSelection[])
}
export default document
