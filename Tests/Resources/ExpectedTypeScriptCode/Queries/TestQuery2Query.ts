import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace TestQuery2QueryData {
  export interface ShopAlertsAction {
    __typename: 'ShopAlertAction';
    /**
     * Action title.
     */
    title: string;
    /**
     * Action target URL.
     */
    url: string;
  }
  export interface ShopAlerts {
    __typename: 'ShopAlert';
    /**
     * Button in the alert that links to related information.
     */
    action: ShopAlertsAction;
    /**
     * Description of the alert.
     */
    description: string;
  }
  export interface Shop {
    __typename: 'Shop';
    /**
     * The shop's name.
     */
    name: string;
    /**
     * Globally unique identifier.
     */
    id: ID;
    /**
     * The shop owner's email address.
     * Shopify will use this email address to communicate with the shop owner.
     */
    email: string;
    /**
     * Alert message that appears in the Shopify admin.
     */
    alerts: ShopAlerts[];
  }
}

export interface TestQuery2QueryData {

  /**
   * Returns a Shop resource corresponding to access token used in request.
   */
  shop: TestQuery2QueryData.Shop;
}

const document: SyrupOperation<TestQuery2QueryData, {}> = {
  id: "61dd494be186ccaf1c1306459f7e3307affaf6bbaa3c0e87b5cdba9d5fdcd011",
  name: "TestQuery2",
  source: "query TestQuery2 { __typename shop { __typename name id email alerts { __typename action { __typename title url } description } } }",
  operationType: 'query',
  selections: ([
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
          name: "name",
          alias: null,
          type: { name: "String", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Shop", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "id",
          alias: null,
          type: { name: "ID", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Shop", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "email",
          alias: null,
          type: { name: "String", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Shop", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "alerts",
          alias: null,
          type: { name: "ShopAlert", definedType: "Object" },
          arguments: {},
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
              typeCondition: { name: "ShopAlert", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "action",
              alias: null,
              type: { name: "ShopAlertAction", definedType: "Object" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "ShopAlert", definedType: "Object" },
              directive: null,
              selections: ([
                {
                  name: "__typename",
                  alias: null,
                  type: { name: "String", definedType: "Scalar" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "ShopAlertAction", definedType: "Object" },
                  directive: null,
                  selections: ([] as GraphSelection[])
                }, 
                {
                  name: "title",
                  alias: null,
                  type: { name: "String", definedType: "Scalar" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "ShopAlertAction", definedType: "Object" },
                  directive: null,
                  selections: ([] as GraphSelection[])
                }, 
                {
                  name: "url",
                  alias: null,
                  type: { name: "URL", definedType: "Scalar" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "ShopAlertAction", definedType: "Object" },
                  directive: null,
                  selections: ([] as GraphSelection[])
                }
              ] as GraphSelection[])
            }, 
            {
              name: "description",
              alias: null,
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "ShopAlert", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }
          ] as GraphSelection[])
        }
      ] as GraphSelection[])
    }
  ] as GraphSelection[])
}
export default document
