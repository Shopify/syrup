// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"
import {
  CustomerInput,
} from "../Inputs"

export namespace TestMutation0MutationData {
  export interface Variables {
    input: CustomerInput;
  }
  export interface CustomerUpdateCustomer {
    __typename: 'Customer';
    /**
     * Globally unique identifier.
     */
    id: ID;
  }
  export interface CustomerUpdate {
    __typename: 'CustomerUpdatePayload';
    /**
     * The updated customer.
     */
    customer?: CustomerUpdateCustomer | null;
  }
}

export interface TestMutation0MutationData {

  /**
   * Updates a customer's attributes.
   */
  customerUpdate?: TestMutation0MutationData.CustomerUpdate | null;
}

const document: SyrupOperation<TestMutation0MutationData, TestMutation0MutationData.Variables> = {
  id: "4889a09d381c0be1631a25b96073a5443a565ebd54297e0317f09fd6f0877ec9",
  name: "TestMutation0",
  source: "mutation TestMutation0(\$input: CustomerInput!) { __typename customerUpdate(input: \$input) { __typename customer { __typename id } } }",
  operationType: 'mutation',
  selections: ([
    {
      name: "__typename",
      type: { name: "String", definedType: "Scalar" },
      typeCondition: { name: "Mutation", definedType: "Object" },
    }, 
    {
      name: "customerUpdate",
      type: { name: "CustomerUpdatePayload", definedType: "Object" },
      typeCondition: { name: "Mutation", definedType: "Object" },
      arguments: { input: { type: "OperationVariableKey", value: "input" } },
      selections: ([
        {
          name: "__typename",
          type: { name: "String", definedType: "Scalar" },
          typeCondition: { name: "CustomerUpdatePayload", definedType: "Object" },
        }, 
        {
          name: "customer",
          type: { name: "Customer", definedType: "Object" },
          typeCondition: { name: "CustomerUpdatePayload", definedType: "Object" },
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "Customer", definedType: "Object" },
            }, 
            {
              name: "id",
              type: { name: "ID", definedType: "Scalar" },
              typeCondition: { name: "Customer", definedType: "Object" },
            }
          ] as GraphSelection[])
        }
      ] as GraphSelection[])
    }
  ] as GraphSelection[])
}
export default document
