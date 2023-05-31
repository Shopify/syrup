// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"
import {
  ProductVariantInput,
} from "../Inputs"
import {
  WeightUnit,
} from "../Enums"

export namespace ProductVariantShippingMutationData {
  export interface Variables {
    variantInput: ProductVariantInput;
  }
  export interface ProductVariantUpdateProductVariant {
    __typename: 'ProductVariant';
    /**
     * Globally unique identifier.
     */
    id: ID;
    /**
     * The weight of the product variant in the unit system specified with weight_unit.
     */
    weight?: number | null;
    /**
     * The unit of measurement that applies to the product variant's weight. If you don't specify a value for weight_unit, then the shop's default unit of measurement is applied. Valid values: `g`, `kg`, `oz`, `lb`.
     */
    weightUnit: WeightUnit;
    /**
     * Whether a customer needs to provide a shipping address when placing an order for the product variant.
     *
     * @deprecated Use `InventoryItem.requiresShipping` instead.
     */
    requiresShipping: boolean;
    /**
     * The Harmonized System Code (or HS Tariff Code) for the variant.
     *
     * @deprecated Use `InventoryItem.harmonizedSystemCode` instead.
     */
    harmonizedSystemCode?: string | null;
  }
  export interface ProductVariantUpdateUserErrors {
    __typename: 'UserError';
    /**
     * The error message.
     */
    message: string;
    /**
     * Path to the input field which caused the error.
     */
    field?: string[] | null;
  }
  export interface ProductVariantUpdate {
    __typename: 'ProductVariantUpdatePayload';
    /**
     * The updated variant.
     */
    productVariant?: ProductVariantUpdateProductVariant | null;
    /**
     * List of errors that occurred executing the mutation.
     */
    userErrors: ProductVariantUpdateUserErrors[];
  }
}

export interface ProductVariantShippingMutationData {

  /**
   * Updates a product variant.
   */
  productVariantUpdate?: ProductVariantShippingMutationData.ProductVariantUpdate | null;
}

const document: SyrupOperation<ProductVariantShippingMutationData, ProductVariantShippingMutationData.Variables> = {
  id: "1e26c400249b417e4cfb40f04434e3740842134ed8f50b183024638190e11386",
  name: "ProductVariantShipping",
  source: "mutation ProductVariantShipping(\$variantInput: ProductVariantInput!) { __typename productVariantUpdate(input: \$variantInput) { __typename productVariant { __typename id weight weightUnit requiresShipping harmonizedSystemCode } userErrors { __typename message field } } }",
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
      name: "productVariantUpdate",
      type: { name: "ProductVariantUpdatePayload", definedType: "Object" },
      typeCondition: { name: "Mutation", definedType: "Object" },
      arguments: { input: { type: "OperationVariableKey", value: "variantInput" } },
      selections: ([
        {
          selectionType: "field",
          name: "__typename",
          type: { name: "String", definedType: "Scalar" },
          typeCondition: { name: "ProductVariantUpdatePayload", definedType: "Object" },
        }, 
        {
          selectionType: "field",
          name: "productVariant",
          type: { name: "ProductVariant", definedType: "Object" },
          typeCondition: { name: "ProductVariantUpdatePayload", definedType: "Object" },
          selections: ([
            {
              selectionType: "field",
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "ProductVariant", definedType: "Object" },
            }, 
            {
              selectionType: "field",
              name: "id",
              type: { name: "ID", definedType: "Scalar" },
              typeCondition: { name: "ProductVariant", definedType: "Object" },
            }, 
            {
              selectionType: "field",
              name: "weight",
              type: { name: "Float", definedType: "Scalar" },
              typeCondition: { name: "ProductVariant", definedType: "Object" },
            }, 
            {
              selectionType: "field",
              name: "weightUnit",
              type: { name: "WeightUnit", definedType: "Scalar" },
              typeCondition: { name: "ProductVariant", definedType: "Object" },
            }, 
            {
              selectionType: "field",
              name: "requiresShipping",
              type: { name: "Boolean", definedType: "Scalar" },
              typeCondition: { name: "ProductVariant", definedType: "Object" },
            }, 
            {
              selectionType: "field",
              name: "harmonizedSystemCode",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "ProductVariant", definedType: "Object" },
            }
          ] as GraphSelection[])
        }, 
        {
          selectionType: "field",
          name: "userErrors",
          type: { name: "UserError", definedType: "Object" },
          typeCondition: { name: "ProductVariantUpdatePayload", definedType: "Object" },
          selections: ([
            {
              selectionType: "field",
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "UserError", definedType: "Object" },
            }, 
            {
              selectionType: "field",
              name: "message",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "UserError", definedType: "Object" },
            }, 
            {
              selectionType: "field",
              name: "field",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "UserError", definedType: "Object" },
            }
          ] as GraphSelection[])
        }
      ] as GraphSelection[])
    }
  ] as GraphSelection[])
}
export default document
