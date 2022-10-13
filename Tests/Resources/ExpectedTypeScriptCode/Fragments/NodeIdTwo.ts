// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace NodeIdTwoFragmentData {
  export interface Other {
    __typename: '';
  }

}

export type NodeIdTwoCommonFragmentData = {

  /**
   * Globally unique identifier.
   */
  id: ID;
}

export type NodeIdTwoUnionFragmentData = NodeIdTwoFragmentData.Other

export type NodeIdTwoFragmentData = NodeIdTwoCommonFragmentData & NodeIdTwoUnionFragmentData

export const nodeIdTwoSelections: GraphSelection[] = ([
  {
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Node", definedType: "Interface" },
  }, 
  {
    name: "id",
    type: { name: "ID", definedType: "Scalar" },
    typeCondition: { name: "Node", definedType: "Interface" },
  }
] as GraphSelection[])

