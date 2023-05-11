// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace BasicFragmentFragmentData {
}

export interface BasicFragmentFragmentData {
  __typename: 'Customer';

  /**
   * Globally unique identifier.
   */
  id: ID;

  /**
   * The customer's last name.
   */
  lastName?: string | null;
}

export const basicFragmentTypeCondition = { name: "Customer", definedType: "Object" }

export const basicFragmentSelections: GraphSelection[] = ([
  {
    selectionType: "field",
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Customer", definedType: "Object" },
  }, 
  {
    selectionType: "field",
    name: "id",
    type: { name: "ID", definedType: "Scalar" },
    typeCondition: { name: "Customer", definedType: "Object" },
  }, 
  {
    selectionType: "field",
    name: "lastName",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Customer", definedType: "Object" },
  }
] as GraphSelection[])
