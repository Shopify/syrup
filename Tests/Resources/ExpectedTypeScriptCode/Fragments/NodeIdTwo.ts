// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace NodeIdTwoFragmentData {
  export interface Other {
    __typename: '';
  }

  export interface _BaseFields_ {

    /**
     * Globally unique identifier.
     */
    id: ID;
  }
}

export type NodeIdTwoFragmentData = NodeIdTwoFragmentData._BaseFields_ & (NodeIdTwoFragmentData.Other)

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

