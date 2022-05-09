// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace ShopDetailsQueryData {
  export interface Shop {
    __typename: 'Shop';
    /**
     * Globally unique identifier.
     */
    id: ID;
  }
}

export interface ShopDetailsQueryData {

  /**
   * Returns a Shop resource corresponding to access token used in request.
   */
  shop: ShopDetailsQueryData.Shop;
}

const document: SyrupOperation<ShopDetailsQueryData, {}> = {
  id: "e2fbfb58827712312295bc44a9dd5d10835626025c19352929c19369070416b3",
  name: "ShopDetails",
  source: "query ShopDetails { __typename shop { __typename id } }",
  operationType: 'query',
  selections: ([
    {
      name: "__typename",
      type: { name: "String", definedType: "Scalar" },
      typeCondition: { name: "QueryRoot", definedType: "Object" },
    }, 
    {
      name: "shop",
      type: { name: "Shop", definedType: "Object" },
      typeCondition: { name: "QueryRoot", definedType: "Object" },
      selections: ([
        {
          name: "__typename",
          type: { name: "String", definedType: "Scalar" },
          typeCondition: { name: "Shop", definedType: "Object" },
        }, 
        {
          name: "id",
          type: { name: "ID", definedType: "Scalar" },
          typeCondition: { name: "Shop", definedType: "Object" },
        }
      ] as GraphSelection[])
    }
  ] as GraphSelection[])
}
export default document
