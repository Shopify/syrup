import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"
import {
  TimelineBasicEventFragmentFragmentData,
  timelineBasicEventFragmentSelections,
  TimelineCommentEventFragmentFragmentData,
  timelineCommentEventFragmentSelections,
} from "../Fragments"

export namespace CustomerTimelineQueryData {
  export interface Variables {
    customerId: ID;
  }
  export interface CustomerEventsEdgesNodeOther {
    __typename: '';
  }
  export interface CustomerEventsEdgesNode_BaseFields_ extends TimelineBasicEventFragmentFragmentData._BaseFields_, TimelineCommentEventFragmentFragmentData._BaseFields_ {
    /**
     * Globally unique identifier.
     */
    id: ID;
    /**
     * The date and time when the event was created.
     */
    createdAt: string;
    /**
     * Human readable text that describes the event.
     */
    message: string;
  }
  export type CustomerEventsEdgesNode = CustomerEventsEdgesNode_BaseFields_ & (TimelineBasicEventFragmentFragmentData.BasicEvent | TimelineCommentEventFragmentFragmentData.CommentEvent | CustomerEventsEdgesNodeOther)
  export interface CustomerEventsEdges {
    __typename: 'EventEdge';
    /**
     * The item at the end of EventEdge.
     */
    node: CustomerEventsEdgesNode;
    /**
     * A cursor for use in pagination.
     */
    cursor: string;
  }
  export interface CustomerEventsPageInfo {
    __typename: 'PageInfo';
    /**
     * Indicates if there are more pages to fetch.
     */
    hasNextPage: boolean;
  }
  export interface CustomerEvents {
    __typename: 'EventConnection';
    /**
     * A list of edges.
     */
    edges: CustomerEventsEdges[];
    /**
     * Information to aid in pagination.
     */
    pageInfo: CustomerEventsPageInfo;
  }
  export interface Customer {
    __typename: 'Customer';
    /**
     * A list of events associated with the customer.
     */
    events: CustomerEvents;
  }
}

export interface CustomerTimelineQueryData {

  /**
   * Returns a Customer resource by ID.
   */
  customer?: CustomerTimelineQueryData.Customer | null;
}

const document: SyrupOperation<CustomerTimelineQueryData, CustomerTimelineQueryData.Variables> = {
  id: "f5148ada6684f72c02b7bd7e0d652980d90bad72f6365ebda93134f9abf1b5b8",
  name: "CustomerTimeline",
  source: "fragment TimelineBasicEventFragment on Event { __typename ... on BasicEvent { __typename attributeToUser attributeToApp } } fragment TimelineCommentEventFragment on Event { __typename ... on CommentEvent { __typename edited } } query CustomerTimeline(\$customerId: ID!) { __typename customer(id: \$customerId) { __typename events { __typename edges { __typename node { __typename id createdAt message ... TimelineBasicEventFragment ... TimelineCommentEventFragment } cursor } pageInfo { __typename hasNextPage } } } }",
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
      name: "customer",
      type: { name: "Customer", definedType: "Object" },
      arguments: { id: { type: "OperationVariableKey", value: "customerId" } },
      passedGID: "customerId",
      typeCondition: { name: "QueryRoot", definedType: "Object" },
      directive: null,
      selections: ([
        {
          name: "__typename",
          type: { name: "String", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Customer", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "events",
          type: { name: "EventConnection", definedType: "Object" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Customer", definedType: "Object" },
          directive: null,
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "EventConnection", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "edges",
              type: { name: "EventEdge", definedType: "Object" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "EventConnection", definedType: "Object" },
              directive: null,
              selections: ([
                {
                  name: "__typename",
                  type: { name: "String", definedType: "Scalar" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "EventEdge", definedType: "Object" },
                  directive: null,
                  selections: ([] as GraphSelection[])
                }, 
                {
                  name: "node",
                  type: { name: "Event", definedType: "Interface" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "EventEdge", definedType: "Object" },
                  directive: null,
                  selections: ([
                    {
                      name: "__typename",
                      type: { name: "String", definedType: "Scalar" },
                      arguments: {},
                      passedGID: null,
                      typeCondition: { name: "Event", definedType: "Interface" },
                      directive: null,
                      selections: ([] as GraphSelection[])
                    }, 
                    {
                      name: "id",
                      type: { name: "ID", definedType: "Scalar" },
                      arguments: {},
                      passedGID: null,
                      typeCondition: { name: "Event", definedType: "Interface" },
                      directive: null,
                      selections: ([] as GraphSelection[])
                    }, 
                    {
                      name: "createdAt",
                      type: { name: "DateTime", definedType: "Scalar" },
                      arguments: {},
                      passedGID: null,
                      typeCondition: { name: "Event", definedType: "Interface" },
                      directive: null,
                      selections: ([] as GraphSelection[])
                    }, 
                    {
                      name: "message",
                      type: { name: "FormattedString", definedType: "Scalar" },
                      arguments: {},
                      passedGID: null,
                      typeCondition: { name: "Event", definedType: "Interface" },
                      directive: null,
                      selections: ([] as GraphSelection[])
                    }
                  ] as GraphSelection[]).concat(timelineBasicEventFragmentSelections).concat(timelineCommentEventFragmentSelections)
                }, 
                {
                  name: "cursor",
                  type: { name: "String", definedType: "Scalar" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "EventEdge", definedType: "Object" },
                  directive: null,
                  selections: ([] as GraphSelection[])
                }
              ] as GraphSelection[])
            }, 
            {
              name: "pageInfo",
              type: { name: "PageInfo", definedType: "Object" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "EventConnection", definedType: "Object" },
              directive: null,
              selections: ([
                {
                  name: "__typename",
                  type: { name: "String", definedType: "Scalar" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "PageInfo", definedType: "Object" },
                  directive: null,
                  selections: ([] as GraphSelection[])
                }, 
                {
                  name: "hasNextPage",
                  type: { name: "Boolean", definedType: "Scalar" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "PageInfo", definedType: "Object" },
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
export default document
