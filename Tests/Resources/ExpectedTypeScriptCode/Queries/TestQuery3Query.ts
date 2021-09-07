import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace TestQuery3QueryData {
  export interface CustomerAddresses {
    __typename: 'MailingAddress';
    /**
     * The name of the country.
     */
    country?: string | null;
  }
  export interface CustomerDefaultAddress {
    __typename: 'MailingAddress';
    /**
     * The name of the city, district, village, or town.
     */
    city?: string | null;
    /**
     * The longitude coordinate of the customer address.
     */
    longitude?: number | null;
    /**
     * The latitude coordinate of the customer address.
     */
    latitude?: number | null;
  }
  export interface Customer {
    __typename: 'Customer';
    /**
     * A list of addresses associated with the customer.
     */
    addresses: CustomerAddresses[];
    /**
     * The default address associated with the customer.
     */
    defaultAddress?: CustomerDefaultAddress | null;
  }
}

export interface TestQuery3QueryData {

  /**
   * Returns a Customer resource by ID.
   */
  customer?: TestQuery3QueryData.Customer | null;
}

const document: SyrupOperation<TestQuery3QueryData, {}> = {
  id: "08177dad068a9da658aabc64345bdbcbf3efbc3db71a39256411bd3fd1687958",
  name: "TestQuery3",
  source: "query TestQuery3 { __typename customer(id: \\\"\\\") { __typename addresses { __typename country } defaultAddress { __typename city longitude latitude } } }",
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
      name: "customer",
      alias: null,
      type: { name: "Customer", definedType: "Object" },
      arguments: { id: { type: "StringValue", value: "" } },
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
          typeCondition: { name: "Customer", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "addresses",
          alias: null,
          type: { name: "MailingAddress", definedType: "Object" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Customer", definedType: "Object" },
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
              name: "country",
              alias: null,
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "MailingAddress", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }
          ] as GraphSelection[])
        }, 
        {
          name: "defaultAddress",
          alias: null,
          type: { name: "MailingAddress", definedType: "Object" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Customer", definedType: "Object" },
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
              name: "longitude",
              alias: null,
              type: { name: "Float", definedType: "Scalar" },
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
            }
          ] as GraphSelection[])
        }
      ] as GraphSelection[])
    }
  ] as GraphSelection[])
}
export default document
