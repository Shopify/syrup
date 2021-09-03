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
      alias: null,
      type: { name: "String", definedType: "Scalar" },
      arguments: {},
      passedGID: null,
      typeCondition: { name: "Mutation", definedType: "Object" },
      directive: null,
      selections: ([] as GraphSelection[])
    }, 
    {
      name: "customerUpdate",
      alias: null,
      type: { name: "CustomerUpdatePayload", definedType: "Object" },
      arguments: { input: { type: "OperationVariableKey", value: "input" } },
      passedGID: null,
      typeCondition: { name: "Mutation", definedType: "Object" },
      directive: null,
      selections: ([
        {
          name: "__typename",
          alias: null,
          type: { name: "String", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "CustomerUpdatePayload", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "customer",
          alias: null,
          type: { name: "Customer", definedType: "Object" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "CustomerUpdatePayload", definedType: "Object" },
          directive: null,
          selections: ([
            {
              name: "__typename",
              alias: null,
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "Customer", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "id",
              alias: null,
              type: { name: "ID", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "Customer", definedType: "Object" },
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
