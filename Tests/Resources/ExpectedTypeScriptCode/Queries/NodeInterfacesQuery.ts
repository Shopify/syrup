// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"
import {
  NodeIdFragmentData,
  nodeIdSelections,
  nodeIdTypeCondition,
  ProductNodeTitleFragmentData,
  productNodeTitleSelections,
  productNodeTitleTypeCondition,
  ProductNodeVendorFragmentData,
  productNodeVendorSelections,
  productNodeVendorTypeCondition,
} from "../Fragments"

export namespace NodeInterfacesQueryData {
  export interface Variables {
    nodeId: ID;
  }
  export interface NodeOther {
    __typename: '';
  }
  export interface NodeProduct extends ProductNodeTitleFragmentData, ProductNodeVendorFragmentData {
    __typename: 'Product';
    /**
     * A stripped description of the product, single line with HTML tags removed.
     */
    description: string;
  }
  export interface Node_BaseFields_ extends NodeIdFragmentData._BaseFields_ {
  }
  export type Node = Node_BaseFields_ & (NodeProduct | NodeOther)
}

export interface NodeInterfacesQueryData {

  /**
   * Returns a specific node by ID.
   */
  node?: NodeInterfacesQueryData.Node | null;
}

const document: SyrupOperation<NodeInterfacesQueryData, NodeInterfacesQueryData.Variables> = {
  id: "e87a52477bda63d3aee026d18ca1faaf8e1e39905d9880bfac03a5556495bfc1",
  name: "NodeInterfaces",
  source: "fragment NodeId on Node { __typename id } fragment ProductNodeTitle on Product { __typename title } fragment ProductNodeVendor on Product { __typename vendor } query NodeInterfaces(\$nodeId: ID!) { __typename node(id: \$nodeId) { __typename ... NodeId ... on Product { __typename ... ProductNodeTitle description }... on Product { __typename ... ProductNodeVendor } } }",
  operationType: 'query',
  selections: ([
    {
      selectionType: "field",
      name: "__typename",
      type: { name: "String", definedType: "Scalar" },
      typeCondition: { name: "QueryRoot", definedType: "Object" },
    }, 
    {
      selectionType: "field",
      name: "node",
      type: { name: "Node", definedType: "Interface" },
      typeCondition: { name: "QueryRoot", definedType: "Object" },
      arguments: { id: { type: "OperationVariableKey", value: "nodeId" } },
      passedGID: "nodeId",
      selections: ([
        {
          selectionType: "field",
          name: "__typename",
          type: { name: "String", definedType: "Scalar" },
          typeCondition: { name: "Node", definedType: "Interface" },
        }, 
        {
          selectionType: "fragmentSpread",
          name: "NodeId",
          typeCondition: nodeIdTypeCondition,
          selections: nodeIdSelections
        }, 
        {
          selectionType: "inlineFragment",
          typeCondition: { name: "Product", definedType: "Object" },
          selections: ([
            {
              selectionType: "field",
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "Product", definedType: "Object" },
            }, 
            {
              selectionType: "fragmentSpread",
              name: "ProductNodeTitle",
              typeCondition: productNodeTitleTypeCondition,
              selections: productNodeTitleSelections
            }, 
            {
              selectionType: "field",
              name: "description",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "Product", definedType: "Object" },
            }
          ] as GraphSelection[])
        }, 
        {
          selectionType: "inlineFragment",
          typeCondition: { name: "Product", definedType: "Object" },
          selections: ([
            {
              selectionType: "field",
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "Product", definedType: "Object" },
            }, 
            {
              selectionType: "fragmentSpread",
              name: "ProductNodeVendor",
              typeCondition: productNodeVendorTypeCondition,
              selections: productNodeVendorSelections
            }
          ] as GraphSelection[])
        }
      ] as GraphSelection[])
    }
  ] as GraphSelection[])
}
export default document
