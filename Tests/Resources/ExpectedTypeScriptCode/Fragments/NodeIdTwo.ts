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

export const nodeIdTwoTypeCondition = { name: "Node", definedType: "Interface" }

export const nodeIdTwoSelections: GraphSelection[] = ([
  {
    selectionType: "field",
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Node", definedType: "Interface" },
  }, 
  {
    selectionType: "field",
    name: "id",
    type: { name: "ID", definedType: "Scalar" },
    typeCondition: { name: "Node", definedType: "Interface" },
  }
] as GraphSelection[])

