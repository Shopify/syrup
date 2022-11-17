// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace EventAlertFragmentData {
  export interface Other {
    __typename: '';
  }

}

export type EventAlertCommonFragmentData = {

  /**
   * Whether the event is critical.
   */
  criticalAlert: boolean;
}

export type EventAlertUnionFragmentData = EventAlertFragmentData.Other

export type EventAlertFragmentData = EventAlertCommonFragmentData & EventAlertUnionFragmentData

export const eventAlertSelections: GraphSelection[] = ([
  {
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }, 
  {
    name: "criticalAlert",
    type: { name: "Boolean", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }
] as GraphSelection[])

