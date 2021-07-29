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
    fulfillmentServices: ShopFulfillmentServices[];
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
  id: "a98d6ba582aebef8a6fb097fd255dd62e31db9fafbf4d3a0183380bfc329eee3",
  name: "TestQuery7",
  source: "query TestQuery7(\$first: Int) { __typename shop { __typename name currencyCode weightUnit billingAddress { __typename city company latitude longitude } fulfillmentServices { __typename serviceName handle } orders(first: \$first) { __typename edges { __typename node { __typename name displayFulfillmentStatus fulfillments { __typename name createdAt inTransitAt deliveredAt displayStatus events(first: 10) { __typename edges { __typename node { __typename status } } } } } } } } }",
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
          name: "name",
          type: { name: "String", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Shop", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "currencyCode",
          type: { name: "CurrencyCode", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Shop", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "weightUnit",
          type: { name: "WeightUnit", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Shop", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "billingAddress",
          type: { name: "MailingAddress", definedType: "Object" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Shop", definedType: "Object" },
          directive: null,
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "MailingAddress", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "city",
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "MailingAddress", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "company",
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "MailingAddress", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "latitude",
              type: { name: "Float", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "MailingAddress", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "longitude",
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
          type: { name: "FulfillmentService", definedType: "Object" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Shop", definedType: "Object" },
          directive: null,
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "FulfillmentService", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "serviceName",
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "FulfillmentService", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "handle",
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "FulfillmentService", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }
          ] as GraphSelection[])
        }, 
        {
          name: "orders",
          type: { name: "OrderConnection", definedType: "Object" },
          arguments: { first: { type: "OperationVariableKey", value: "first" } },
          passedGID: null,
          typeCondition: { name: "Shop", definedType: "Object" },
          directive: null,
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "OrderConnection", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "edges",
              type: { name: "OrderEdge", definedType: "Object" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "OrderConnection", definedType: "Object" },
              directive: null,
              selections: ([
                {
                  name: "__typename",
                  type: { name: "String", definedType: "Scalar" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "OrderEdge", definedType: "Object" },
                  directive: null,
                  selections: ([] as GraphSelection[])
                }, 
                {
                  name: "node",
                  type: { name: "Order", definedType: "Object" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "OrderEdge", definedType: "Object" },
                  directive: null,
                  selections: ([
                    {
                      name: "__typename",
                      type: { name: "String", definedType: "Scalar" },
                      arguments: {},
                      passedGID: null,
                      typeCondition: { name: "Order", definedType: "Object" },
                      directive: null,
                      selections: ([] as GraphSelection[])
                    }, 
                    {
                      name: "name",
                      type: { name: "String", definedType: "Scalar" },
                      arguments: {},
                      passedGID: null,
                      typeCondition: { name: "Order", definedType: "Object" },
                      directive: null,
                      selections: ([] as GraphSelection[])
                    }, 
                    {
                      name: "displayFulfillmentStatus",
                      type: { name: "OrderDisplayFulfillmentStatus", definedType: "Scalar" },
                      arguments: {},
                      passedGID: null,
                      typeCondition: { name: "Order", definedType: "Object" },
                      directive: null,
                      selections: ([] as GraphSelection[])
                    }, 
                    {
                      name: "fulfillments",
                      type: { name: "Fulfillment", definedType: "Object" },
                      arguments: {},
                      passedGID: null,
                      typeCondition: { name: "Order", definedType: "Object" },
                      directive: null,
                      selections: ([
                        {
                          name: "__typename",
                          type: { name: "String", definedType: "Scalar" },
                          arguments: {},
                          passedGID: null,
                          typeCondition: { name: "Fulfillment", definedType: "Object" },
                          directive: null,
                          selections: ([] as GraphSelection[])
                        }, 
                        {
                          name: "name",
                          type: { name: "String", definedType: "Scalar" },
                          arguments: {},
                          passedGID: null,
                          typeCondition: { name: "Fulfillment", definedType: "Object" },
                          directive: null,
                          selections: ([] as GraphSelection[])
                        }, 
                        {
                          name: "createdAt",
                          type: { name: "DateTime", definedType: "Scalar" },
                          arguments: {},
                          passedGID: null,
                          typeCondition: { name: "Fulfillment", definedType: "Object" },
                          directive: null,
                          selections: ([] as GraphSelection[])
                        }, 
                        {
                          name: "inTransitAt",
                          type: { name: "DateTime", definedType: "Scalar" },
                          arguments: {},
                          passedGID: null,
                          typeCondition: { name: "Fulfillment", definedType: "Object" },
                          directive: null,
                          selections: ([] as GraphSelection[])
                        }, 
                        {
                          name: "deliveredAt",
                          type: { name: "DateTime", definedType: "Scalar" },
                          arguments: {},
                          passedGID: null,
                          typeCondition: { name: "Fulfillment", definedType: "Object" },
                          directive: null,
                          selections: ([] as GraphSelection[])
                        }, 
                        {
                          name: "displayStatus",
                          type: { name: "FulfillmentDisplayStatus", definedType: "Scalar" },
                          arguments: {},
                          passedGID: null,
                          typeCondition: { name: "Fulfillment", definedType: "Object" },
                          directive: null,
                          selections: ([] as GraphSelection[])
                        }, 
                        {
                          name: "events",
                          type: { name: "FulfillmentEventConnection", definedType: "Object" },
                          arguments: { first: { type: "IntValue", value: 10 } },
                          passedGID: null,
                          typeCondition: { name: "Fulfillment", definedType: "Object" },
                          directive: null,
                          selections: ([
                            {
                              name: "__typename",
                              type: { name: "String", definedType: "Scalar" },
                              arguments: {},
                              passedGID: null,
                              typeCondition: { name: "FulfillmentEventConnection", definedType: "Object" },
                              directive: null,
                              selections: ([] as GraphSelection[])
                            }, 
                            {
                              name: "edges",
                              type: { name: "FulfillmentEventEdge", definedType: "Object" },
                              arguments: {},
                              passedGID: null,
                              typeCondition: { name: "FulfillmentEventConnection", definedType: "Object" },
                              directive: null,
                              selections: ([
                                {
                                  name: "__typename",
                                  type: { name: "String", definedType: "Scalar" },
                                  arguments: {},
                                  passedGID: null,
                                  typeCondition: { name: "FulfillmentEventEdge", definedType: "Object" },
                                  directive: null,
                                  selections: ([] as GraphSelection[])
                                }, 
                                {
                                  name: "node",
                                  type: { name: "FulfillmentEvent", definedType: "Object" },
                                  arguments: {},
                                  passedGID: null,
                                  typeCondition: { name: "FulfillmentEventEdge", definedType: "Object" },
                                  directive: null,
                                  selections: ([
                                    {
                                      name: "__typename",
                                      type: { name: "String", definedType: "Scalar" },
                                      arguments: {},
                                      passedGID: null,
                                      typeCondition: { name: "FulfillmentEvent", definedType: "Object" },
                                      directive: null,
                                      selections: ([] as GraphSelection[])
                                    }, 
                                    {
                                      name: "status",
                                      type: { name: "FulfillmentEventStatus", definedType: "Scalar" },
                                      arguments: {},
                                      passedGID: null,
                                      typeCondition: { name: "FulfillmentEvent", definedType: "Object" },
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
              ] as GraphSelection[])
            }
          ] as GraphSelection[])
        }
      ] as GraphSelection[])
    }
  ] as GraphSelection[])
}
export default document
