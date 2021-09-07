import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"
import {
  CurrencyCode,
  WeightUnit,
  OrderDisplayFulfillmentStatus,
  FulfillmentDisplayStatus,
  FulfillmentEventStatus,
} from "../Enums"

export namespace TestQuery7QueryData {
  export interface Variables {
    first?: number | null;
  }
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
  export interface ShopServices {
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
  export interface ShopOrdersEdgesNodeFulfillmentsEventsEdgesNode {
    __typename: 'FulfillmentEvent';
    /**
     * The status of this fulfillment event.
     */
    status: FulfillmentEventStatus;
  }
  export interface ShopOrdersEdgesNodeFulfillmentsEventsEdges {
    __typename: 'FulfillmentEventEdge';
    /**
     * The item at the end of FulfillmentEventEdge.
     */
    node: ShopOrdersEdgesNodeFulfillmentsEventsEdgesNode;
  }
  export interface ShopOrdersEdgesNodeFulfillmentsEvents {
    __typename: 'FulfillmentEventConnection';
    /**
     * A list of edges.
     */
    edges: ShopOrdersEdgesNodeFulfillmentsEventsEdges[];
  }
  export interface ShopOrdersEdgesNodeFulfillments {
    __typename: 'Fulfillment';
    /**
     * Human readable reference identifier for this fulfillment.
     */
    name: string;
    /**
     * The date and time when the fulfillment was created.
     */
    createdAt: string;
    /**
     * The date and time when the fulfillment went into transit.
     */
    inTransitAt?: string | null;
    /**
     * The date that this fulfillment was delivered.
     */
    deliveredAt?: string | null;
    /**
     * Human readable display status for this fulfillment.
     */
    displayStatus?: FulfillmentDisplayStatus | null;
    /**
     * The history of events associated with this fulfillment.
     */
    events: ShopOrdersEdgesNodeFulfillmentsEvents;
  }
  export interface ShopOrdersEdgesNode {
    __typename: 'Order';
    /**
     * Unique identifier for the order that appears on the order.
     * For example, _#1000_ or _Store1001.
     * This value is not unique across multiple stores.
     */
    name: string;
    /**
     * Fulfillment status for the order that can be shown to the merchant.
     * This field does not capture all the possible details of an order's fulfillment state. It should only be used for display summary purposes.
     */
    displayFulfillmentStatus: OrderDisplayFulfillmentStatus;
    /**
     * List of shipments for the order.
     */
    fulfillments: ShopOrdersEdgesNodeFulfillments[];
  }
  export interface ShopOrdersEdges {
    __typename: 'OrderEdge';
    /**
     * The item at the end of OrderEdge.
     */
    node: ShopOrdersEdgesNode;
  }
  export interface ShopOrders {
    __typename: 'OrderConnection';
    /**
     * A list of edges.
     */
    edges: ShopOrdersEdges[];
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
    services: ShopServices[];
    /**
     * List of orders placed on the shop.
     *
     * @deprecated Use `QueryRoot.orders` instead.
     */
    orders: ShopOrders;
  }
}

export interface TestQuery7QueryData {

