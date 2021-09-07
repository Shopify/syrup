import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace ProductsListQueryData {
  export interface Variables {
    first?: number | null;
    before?: string | null;
    after?: string | null;
  }
  export interface ProductsEdgesNode {
    __typename: 'Product';
    /**
     * Globally unique identifier.
     */
    id: ID;
    /**
     * The title of the product.
     */
    title: string;
    /**
     * A stripped description of the product, single line with HTML tags removed.
     */
    description: string;
  }
  export interface ProductsEdges {
    __typename: 'ProductEdge';
    /**
     * The item at the end of ProductEdge.
     */
    node: ProductsEdgesNode;
    /**
     * A cursor for use in pagination.
     */
    cursor: string;
  }
  export interface Products {
    __typename: 'ProductConnection';
    /**
     * A list of edges.
     */
    edges: ProductsEdges[];
  }
}

export interface ProductsListQueryData {

  /**
   * List of products.
   */
  products: ProductsListQueryData.Products;
}

const document: SyrupOperation<ProductsListQueryData, ProductsListQueryData.Variables> = {
  id: "fb66b396a448514165511363b2dd4240640e9cc0bb880f30df7da076efb2c3c2",
  name: "ProductsList",
  source: "query ProductsList(\$first: Int, \$before: String, \$after: String) { __typename products(first: \$first, reverse: true, before: \$before, after: \$after, sortKey: CREATED_AT) { __typename edges { __typename node { __typename id title description } cursor } } }",
  operationType: 'query',
  selections: ([
    {
      name: "__typename",
      type: { name: "String", definedType: "Scalar" },
      typeCondition: { name: "QueryRoot", definedType: "Object" },
    }, 
    {
      name: "products",
      type: { name: "ProductConnection", definedType: "Object" },
      typeCondition: { name: "QueryRoot", definedType: "Object" },
      arguments: { first: { type: "OperationVariableKey", value: "first" }, reverse: { type: "BooleanValue", value: true }, before: { type: "OperationVariableKey", value: "before" }, after: { type: "OperationVariableKey", value: "after" }, sortKey: { type: "EnumValue", value: "CREATED_AT" } },
      selections: ([
        {
          name: "__typename",
          type: { name: "String", definedType: "Scalar" },
          typeCondition: { name: "ProductConnection", definedType: "Object" },
        }, 
        {
          name: "edges",
          type: { name: "ProductEdge", definedType: "Object" },
          typeCondition: { name: "ProductConnection", definedType: "Object" },
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "ProductEdge", definedType: "Object" },
            }, 
            {
              name: "node",
              type: { name: "Product", definedType: "Object" },
              typeCondition: { name: "ProductEdge", definedType: "Object" },
              selections: ([
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
                  name: "title",
                  type: { name: "String", definedType: "Scalar" },
                  typeCondition: { name: "Product", definedType: "Object" },
                }, 
                {
                  name: "description",
                  type: { name: "String", definedType: "Scalar" },
                  typeCondition: { name: "Product", definedType: "Object" },
                }
              ] as GraphSelection[])
            }, 
            {
              name: "cursor",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "ProductEdge", definedType: "Object" },
            }
          ] as GraphSelection[])
        }
      ] as GraphSelection[])
    }
  ] as GraphSelection[])
}
export default document
