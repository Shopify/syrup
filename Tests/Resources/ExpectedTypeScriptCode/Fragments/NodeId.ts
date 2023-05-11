// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace NodeIdFragmentData {
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

export type NodeIdFragmentData = NodeIdFragmentData._BaseFields_ & (NodeIdFragmentData.Other)

export const nodeIdTypeCondition = { name: "Node", definedType: "Interface" }

export const nodeIdSelections: GraphSelection[] = ([
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

