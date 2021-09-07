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
    alias: null,
    type: { name: "String", definedType: "Scalar" },
    arguments: {},
    passedGID: null,
    typeCondition: { name: "Customer", definedType: "Object" },
    directive: null,
    selections: ([] as GraphSelection[])
  }, 
  {
    name: "id",
    alias: null,
    type: { name: "ID", definedType: "Scalar" },
    arguments: {},
    passedGID: null,
    typeCondition: { name: "Customer", definedType: "Object" },
    directive: null,
    selections: ([] as GraphSelection[])
  }, 
  {
    name: "lastName",
    alias: null,
    type: { name: "String", definedType: "Scalar" },
    arguments: {},
    passedGID: null,
    typeCondition: { name: "Customer", definedType: "Object" },
    directive: null,
    selections: ([] as GraphSelection[])
  }
] as GraphSelection[])
