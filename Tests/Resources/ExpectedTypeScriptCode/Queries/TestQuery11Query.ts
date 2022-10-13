// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace TestQuery11QueryData {
  export interface Variables {
    productId: ID;
  }
  export interface NodeOther {
    __typename: '';
  }
  export interface NodeProductCollectionsEdgesNode {
    __typename: 'Collection';
    /**
     * Globally unique identifier.
     */
    id: ID;
    /**
     * The title of the collection.
     */
    title: string;
  }
  export interface NodeProductCollectionsEdges {
    __typename: 'CollectionEdge';
    /**
     * The item at the end of CollectionEdge.
     */
    node: NodeProductCollectionsEdgesNode;
  }
  export interface NodeProductCollections {
    __typename: 'CollectionConnection';
    /**
     * A list of edges.
     */
    edges: NodeProductCollectionsEdges[];
  }
  export interface NodeProduct {
    __typename: 'Product';
    /**
     * Globally unique identifier.
     */
    id: ID;
    /**
     * A list of the collections that include the product.
     */
    collections: NodeProductCollections;
  }
  export interface NodeProductOption {
    __typename: 'ProductOption';
    /**
     * Globally unique identifier.
     */
    id: ID;
  }
  export type Node = (NodeProduct | NodeProductOption | NodeOther)
}

export interface TestQuery11QueryData {

  /**
   * Returns a specific node by ID.
   */
  node?: TestQuery11QueryData.Node | null;
}

const document: SyrupOperation<TestQuery11QueryData, TestQuery11QueryData.Variables> = {
  id: "109024c16a59d9092444f6f00751dd75a2d2c8bc285734a02ed2dea79a2976a8",
  name: "TestQuery11",
  source: "query TestQuery11(\$productId: ID!) { __typename node(id: \$productId) { __typename ... on Product { __typename id collections(first: 100) { __typename edges { __typename node { __typename id title } } } }... on ProductOption { __typename id } } }",
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
      arguments: { id: { type: "OperationVariableKey", value: "productId" } },
      passedGID: "productId",
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
        }, 
        {
          name: "id",
          type: { name: "ID", definedType: "Scalar" },
          typeCondition: { name: "Product", definedType: "Object" },
        }, 
        {
          name: "collections",
          type: { name: "CollectionConnection", definedType: "Object" },
          typeCondition: { name: "Product", definedType: "Object" },
          arguments: { first: { type: "IntValue", value: 100 } },
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "CollectionConnection", definedType: "Object" },
            }, 
            {
              name: "edges",
              type: { name: "CollectionEdge", definedType: "Object" },
              typeCondition: { name: "CollectionConnection", definedType: "Object" },
              selections: ([
                {
                  name: "__typename",
                  type: { name: "String", definedType: "Scalar" },
                  typeCondition: { name: "CollectionEdge", definedType: "Object" },
                }, 
                {
                  name: "node",
                  type: { name: "Collection", definedType: "Object" },
                  typeCondition: { name: "CollectionEdge", definedType: "Object" },
                  selections: ([
                    {
                      name: "__typename",
                      type: { name: "String", definedType: "Scalar" },
                      typeCondition: { name: "Collection", definedType: "Object" },
                    }, 
                    {
                      name: "id",
                      type: { name: "ID", definedType: "Scalar" },
                      typeCondition: { name: "Collection", definedType: "Object" },
                    }, 
                    {
                      name: "title",
                      type: { name: "String", definedType: "Scalar" },
                      typeCondition: { name: "Collection", definedType: "Object" },
                    }
                  ] as GraphSelection[])
                }
              ] as GraphSelection[])
            }
          ] as GraphSelection[])
        }, 
        {
          name: "__typename",
          type: { name: "String", definedType: "Scalar" },
          typeCondition: { name: "ProductOption", definedType: "Object" },
        }, 
        {
          name: "id",
          type: { name: "ID", definedType: "Scalar" },
          typeCondition: { name: "ProductOption", definedType: "Object" },
        }
      ] as GraphSelection[])
    }
  ] as GraphSelection[])
}
export default document
