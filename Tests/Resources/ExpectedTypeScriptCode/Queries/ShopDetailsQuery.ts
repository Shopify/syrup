import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"
import {
  CurrencyCode,
  WeightUnit,
  CountryCode,
  DigitalWallet,
} from "../Enums"

export namespace ShopDetailsQueryData {
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

export interface ShopDetailsQueryData {

  /**
   * Returns a Shop resource corresponding to access token used in request.
   */
  shop: ShopDetailsQueryData.Shop;
}

const document: SyrupOperation<ShopDetailsQueryData, {}> = {
  id: "12bcc227187a96f64ccaa0998240f2e8ac8e568fb5e74b39c132e38130892014",
  name: "ShopDetails",
  source: "query ShopDetails { __typename shop { __typename id name currencyCode weightUnit billingAddress { __typename city company latitude longitude } alerts { __typename description } shipsToCountries paymentSettings { __typename supportedDigitalWallets } } }",
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
        }, 
        {
          name: "shipsToCountries",
          alias: null,
          type: { name: "CountryCode", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Shop", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "paymentSettings",
          alias: null,
          type: { name: "PaymentSettings", definedType: "Object" },
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
              typeCondition: { name: "PaymentSettings", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "supportedDigitalWallets",
              alias: null,
              type: { name: "DigitalWallet", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "PaymentSettings", definedType: "Object" },
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
