// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace EventAttributeFieldsFragmentData {
  export interface Other {
    __typename: '';
  }

}

export type EventAttributeFieldsCommonFragmentData = {

  /**
   * Whether the event was created by an app.
   */
  attributeToApp: boolean;

  /**
   * Whether the event was caused by an admin user.
   */
  attributeToUser: boolean;
}

export type EventAttributeFieldsUnionFragmentData = EventAttributeFieldsFragmentData.Other

export type EventAttributeFieldsFragmentData = EventAttributeFieldsCommonFragmentData & EventAttributeFieldsUnionFragmentData

export const eventAttributeFieldsSelections: GraphSelection[] = ([
  {
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }, 
  {
    name: "attributeToApp",
    type: { name: "Boolean", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }, 
  {
    name: "attributeToUser",
    type: { name: "Boolean", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }
] as GraphSelection[])