  /**
   * Returns a Shop resource corresponding to access token used in request.
   */
  shop: TestQuery7QueryData.Shop;
}

const document: SyrupOperation<TestQuery7QueryData, TestQuery7QueryData.Variables> = {
  id: "fea84634662eff752b6ddb956e3f566e4862ee3a26b0b01dab1ff8872be27700",
  name: "TestQuery7",
  source: "query TestQuery7(\$first: Int) { __typename shop { __typename name currencyCode weightUnit billingAddress { __typename city company latitude longitude } services: fulfillmentServices { __typename serviceName handle } orders(first: \$first) { __typename edges { __typename node { __typename name displayFulfillmentStatus fulfillments { __typename name createdAt inTransitAt deliveredAt displayStatus events(first: 10) { __typename edges { __typename node { __typename status } } } } } } } } }",
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
          name: "fulfillmentServices",
          type: { name: "FulfillmentService", definedType: "Object" },
          typeCondition: { name: "Shop", definedType: "Object" },
          alias: services,
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "FulfillmentService", definedType: "Object" },
            }, 
            {
              name: "serviceName",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "FulfillmentService", definedType: "Object" },
            }, 
            {
              name: "handle",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "FulfillmentService", definedType: "Object" },
            }
          ] as GraphSelection[])
        }, 
        {
          name: "orders",
          type: { name: "OrderConnection", definedType: "Object" },
          typeCondition: { name: "Shop", definedType: "Object" },
          arguments: { first: { type: "OperationVariableKey", value: "first" } },
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "OrderConnection", definedType: "Object" },
            }, 
            {
              name: "edges",
              type: { name: "OrderEdge", definedType: "Object" },
              typeCondition: { name: "OrderConnection", definedType: "Object" },
              selections: ([
                {
                  name: "__typename",
                  type: { name: "String", definedType: "Scalar" },
                  typeCondition: { name: "OrderEdge", definedType: "Object" },
                }, 
                {
                  name: "node",
                  type: { name: "Order", definedType: "Object" },
                  typeCondition: { name: "OrderEdge", definedType: "Object" },
                  selections: ([
                    {
                      name: "__typename",
                      type: { name: "String", definedType: "Scalar" },
                      typeCondition: { name: "Order", definedType: "Object" },
                    }, 
                    {
                      name: "name",
                      type: { name: "String", definedType: "Scalar" },
                      typeCondition: { name: "Order", definedType: "Object" },
                    }, 
                    {
                      name: "displayFulfillmentStatus",
                      type: { name: "OrderDisplayFulfillmentStatus", definedType: "Scalar" },
                      typeCondition: { name: "Order", definedType: "Object" },
                    }, 
                    {
                      name: "fulfillments",
                      type: { name: "Fulfillment", definedType: "Object" },
                      typeCondition: { name: "Order", definedType: "Object" },
                      selections: ([
                        {
                          name: "__typename",
                          type: { name: "String", definedType: "Scalar" },
                          typeCondition: { name: "Fulfillment", definedType: "Object" },
                        }, 
                        {
                          name: "name",
                          type: { name: "String", definedType: "Scalar" },
                          typeCondition: { name: "Fulfillment", definedType: "Object" },
                        }, 
                        {
                          name: "createdAt",
                          type: { name: "DateTime", definedType: "Scalar" },
                          typeCondition: { name: "Fulfillment", definedType: "Object" },
                        }, 
                        {
                          name: "inTransitAt",
                          type: { name: "DateTime", definedType: "Scalar" },
                          typeCondition: { name: "Fulfillment", definedType: "Object" },
                        }, 
                        {
                          name: "deliveredAt",
                          type: { name: "DateTime", definedType: "Scalar" },
                          typeCondition: { name: "Fulfillment", definedType: "Object" },
                        }, 
                        {
                          name: "displayStatus",
                          type: { name: "FulfillmentDisplayStatus", definedType: "Scalar" },
                          typeCondition: { name: "Fulfillment", definedType: "Object" },
                        }, 
                        {
                          name: "events",
                          type: { name: "FulfillmentEventConnection", definedType: "Object" },
                          typeCondition: { name: "Fulfillment", definedType: "Object" },
                          arguments: { first: { type: "IntValue", value: 10 } },
                          selections: ([
                            {
                              name: "__typename",
                              type: { name: "String", definedType: "Scalar" },
                              typeCondition: { name: "FulfillmentEventConnection", definedType: "Object" },
                            }, 
                            {
                              name: "edges",
                              type: { name: "FulfillmentEventEdge", definedType: "Object" },
                              typeCondition: { name: "FulfillmentEventConnection", definedType: "Object" },
                              selections: ([
                                {
                                  name: "__typename",
                                  type: { name: "String", definedType: "Scalar" },
                                  typeCondition: { name: "FulfillmentEventEdge", definedType: "Object" },
                                }, 
                                {
                                  name: "node",
                                  type: { name: "FulfillmentEvent", definedType: "Object" },
                                  typeCondition: { name: "FulfillmentEventEdge", definedType: "Object" },
                                  selections: ([
                                    {
                                      name: "__typename",
                                      type: { name: "String", definedType: "Scalar" },
                                      typeCondition: { name: "FulfillmentEvent", definedType: "Object" },
                                    }, 
                                    {
                                      name: "status",
                                      type: { name: "FulfillmentEventStatus", definedType: "Scalar" },
                                      typeCondition: { name: "FulfillmentEvent", definedType: "Object" },
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
              ] as GraphSelection[])
            }
          ] as GraphSelection[])
        }
      ] as GraphSelection[])
    }
  ] as GraphSelection[])
}
export default document
