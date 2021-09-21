// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"
import {
  BasicFragmentFragmentData,
  basicFragmentSelections,
} from "../Fragments"

export namespace TestQuery9QueryData {
  export interface ShopCustomersEdgesNode extends BasicFragmentFragmentData {
    __typename: 'Customer';
    /**
     * Globally unique identifier.
     */
    id: ID;
  }
  export interface ShopCustomersEdges {
    __typename: 'CustomerEdge';
    /**
     * The item at the end of CustomerEdge.
     */
    node: ShopCustomersEdgesNode;
  }
  export interface ShopCustomers {
    __typename: 'CustomerConnection';
    /**
     * A list of edges.
     */
    edges: ShopCustomersEdges[];
  }
  export interface Shop {
    __typename: 'Shop';
    /**
     * Customer accounts associated to the shop.
     *
     * @deprecated Use `QueryRoot.customers` instead.
     */
    customers: ShopCustomers;
  }
}

export interface TestQuery9QueryData {

  /**
   * Returns a Shop resource corresponding to access token used in request.
   */
  shop: TestQuery9QueryData.Shop;
}

const document: SyrupOperation<TestQuery9QueryData, {}> = {
  id: "4550b9f75895705921d5c4dae4589afc9802a6b202d89691893306b20bc41d1d",
  name: "TestQuery9",
  source: "fragment BasicFragment on Customer { __typename id lastName } query TestQuery9 { __typename shop { __typename customers(first: 1) { __typename edges { __typename node { __typename id ... BasicFragment } } } } }",
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
          name: "customers",
          type: { name: "CustomerConnection", definedType: "Object" },
          typeCondition: { name: "Shop", definedType: "Object" },
          arguments: { first: { type: "IntValue", value: 1 } },
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "CustomerConnection", definedType: "Object" },
            }, 
            {
              name: "edges",
              type: { name: "CustomerEdge", definedType: "Object" },
              typeCondition: { name: "CustomerConnection", definedType: "Object" },
              selections: ([
                {
                  name: "__typename",
                  type: { name: "String", definedType: "Scalar" },
                  typeCondition: { name: "CustomerEdge", definedType: "Object" },
                }, 
                {
                  name: "node",
                  type: { name: "Customer", definedType: "Object" },
                  typeCondition: { name: "CustomerEdge", definedType: "Object" },
                  selections: ([
                    {
                      name: "__typename",
                      type: { name: "String", definedType: "Scalar" },
                      typeCondition: { name: "Customer", definedType: "Object" },
                    }, 
                    {
                      name: "id",
                      type: { name: "ID", definedType: "Scalar" },
                      typeCondition: { name: "Customer", definedType: "Object" },
                    }
                  ] as GraphSelection[]).concat(basicFragmentSelections).map(x => copyWithTypeCondition(x, { name: "Customer", definedType: "Object" }))
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
