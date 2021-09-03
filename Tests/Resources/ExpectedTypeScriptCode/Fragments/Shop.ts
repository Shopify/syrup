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
    alias: null,
    type: { name: "String", definedType: "Scalar" },
    arguments: {},
    passedGID: null,
    typeCondition: { name: "QueryRoot", definedType: "Object" },
    directive: null,
    selections: ([] as GraphSelection[])
  }, 
  {
    name: "shop",
    alias: null,
    type: { name: "Shop", definedType: "Object" },
    arguments: {},
    passedGID: null,
    typeCondition: { name: "QueryRoot", definedType: "Object" },
    directive: null,
    selections: ([
      {
        name: "__typename",
        alias: null,
        type: { name: "String", definedType: "Scalar" },
        arguments: {},
        passedGID: null,
        typeCondition: { name: "Shop", definedType: "Object" },
        directive: null,
        selections: ([] as GraphSelection[])
      }, 
      {
        name: "availableChannelApps",
        alias: null,
        type: { name: "AppConnection", definedType: "Object" },
        arguments: { first: { type: "OperationVariableKey", value: "first" } },
        passedGID: null,
        typeCondition: { name: "Shop", definedType: "Object" },
        directive: null,
        selections: ([
          {
            name: "__typename",
            alias: null,
            type: { name: "String", definedType: "Scalar" },
            arguments: {},
            passedGID: null,
            typeCondition: { name: "AppConnection", definedType: "Object" },
            directive: null,
            selections: ([] as GraphSelection[])
          }, 
          {
            name: "edges",
            alias: null,
            type: { name: "AppEdge", definedType: "Object" },
            arguments: {},
            passedGID: null,
            typeCondition: { name: "AppConnection", definedType: "Object" },
            directive: null,
            selections: ([
              {
                name: "__typename",
                alias: null,
                type: { name: "String", definedType: "Scalar" },
                arguments: {},
                passedGID: null,
                typeCondition: { name: "AppEdge", definedType: "Object" },
                directive: null,
                selections: ([] as GraphSelection[])
              }, 
              {
                name: "node",
                alias: null,
                type: { name: "App", definedType: "Object" },
                arguments: {},
                passedGID: null,
                typeCondition: { name: "AppEdge", definedType: "Object" },
                directive: null,
                selections: ([
                  {
                    name: "__typename",
                    alias: null,
                    type: { name: "String", definedType: "Scalar" },
                    arguments: {},
                    passedGID: null,
                    typeCondition: { name: "App", definedType: "Object" },
                    directive: null,
                    selections: ([] as GraphSelection[])
                  }, 
                  {
                    name: "id",
                    alias: null,
                    type: { name: "ID", definedType: "Scalar" },
                    arguments: {},
                    passedGID: null,
                    typeCondition: { name: "App", definedType: "Object" },
                    directive: null,
                    selections: ([] as GraphSelection[])
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
