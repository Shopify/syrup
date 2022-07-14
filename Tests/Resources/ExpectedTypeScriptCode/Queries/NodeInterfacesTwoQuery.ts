// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"
import {
  NodeIdTwoFragmentData,
  nodeIdTwoSelections,
  ProductNodeTitleTwoFragmentData,
  productNodeTitleTwoSelections,
} from "../Fragments"

export namespace NodeInterfacesTwoQueryData {
  export interface Variables {
    nodeId: ID;
  }
  export interface NodeOther {
    __typename: '';
  }
  export interface Node_BaseFields_ extends NodeIdTwoFragmentData._BaseFields_ {
  }
  export type Node = Node_BaseFields_ & (ProductNodeTitleTwoFragmentData | NodeOther)
}

export interface NodeInterfacesTwoQueryData {

  /**
   * Returns a specific node by ID.
   */
  node?: NodeInterfacesTwoQueryData.Node | null;
}

const document: SyrupOperation<NodeInterfacesTwoQueryData, NodeInterfacesTwoQueryData.Variables> = {
  id: "04de056b809ae8b454fc73efd32b02114e4f3dfc298f444a4dc1990ba6e0e698",
  name: "NodeInterfacesTwo",
  source: "fragment NodeIdTwo on Node { __typename id } fragment ProductNodeTitleTwo on Product { __typename title vendor } query NodeInterfacesTwo(\$nodeId: ID!) { __typename node(id: \$nodeId) { __typename ... NodeIdTwo ... on Product { __typename ... ProductNodeTitleTwo } } }",
  operationType: 'query',
  selections: ([
    {
      name: "__typename",
      type: { name: "String", definedType: "Scalar" },
      typeCondition: { name: "QueryRoot", definedType: "Object" },
    }, 
    {
      name: "node",
      type: { name: "Node", definedType: "Interface" },
      typeCondition: { name: "QueryRoot", definedType: "Object" },
      arguments: { id: { type: "OperationVariableKey", value: "nodeId" } },
      passedGID: "nodeId",
      selections: ([
        {
          name: "__typename",
          type: { name: "String", definedType: "Scalar" },
          typeCondition: { name: "Node", definedType: "Interface" },
        }, 
        {
          name: "__typename",
          type: { name: "String", definedType: "Scalar" },
          typeCondition: { name: "Product", definedType: "Object" },
        }
      ] as GraphSelection[]).concat(nodeIdTwoSelections).concat(productNodeTitleTwoSelections)
    }
  ] as GraphSelection[])
}
export default document
