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

export const basicFragmentSelections: GraphSelection[] = ([
  {
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Customer", definedType: "Object" },
  }, 
  {
    name: "id",
    type: { name: "ID", definedType: "Scalar" },
    typeCondition: { name: "Customer", definedType: "Object" },
  }, 
  {
    name: "lastName",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Customer", definedType: "Object" },
  }
] as GraphSelection[])
