// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"
import {
  ProductInput,
} from "../Inputs"

export namespace TestMutation1MutationData {
  export interface Variables {
    input: ProductInput;
  }
  export interface ProductUpdateProduct {
    __typename: 'Product';
    /**
     * Globally unique identifier.
     */
    id: ID;
  }
  export interface ProductUpdate {
    __typename: 'ProductUpdatePayload';
    /**
     * The updated product.
     */
    product?: ProductUpdateProduct | null;
  }
}

export interface TestMutation1MutationData {

  /**
   * Updates a product.
   */
  productUpdate?: TestMutation1MutationData.ProductUpdate | null;
}

const document: SyrupOperation<TestMutation1MutationData, TestMutation1MutationData.Variables> = {
  id: "d646fa317ebf1d1595dd79ba8b9e1bea9aefd5ef9ec08aff8adad36ff7a22a5b",
  name: "TestMutation1",
  source: "mutation TestMutation1(\$input: ProductInput!) { __typename productUpdate(input: \$input) { __typename product { __typename id } } }",
  operationType: 'mutation',
  selections: ([
    {
      selectionType: "field",
      name: "__typename",
      type: { name: "String", definedType: "Scalar" },
      typeCondition: { name: "Mutation", definedType: "Object" },
    }, 
    {
      selectionType: "field",
      name: "productUpdate",
      type: { name: "ProductUpdatePayload", definedType: "Object" },
      typeCondition: { name: "Mutation", definedType: "Object" },
      arguments: { input: { type: "OperationVariableKey", value: "input" } },
      selections: ([
        {
          selectionType: "field",
          name: "__typename",
          type: { name: "String", definedType: "Scalar" },
          typeCondition: { name: "ProductUpdatePayload", definedType: "Object" },
        }, 
        {
          selectionType: "field",
          name: "product",
          type: { name: "Product", definedType: "Object" },
          typeCondition: { name: "ProductUpdatePayload", definedType: "Object" },
          selections: ([
            {
              selectionType: "field",
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "Product", definedType: "Object" },
            }, 
            {
              selectionType: "field",
              name: "id",
              type: { name: "ID", definedType: "Scalar" },
              typeCondition: { name: "Product", definedType: "Object" },
            }
          ] as GraphSelection[])
        }
      ] as GraphSelection[])
    }
  ] as GraphSelection[])
}
export default document
