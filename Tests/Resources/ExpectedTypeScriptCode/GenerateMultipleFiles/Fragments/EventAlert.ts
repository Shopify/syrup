// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace EventAlertFragmentData {
  export interface Other {
    __typename: '';
  }

  export interface _BaseFields_ {

    /**
     * Whether the event is critical.
     */
    criticalAlert: boolean;
  }
}

export type EventAlertFragmentData = EventAlertFragmentData.Other

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

