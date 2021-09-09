import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace MovieFragmentFragmentData {
}

export interface MovieFragmentFragmentData {
  __typename: 'Film';

  /**
   * The title of this film.
   */
  title?: string | null;

  /**
   * The name of the director of this film.
   */
  director?: string | null;

  /**
   * The opening paragraphs at the beginning of this film.
   */
  openingCrawl?: string | null;
}

export const movieFragmentSelections: GraphSelection[] = ([
  {
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Film", definedType: "Object" },
  }, 
  {
    name: "title",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Film", definedType: "Object" },
  }, 
  {
    name: "director",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Film", definedType: "Object" },
  }, 
  {
    name: "openingCrawl",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Film", definedType: "Object" },
  }
] as GraphSelection[])
