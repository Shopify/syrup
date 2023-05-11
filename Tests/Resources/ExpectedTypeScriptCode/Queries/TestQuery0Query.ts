// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace TestQuery0QueryData {
  export interface NodesOther {
    __typename: '';
  }
  export interface Nodes_BaseFields_ {
    /**
     * Globally unique identifier.
     */
    id: ID;
  }
  export type Nodes = Nodes_BaseFields_ & (NodesOther)
}

export interface TestQuery0QueryData {

  /**
   * Returns the list of nodes with the given IDs.
   */
  nodes: (TestQuery0QueryData.Nodes | null)[];
}

const document: SyrupOperation<TestQuery0QueryData, {}> = {
  id: "ed2f857cf0d2032aee79d91c5b4aa7165b90ee68eb89cad6438cf4be8d14eddc",
  name: "TestQuery0",
  source: "query TestQuery0 { __typename nodes(ids: [\"gid://shopify/Customer/350635977\"]) { __typename id } }",
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
      name: "nodes",
      type: { name: "Node", definedType: "Interface" },
      typeCondition: { name: "QueryRoot", definedType: "Object" },
      arguments: { ids: { type: "ListValue", value: [{ type: "StringValue", value: "gid://shopify/Customer/350635977" }] } },
      selections: ([
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
    }
  ] as GraphSelection[])
}
export default document
