// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"
import {
  ShopFragmentData,
  shopSelections,
  shopTypeCondition,
} from "../Fragments"

export namespace ShopQueryQueryData {
  export interface Variables {
    first: number;
  }
}

export interface ShopQueryQueryData {
  shop: ShopFragmentData;
}

const document: SyrupOperation<ShopQueryQueryData, ShopQueryQueryData.Variables> = {
  id: "04e13fa3830949681d0c1fcf44b493003d3e99b6d01b0ba77248a5efaea56706",
  name: "ShopQuery",
  source: "fragment Shop on QueryRoot { __typename shop { __typename availableChannelApps(first: \$first) { __typename edges { __typename node { __typename id } } } } } query ShopQuery(\$first: Int!) { __typename ... Shop }",
  operationType: 'query',
  selections: ([
    {
      selectionType: "field",
      name: "__typename",
      type: { name: "String", definedType: "Scalar" },
      typeCondition: { name: "QueryRoot", definedType: "Object" },
    }, 
    {
      selectionType: "fragmentSpread",
      name: "Shop",
      typeCondition: shopTypeCondition,
      selections: shopSelections
    }
  ] as GraphSelection[])
}
export default document
