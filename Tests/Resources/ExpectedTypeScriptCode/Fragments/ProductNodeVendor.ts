// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace ProductNodeVendorFragmentData {
}

export interface ProductNodeVendorFragmentData {
  __typename: 'Product';

  /**
   * The name of the product's vendor.
   */
  vendor: string;
}

export const productNodeVendorTypeCondition = { name: "Product", definedType: "Object" }

export const productNodeVendorSelections: GraphSelection[] = ([
  {
    selectionType: "field",
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Product", definedType: "Object" },
  }, 
  {
    selectionType: "field",
    name: "vendor",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Product", definedType: "Object" },
  }
] as GraphSelection[])
