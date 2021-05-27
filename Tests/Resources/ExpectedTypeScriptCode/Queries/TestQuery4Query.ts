import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace TestQuery4QueryData {
  export interface ShopAvailableChannelAppsEdgesNode {
    __typename: 'App';
    /**
     * Globally unique identifier.
     */
    id: ID;
    /**
     * Name of the app.
     */
    title: string;
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
     * Globally unique identifier.
     */
    id: ID;
    /**
     * List of sales channels not currently installed on the shop.
     */
    availableChannelApps: ShopAvailableChannelApps;
  }
}

export interface TestQuery4QueryData {

  /**
   * Returns a Shop resource corresponding to access token used in request.
   */
  shop: TestQuery4QueryData.Shop;
}

const document: SyrupOperation<TestQuery4QueryData, {}> = {
  id: "6b2ddb4ea45a6fb505e4ba5349776832f8b7b972dbc2fa61b7b6f6681a84416b",
  name: "TestQuery4",
  source: "query TestQuery4 { __typename shop { __typename id availableChannelApps(first: 250) { __typename edges { __typename node { __typename id title } } } } }",
  operationType: 'query',
  selections: ([
    {
      name: "__typename",
      type: { name: "String", definedType: "Scalar" },
      arguments: {},
      passedGID: null,
      typeCondition: { name: "QueryRoot", definedType: "Object" },
      directive: null,
      selections: ([] as GraphSelection[])
    }, 
    {
      name: "shop",
      type: { name: "Shop", definedType: "Object" },
      arguments: {},
      passedGID: null,
      typeCondition: { name: "QueryRoot", definedType: "Object" },
      directive: null,
      selections: ([
        {
          name: "__typename",
          type: { name: "String", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Shop", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "id",
          type: { name: "ID", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Shop", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "availableChannelApps",
          type: { name: "AppConnection", definedType: "Object" },
          arguments: { first: { type: "IntValue", value: 250 } },
          passedGID: null,
          typeCondition: { name: "Shop", definedType: "Object" },
          directive: null,
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "AppConnection", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "edges",
              type: { name: "AppEdge", definedType: "Object" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "AppConnection", definedType: "Object" },
              directive: null,
              selections: ([
                {
                  name: "__typename",
                  type: { name: "String", definedType: "Scalar" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "AppEdge", definedType: "Object" },
                  directive: null,
                  selections: ([] as GraphSelection[])
                }, 
                {
                  name: "node",
                  type: { name: "App", definedType: "Object" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "AppEdge", definedType: "Object" },
                  directive: null,
                  selections: ([
                    {
                      name: "__typename",
                      type: { name: "String", definedType: "Scalar" },
                      arguments: {},
                      passedGID: null,
                      typeCondition: { name: "App", definedType: "Object" },
                      directive: null,
                      selections: ([] as GraphSelection[])
                    }, 
                    {
                      name: "id",
                      type: { name: "ID", definedType: "Scalar" },
                      arguments: {},
                      passedGID: null,
                      typeCondition: { name: "App", definedType: "Object" },
                      directive: null,
                      selections: ([] as GraphSelection[])
                    }, 
                    {
                      name: "title",
                      type: { name: "String", definedType: "Scalar" },
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
}
export default document
