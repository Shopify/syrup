// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace EventAttributeFieldsFragmentData {
  export interface Other {
    __typename: '';
  }

  export interface _BaseFields_ {

    /**
     * Whether the event was created by an app.
     */
    attributeToApp: boolean;

    /**
     * Whether the event was caused by an admin user.
     */
    attributeToUser: boolean;
  }
}

export type EventAttributeFieldsFragmentData = EventAttributeFieldsFragmentData._BaseFields_ & (EventAttributeFieldsFragmentData.Other)

export const eventAttributeFieldsTypeCondition = { name: "Event", definedType: "Interface" }

export const eventAttributeFieldsSelections: GraphSelection[] = ([
  {
    selectionType: "field",
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }, 
  {
    selectionType: "field",
    name: "attributeToApp",
    type: { name: "Boolean", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }, 
  {
    selectionType: "field",
    name: "attributeToUser",
    type: { name: "Boolean", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }
] as GraphSelection[])

