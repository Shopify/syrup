// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"
import {
  CurrencyCode,
  WeightUnit,
  CountryCode,
  DigitalWallet,
} from "../Enums"

export namespace TestQuery1QueryData {
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
  export interface ShopAlerts {
    __typename: 'ShopAlert';
    /**
     * Description of the alert.
     */
    description: string;
  }
  export interface ShopPaymentSettings {
    __typename: 'PaymentSettings';
    /**
     * List of the digital wallets which the shop supports.
     */
    supportedDigitalWallets: DigitalWallet[];
  }
  export interface Shop {
    __typename: 'Shop';
    /**
     * Globally unique identifier.
     */
    id: ID;
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
     * Alert message that appears in the Shopify admin.
     */
    alerts: ShopAlerts[];
    /**
     * Countries that the shop ships to.
     */
    shipsToCountries: CountryCode[];
    /**
     * Settings related to payments.
     */
    paymentSettings: ShopPaymentSettings;
  }
}

export interface TestQuery1QueryData {

  /**
   * Returns a Shop resource corresponding to access token used in request.
   */
  shop: TestQuery1QueryData.Shop;
}

const document: SyrupOperation<TestQuery1QueryData, {}> = {
  id: "0372694122f1af529fd4aeeb82b099e3d9a424d34e64f1ad2945f56cbde07cd1",
  name: "TestQuery1",
  source: "query TestQuery1 { __typename shop { __typename id name currencyCode weightUnit billingAddress { __typename city company latitude longitude } alerts { __typename description } shipsToCountries paymentSettings { __typename supportedDigitalWallets } } }",
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
        }, 
        {
          name: "name",
          type: { name: "String", definedType: "Scalar" },
          typeCondition: { name: "Shop", definedType: "Object" },
        }, 
        {
          name: "currencyCode",
          type: { name: "CurrencyCode", definedType: "Scalar" },
          typeCondition: { name: "Shop", definedType: "Object" },
        }, 
        {
          name: "weightUnit",
          type: { name: "WeightUnit", definedType: "Scalar" },
          typeCondition: { name: "Shop", definedType: "Object" },
        }, 
        {
          name: "billingAddress",
          type: { name: "MailingAddress", definedType: "Object" },
          typeCondition: { name: "Shop", definedType: "Object" },
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "MailingAddress", definedType: "Object" },
            }, 
            {
              name: "city",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "MailingAddress", definedType: "Object" },
            }, 
            {
              name: "company",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "MailingAddress", definedType: "Object" },
            }, 
            {
              name: "latitude",
              type: { name: "Float", definedType: "Scalar" },
              typeCondition: { name: "MailingAddress", definedType: "Object" },
            }, 
            {
              name: "longitude",
              type: { name: "Float", definedType: "Scalar" },
              typeCondition: { name: "MailingAddress", definedType: "Object" },
            }
          ] as GraphSelection[])
        }, 
        {
          name: "alerts",
          type: { name: "ShopAlert", definedType: "Object" },
          typeCondition: { name: "Shop", definedType: "Object" },
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "ShopAlert", definedType: "Object" },
            }, 
            {
              name: "description",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "ShopAlert", definedType: "Object" },
            }
          ] as GraphSelection[])
        }, 
        {
          name: "shipsToCountries",
          type: { name: "CountryCode", definedType: "Scalar" },
          typeCondition: { name: "Shop", definedType: "Object" },
        }, 
        {
          name: "paymentSettings",
          type: { name: "PaymentSettings", definedType: "Object" },
          typeCondition: { name: "Shop", definedType: "Object" },
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "PaymentSettings", definedType: "Object" },
            }, 
            {
              name: "supportedDigitalWallets",
              type: { name: "DigitalWallet", definedType: "Scalar" },
              typeCondition: { name: "PaymentSettings", definedType: "Object" },
            }
          ] as GraphSelection[])
        }
      ] as GraphSelection[])
    }
  ] as GraphSelection[])
}
export default document
