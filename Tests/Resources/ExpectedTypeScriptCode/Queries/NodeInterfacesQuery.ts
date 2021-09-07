import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"
import {
  NodeIdFragmentData,
  nodeIdSelections,
  ProductNodeTitleFragmentData,
  productNodeTitleSelections,
} from "../Fragments"

export namespace NodeInterfacesQueryData {
  export interface Variables {
    nodeId: ID;
  }
  export interface NodeOther {
    __typename: '';
  }
  export interface Node_BaseFields_ extends NodeIdFragmentData._BaseFields_ {
  }
  export type Node = Node_BaseFields_ & (NodeOther)
}

export interface NodeInterfacesQueryData {

  /**
   * Returns a specific node by ID.
   */
  node?: NodeInterfacesQueryData.Node | null;
}

const document: SyrupOperation<NodeInterfacesQueryData, NodeInterfacesQueryData.Variables> = {
  id: "0f655c5eadd67518dc83675127dfbe028058931618ee1ae4dc6095228489f540",
  name: "NodeInterfaces",
  source: "fragment NodeId on Node { __typename id } fragment ProductNodeTitle on Product { __typename title } query NodeInterfaces(\$nodeId: ID!) { __typename node(id: \$nodeId) { __typename ... NodeId ... on Product { __typename ... ProductNodeTitle } } }",
  operationType: 'query',
  selections: ([
    {
      name: "__typename",
      alias: null,
      type: { name: "String", definedType: "Scalar" },
      arguments: {},
      passedGID: null,
      typeCondition: { name: "QueryRoot", definedType: "Object" },
      directive: null,
      selections: ([] as GraphSelection[])
    }, 
    {
      name: "node",
      alias: null,
      type: { name: "Node", definedType: "Interface" },
      arguments: { id: { type: "OperationVariableKey", value: "nodeId" } },
      passedGID: "nodeId",
      typeCondition: { name: "QueryRoot", definedType: "Object" },
      directive: null,
      selections: ([
        {
          name: "__typename",
          alias: null,
          type: { name: "String", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Node", definedType: "Interface" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "__typename",
          alias: null,
          type: { name: "String", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "Product", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }
      ] as GraphSelection[]).concat(nodeIdSelections).concat(productNodeTitleSelections)
    }
  ] as GraphSelection[])
}
export default document
