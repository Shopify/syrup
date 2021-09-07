import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace TimelineBasicEventFragmentFragmentData {
  export interface Other {
    __typename: '';
  }

  export interface BasicEvent {
    __typename: 'BasicEvent';
    /**
     * Whether the event was caused by an admin user.
     */
    attributeToUser: boolean;
    /**
     * Whether the event was created by an app.
     */
    attributeToApp: boolean;
  }

  export interface _BaseFields_ {
  }
}

export type TimelineBasicEventFragmentFragmentData = TimelineBasicEventFragmentFragmentData.BasicEvent | TimelineBasicEventFragmentFragmentData.Other

export const timelineBasicEventFragmentSelections: GraphSelection[] = ([
  {
    name: "__typename",
    alias: null,
    type: { name: "String", definedType: "Scalar" },
    arguments: {},
    passedGID: null,
    typeCondition: { name: "Event", definedType: "Interface" },
    directive: null,
    selections: ([] as GraphSelection[])
  }, 
  {
    name: "__typename",
    alias: null,
    type: { name: "String", definedType: "Scalar" },
    arguments: {},
    passedGID: null,
    typeCondition: { name: "BasicEvent", definedType: "Object" },
    directive: null,
    selections: ([] as GraphSelection[])
  }, 
  {
    name: "attributeToUser",
    alias: null,
    type: { name: "Boolean", definedType: "Scalar" },
    arguments: {},
    passedGID: null,
    typeCondition: { name: "BasicEvent", definedType: "Object" },
    directive: null,
    selections: ([] as GraphSelection[])
  }, 
  {
    name: "attributeToApp",
    alias: null,
    type: { name: "Boolean", definedType: "Scalar" },
    arguments: {},
    passedGID: null,
    typeCondition: { name: "BasicEvent", definedType: "Object" },
    directive: null,
    selections: ([] as GraphSelection[])
  }
] as GraphSelection[])

