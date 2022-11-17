// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace EventPreviewInfoFragmentData {
  export interface Other {
    __typename: '';
  }

}

export type EventPreviewInfoCommonFragmentData = {

  /**
   * The date and time when the event was created.
   */
  createdAt: string;

  /**
   * Human readable text that describes the event.
   */
  message: string;
}

export type EventPreviewInfoUnionFragmentData = EventPreviewInfoFragmentData.Other

export type EventPreviewInfoFragmentData = EventPreviewInfoCommonFragmentData & EventPreviewInfoUnionFragmentData

export const eventPreviewInfoSelections: GraphSelection[] = ([
  {
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }, 
  {
    name: "createdAt",
    type: { name: "DateTime", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }, 
  {
    name: "message",
    type: { name: "FormattedString", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }
] as GraphSelection[])

