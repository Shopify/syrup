import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"
import {
  CurrencyCode,
  WeightUnit,
} from "../Enums"

export namespace TestQuery5QueryData {
  export interface ShopBillingAddress {
    __typename: 'MailingAddress';
    /**
     * The name of the city, district, village, or town.
     */
    city?: string | null;
    /**
     * The name of the customer's company or organization.
     */
    company?: string | null;
    /**
     * The latitude coordinate of the customer address.
     */
    latitude?: number | null;
    /**
     * The longitude coordinate of the customer address.
     */
    longitude?: number | null;
  }
  export interface ShopFulfillmentServices {
    __typename: 'FulfillmentService';
    /**
     * The name of the fulfillment service as seen by merchants.
     */
    serviceName: string;
    /**
     * Human-readable unique identifier for this fulfillment service.
     */
    handle: string;
  }
  export interface Shop {
    __typename: 'Shop';
    /**
     * The shop's name.
     */
    name: string;
    /**
     * The three letter code for the shop's currency.
     */
    currencyCode: CurrencyCode;
    /**
     * The shop's primary unit of weight for products and shipping.
     */
    weightUnit: WeightUnit;
    /**
     * The shop's billing address information.
     */
    billingAddress: ShopBillingAddress;
    /**
     * List of the shop's installed fulfillment services.
     */
    fulfillmentServices: ShopFulfillmentServices[];
  }
}

export interface TestQuery5QueryData {

  /**
   * Returns a Shop resource corresponding to access token used in request.
   */
  shop: TestQuery5QueryData.Shop;
}

const document: SyrupOperation<TestQuery5QueryData, {}> = {
  id: "74768bf6b81d149cfa45e46a3acecfe3f73f34ff93403250f93360e10dafb43b",
  name: "TestQuery5",
  source: "query TestQuery5 { __typename shop { __typename name currencyCode weightUnit billingAddress { __typename city company latitude longitude } fulfillmentServices { __typename serviceName handle } } }",
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
          name: "currencyCode",
          alias: null,
          type: { name: "CurrencyCode", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Shop", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "weightUnit",
          alias: null,
          type: { name: "WeightUnit", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Shop", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "billingAddress",
          alias: null,
          type: { name: "MailingAddress", definedType: "Object" },
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
              typeCondition: { name: "MailingAddress", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "city",
              alias: null,
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "MailingAddress", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "company",
              alias: null,
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "MailingAddress", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "latitude",
              alias: null,
              type: { name: "Float", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "MailingAddress", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "longitude",
              alias: null,
              type: { name: "Float", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "MailingAddress", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }
          ] as GraphSelection[])
        }, 
        {
          name: "fulfillmentServices",
          alias: null,
          type: { name: "FulfillmentService", definedType: "Object" },
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
              typeCondition: { name: "FulfillmentService", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "serviceName",
              alias: null,
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "FulfillmentService", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "handle",
              alias: null,
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "FulfillmentService", definedType: "Object" },
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
