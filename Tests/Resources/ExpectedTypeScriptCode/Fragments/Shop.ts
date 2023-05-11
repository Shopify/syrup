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

export const shopTypeCondition = { name: "QueryRoot", definedType: "Object" }

export const shopSelections: GraphSelection[] = ([
  {
    selectionType: "field",
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "QueryRoot", definedType: "Object" },
  }, 
  {
    selectionType: "field",
    name: "shop",
    type: { name: "Shop", definedType: "Object" },
    typeCondition: { name: "QueryRoot", definedType: "Object" },
    selections: ([
      {
        selectionType: "field",
        name: "__typename",
        type: { name: "String", definedType: "Scalar" },
        typeCondition: { name: "Shop", definedType: "Object" },
      }, 
      {
        selectionType: "field",
        name: "availableChannelApps",
        type: { name: "AppConnection", definedType: "Object" },
        typeCondition: { name: "Shop", definedType: "Object" },
        arguments: { first: { type: "OperationVariableKey", value: "first" } },
        selections: ([
          {
            selectionType: "field",
            name: "__typename",
            type: { name: "String", definedType: "Scalar" },
            typeCondition: { name: "AppConnection", definedType: "Object" },
          }, 
          {
            selectionType: "field",
            name: "edges",
            type: { name: "AppEdge", definedType: "Object" },
            typeCondition: { name: "AppConnection", definedType: "Object" },
            selections: ([
              {
                selectionType: "field",
                name: "__typename",
                type: { name: "String", definedType: "Scalar" },
                typeCondition: { name: "AppEdge", definedType: "Object" },
              }, 
              {
                selectionType: "field",
                name: "node",
                type: { name: "App", definedType: "Object" },
                typeCondition: { name: "AppEdge", definedType: "Object" },
                selections: ([
                  {
                    selectionType: "field",
                    name: "__typename",
                    type: { name: "String", definedType: "Scalar" },
                    typeCondition: { name: "App", definedType: "Object" },
                  }, 
                  {
                    selectionType: "field",
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
