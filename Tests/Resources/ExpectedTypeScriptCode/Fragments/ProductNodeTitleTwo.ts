// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace ProductNodeTitleTwoFragmentData {
}

export interface ProductNodeTitleTwoFragmentData {
  __typename: 'Product';

  /**
   * The title of the product.
   */
  title: string;

  /**
   * The name of the product's vendor.
   */
  vendor: string;
}

export const productNodeTitleTwoSelections: GraphSelection[] = ([
  {
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Product", definedType: "Object" },
  }, 
  {
    name: "title",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Product", definedType: "Object" },
  }, 
  {
    name: "vendor",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Product", definedType: "Object" },
  }
] as GraphSelection[])
