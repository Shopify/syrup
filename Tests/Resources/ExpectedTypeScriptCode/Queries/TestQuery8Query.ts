// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace TestQuery8QueryData {
  export interface ShopFirstProductEdgesNode {
    __typename: 'Product';
    /**
     * The title of the product.
     */
    title: string;
  }
  export interface ShopFirstProductEdges {
    __typename: 'ProductEdge';
    /**
     * A cursor for use in pagination.
     */
    cursor: string;
    /**
     * The item at the end of ProductEdge.
     */
    node: ShopFirstProductEdgesNode;
  }
  export interface ShopFirstProduct {
    __typename: 'ProductConnection';
    /**
     * A list of edges.
     */
    edges: ShopFirstProductEdges[];
  }
  export interface ShopLastProductEdgesNode {
    __typename: 'Product';
    /**
     * The title of the product.
     */
    title: string;
  }
  export interface ShopLastProductEdges {
    __typename: 'ProductEdge';
    /**
     * A cursor for use in pagination.
     */
    cursor: string;
    /**
     * The item at the end of ProductEdge.
     */
    node: ShopLastProductEdgesNode;
  }
  export interface ShopLastProduct {
    __typename: 'ProductConnection';
    /**
     * A list of edges.
     */
    edges: ShopLastProductEdges[];
  }
  export interface Shop {
    __typename: 'Shop';
    /**
     * Globally unique identifier.
     */
    id: ID;
    /**
     * List of the shop's products.
     *
     * @deprecated Use `QueryRoot.products`.
     */
    firstProduct: ShopFirstProduct;
    /**
     * List of the shop's products.
     *
     * @deprecated Use `QueryRoot.products`.
     */
    lastProduct: ShopLastProduct;
  }
}

export interface TestQuery8QueryData {

  /**
   * Returns a Shop resource corresponding to access token used in request.
   */
  shop: TestQuery8QueryData.Shop;
}

const document: SyrupOperation<TestQuery8QueryData, {}> = {
  id: "990334aad4748bb21ca83087aa5ad2fb617f68e08ce05993420ce5cc8d4a6318",
  name: "TestQuery8",
  source: "query TestQuery8 { __typename shop { __typename id firstProduct: products(first: 1) { __typename edges { __typename cursor node { __typename title } } } lastProduct: products(first: 1, reverse: true) { __typename edges { __typename cursor node { __typename title } } } } }",
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
      name: "shop",
      type: { name: "Shop", definedType: "Object" },
      typeCondition: { name: "QueryRoot", definedType: "Object" },
      selections: ([
        {
          selectionType: "field",
          name: "__typename",
          type: { name: "String", definedType: "Scalar" },
          typeCondition: { name: "Shop", definedType: "Object" },
        }, 
        {
          selectionType: "field",
          name: "id",
          type: { name: "ID", definedType: "Scalar" },
          typeCondition: { name: "Shop", definedType: "Object" },
        }, 
        {
          selectionType: "field",
          name: "products",
          type: { name: "ProductConnection", definedType: "Object" },
          typeCondition: { name: "Shop", definedType: "Object" },
          alias: "firstProduct",
          arguments: { first: { type: "IntValue", value: 1 } },
          selections: ([
            {
              selectionType: "field",
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "ProductConnection", definedType: "Object" },
            }, 
            {
              selectionType: "field",
              name: "edges",
              type: { name: "ProductEdge", definedType: "Object" },
              typeCondition: { name: "ProductConnection", definedType: "Object" },
              selections: ([
                {
                  selectionType: "field",
                  name: "__typename",
                  type: { name: "String", definedType: "Scalar" },
                  typeCondition: { name: "ProductEdge", definedType: "Object" },
                }, 
                {
                  selectionType: "field",
                  name: "cursor",
                  type: { name: "String", definedType: "Scalar" },
                  typeCondition: { name: "ProductEdge", definedType: "Object" },
                }, 
                {
                  selectionType: "field",
                  name: "node",
                  type: { name: "Product", definedType: "Object" },
                  typeCondition: { name: "ProductEdge", definedType: "Object" },
                  selections: ([
                    {
                      selectionType: "field",
                      name: "__typename",
                      type: { name: "String", definedType: "Scalar" },
                      typeCondition: { name: "Product", definedType: "Object" },
                    }, 
                    {
                      selectionType: "field",
                      name: "title",
                      type: { name: "String", definedType: "Scalar" },
                      typeCondition: { name: "Product", definedType: "Object" },
                    }
                  ] as GraphSelection[])
                }
              ] as GraphSelection[])
            }
          ] as GraphSelection[])
        }, 
        {
          selectionType: "field",
          name: "products",
          type: { name: "ProductConnection", definedType: "Object" },
          typeCondition: { name: "Shop", definedType: "Object" },
          alias: "lastProduct",
          arguments: { first: { type: "IntValue", value: 1 }, reverse: { type: "BooleanValue", value: true } },
          selections: ([
            {
              selectionType: "field",
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "ProductConnection", definedType: "Object" },
            }, 
            {
              selectionType: "field",
              name: "edges",
              type: { name: "ProductEdge", definedType: "Object" },
              typeCondition: { name: "ProductConnection", definedType: "Object" },
              selections: ([
                {
                  selectionType: "field",
                  name: "__typename",
                  type: { name: "String", definedType: "Scalar" },
                  typeCondition: { name: "ProductEdge", definedType: "Object" },
                }, 
                {
                  selectionType: "field",
                  name: "cursor",
                  type: { name: "String", definedType: "Scalar" },
                  typeCondition: { name: "ProductEdge", definedType: "Object" },
                }, 
                {
                  selectionType: "field",
                  name: "node",
                  type: { name: "Product", definedType: "Object" },
                  typeCondition: { name: "ProductEdge", definedType: "Object" },
                  selections: ([
                    {
                      selectionType: "field",
                      name: "__typename",
                      type: { name: "String", definedType: "Scalar" },
                      typeCondition: { name: "Product", definedType: "Object" },
                    }, 
                    {
                      selectionType: "field",
                      name: "title",
                      type: { name: "String", definedType: "Scalar" },
                      typeCondition: { name: "Product", definedType: "Object" },
                    }
                  ] as GraphSelection[])
                }
              ] as GraphSelection[])
            }
          ] as GraphSelection[])
        }
      ] as GraphSelection[])
    }
  ] as GraphSelection[])
}
export default document
