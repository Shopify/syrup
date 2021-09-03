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

export const productNodeTitleSelections: GraphSelection[] = ([
  {
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Product", definedType: "Object" },
  }, 
  {
    name: "title",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Product", definedType: "Object" },
  }
] as GraphSelection[])
