// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace ShopFragmentData {
  export interface ShopAvailableChannelAppsEdgesNode {
    __typename: 'App';
    /**
     * Globally unique identifier.
     */
    id: ID;
  }
  export interface ShopAvailableChannelAppsEdges {
    __typename: 'AppEdge';
    /**
     * The item at the end of AppEdge.
     */
    node: ShopAvailableChannelAppsEdgesNode;
  }
  export interface ShopAvailableChannelApps {
    __typename: 'AppConnection';
    /**
     * A list of edges.
     */
    edges: ShopAvailableChannelAppsEdges[];
  }
  export interface Shop {
    __typename: 'Shop';
    /**
     * List of sales channels not currently installed on the shop.
     */
    availableChannelApps: ShopAvailableChannelApps;
  }
}

export interface ShopFragmentData {
  __typename: 'QueryRoot';

  /**
   * Returns a Shop resource corresponding to access token used in request.
   */
  shop: ShopFragmentData.Shop;
}

export const shopSelections: GraphSelection[] = ([
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
        name: "availableChannelApps",
        type: { name: "AppConnection", definedType: "Object" },
        typeCondition: { name: "Shop", definedType: "Object" },
        arguments: { first: { type: "OperationVariableKey", value: "first" } },
        selections: ([
          {
            name: "__typename",
            type: { name: "String", definedType: "Scalar" },
            typeCondition: { name: "AppConnection", definedType: "Object" },
          }, 
          {
            name: "edges",
            type: { name: "AppEdge", definedType: "Object" },
            typeCondition: { name: "AppConnection", definedType: "Object" },
            selections: ([
              {
                name: "__typename",
                type: { name: "String", definedType: "Scalar" },
                typeCondition: { name: "AppEdge", definedType: "Object" },
              }, 
              {
                name: "node",
                type: { name: "App", definedType: "Object" },
                typeCondition: { name: "AppEdge", definedType: "Object" },
                selections: ([
                  {
                    name: "__typename",
                    type: { name: "String", definedType: "Scalar" },
                    typeCondition: { name: "App", definedType: "Object" },
                  }, 
                  {
                    name: "id",
                    type: { name: "ID", definedType: "Scalar" },
                    typeCondition: { name: "App", definedType: "Object" },
                  }
                ] as GraphSelection[])
              }
            ] as GraphSelection[])
          }
        ] as GraphSelection[])
      }
    ] as GraphSelection[])
  }
] as GraphSelection[])
