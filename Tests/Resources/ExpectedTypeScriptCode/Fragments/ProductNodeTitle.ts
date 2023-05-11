// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace ProductNodeTitleFragmentData {
}

export interface ProductNodeTitleFragmentData {
  __typename: 'Product';

  /**
   * The title of the product.
   */
  title: string;
}

export const productNodeTitleTypeCondition = { name: "Product", definedType: "Object" }

export const productNodeTitleSelections: GraphSelection[] = ([
  {
    selectionType: "field",
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Product", definedType: "Object" },
  }, 
  {
    selectionType: "field",
    name: "title",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Product", definedType: "Object" },
  }
] as GraphSelection[])
