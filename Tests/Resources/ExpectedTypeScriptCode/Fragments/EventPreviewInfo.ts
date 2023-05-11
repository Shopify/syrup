// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace EventPreviewInfoFragmentData {
  export interface Other {
    __typename: '';
  }

  export interface _BaseFields_ {

    /**
     * The date and time when the event was created.
     */
    createdAt: string;

    /**
     * Human readable text that describes the event.
     */
    message: string;
  }
}

export type EventPreviewInfoFragmentData = EventPreviewInfoFragmentData._BaseFields_ & (EventPreviewInfoFragmentData.Other)

export const eventPreviewInfoTypeCondition = { name: "Event", definedType: "Interface" }

export const eventPreviewInfoSelections: GraphSelection[] = ([
  {
    selectionType: "field",
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }, 
  {
    selectionType: "field",
    name: "createdAt",
    type: { name: "DateTime", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }, 
  {
    selectionType: "field",
    name: "message",
    type: { name: "FormattedString", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }
] as GraphSelection[])

