// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace NodeIdFragmentData {
  export interface Other {
    __typename: '';
  }

}

export type NodeIdCommonFragmentData = {

  /**
   * Globally unique identifier.
   */
  id: ID;
}

export type NodeIdUnionFragmentData = NodeIdFragmentData.Other

export type NodeIdFragmentData = NodeIdCommonFragmentData & NodeIdUnionFragmentData

export const nodeIdSelections: GraphSelection[] = ([
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

