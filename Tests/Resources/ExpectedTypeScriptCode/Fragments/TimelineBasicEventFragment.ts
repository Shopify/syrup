// Syrup auto-generated file

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

export type TimelineBasicEventFragmentFragmentData = TimelineBasicEventFragmentFragmentData._BaseFields_ & (TimelineBasicEventFragmentFragmentData.BasicEvent | TimelineBasicEventFragmentFragmentData.Other)

export const timelineBasicEventFragmentTypeCondition = { name: "Event", definedType: "Interface" }

export const timelineBasicEventFragmentSelections: GraphSelection[] = ([
  {
    selectionType: "field",
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }, 
  {
    selectionType: "inlineFragment",
    typeCondition: { name: "BasicEvent", definedType: "Object" },
    selections: ([
      {
        selectionType: "field",
        name: "__typename",
        type: { name: "String", definedType: "Scalar" },
        typeCondition: { name: "BasicEvent", definedType: "Object" },
      }, 
      {
        selectionType: "field",
        name: "attributeToUser",
        type: { name: "Boolean", definedType: "Scalar" },
        typeCondition: { name: "BasicEvent", definedType: "Object" },
      }, 
      {
        selectionType: "field",
        name: "attributeToApp",
        type: { name: "Boolean", definedType: "Scalar" },
        typeCondition: { name: "BasicEvent", definedType: "Object" },
      }
    ] as GraphSelection[])
  }
] as GraphSelection[])

