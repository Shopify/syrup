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
      alias: null,
      type: { name: "String", definedType: "Scalar" },
      arguments: {},
      passedGID: null,
      typeCondition: { name: "QueryRoot", definedType: "Object" },
      directive: null,
      selections: ([] as GraphSelection[])
    }, 
    {
      name: "products",
      alias: null,
      type: { name: "ProductConnection", definedType: "Object" },
      arguments: { first: { type: "OperationVariableKey", value: "first" }, reverse: { type: "BooleanValue", value: true }, before: { type: "OperationVariableKey", value: "before" }, after: { type: "OperationVariableKey", value: "after" }, sortKey: { type: "EnumValue", value: "CREATED_AT" } },
      passedGID: null,
      typeCondition: { name: "QueryRoot", definedType: "Object" },
      directive: null,
      selections: ([
        {
          name: "__typename",
          alias: null,
          type: { name: "String", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "ProductConnection", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "edges",
          alias: null,
          type: { name: "ProductEdge", definedType: "Object" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "ProductConnection", definedType: "Object" },
          directive: null,
          selections: ([
            {
              name: "__typename",
              alias: null,
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "ProductEdge", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "node",
              alias: null,
              type: { name: "Product", definedType: "Object" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "ProductEdge", definedType: "Object" },
              directive: null,
              selections: ([
                {
                  name: "__typename",
                  alias: null,
                  type: { name: "String", definedType: "Scalar" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "Product", definedType: "Object" },
                  directive: null,
                  selections: ([] as GraphSelection[])
                }, 
                {
                  name: "id",
                  alias: null,
                  type: { name: "ID", definedType: "Scalar" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "Product", definedType: "Object" },
                  directive: null,
                  selections: ([] as GraphSelection[])
                }, 
                {
                  name: "title",
                  alias: null,
                  type: { name: "String", definedType: "Scalar" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "Product", definedType: "Object" },
                  directive: null,
                  selections: ([] as GraphSelection[])
                }, 
                {
                  name: "description",
                  alias: null,
                  type: { name: "String", definedType: "Scalar" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "Product", definedType: "Object" },
                  directive: null,
                  selections: ([] as GraphSelection[])
                }
              ] as GraphSelection[])
            }, 
            {
              name: "cursor",
              alias: null,
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "ProductEdge", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }
          ] as GraphSelection[])
        }
      ] as GraphSelection[])
    }
  ] as GraphSelection[])
}
export default document
