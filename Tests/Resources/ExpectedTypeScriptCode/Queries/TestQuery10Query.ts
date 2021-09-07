import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace TestQuery10QueryData {
  export interface Variables {
    priceRuleId: ID;
  }
  export interface PriceRuleValueOther {
    __typename: '';
  }
  export interface PriceRuleValuePriceRuleFixedAmountValue {
    __typename: 'PriceRuleFixedAmountValue';
    /**
     * The monetary value of the price rule.
     */
    amount: number;
  }
  export interface PriceRuleValuePriceRulePercentValue {
    __typename: 'PriceRulePercentValue';
    /**
     * The percent value of the price rule.
     */
    percentage: number;
  }
  export interface PriceRuleValue_BaseFields_ {
  }
  export type PriceRuleValue = PriceRuleValue_BaseFields_ & (PriceRuleValuePriceRuleFixedAmountValue | PriceRuleValuePriceRulePercentValue | PriceRuleValueOther)
  export interface PriceRuleValueV2Other {
    __typename: '';
  }
  export interface PriceRuleValueV2MoneyV2 {
    __typename: 'MoneyV2';
    /**
     * Decimal money amount.
     */
    amount: number;
  }
  export interface PriceRuleValueV2PricingPercentageValue {
    __typename: 'PricingPercentageValue';
    /**
     * The percentage value of the object.
     */
    percentage: number;
  }
  export interface PriceRuleValueV2_BaseFields_ {
  }
  export type PriceRuleValueV2 = PriceRuleValueV2_BaseFields_ & (PriceRuleValueV2MoneyV2 | PriceRuleValueV2PricingPercentageValue | PriceRuleValueV2Other)
  export interface PriceRule {
    __typename: 'PriceRule';
    /**
     * Globally unique identifier.
     */
    id: ID;
    /**
     * The value of the price rule.
     *
     * @deprecated Use `valueV2` instead
     */
    value: PriceRuleValue;
    /**
     * The value of the price rule.
     */
    valueV2: PriceRuleValueV2;
  }
}

export interface TestQuery10QueryData {

  /**
   * Lookup a price rule by ID.
   */
  priceRule?: TestQuery10QueryData.PriceRule | null;
}

const document: SyrupOperation<TestQuery10QueryData, TestQuery10QueryData.Variables> = {
  id: "75aaf8fd01cc132180a5a101c008714c115e4af92188976552b7c6b9cf688e73",
  name: "TestQuery10",
  source: "query TestQuery10(\$priceRuleId: ID!) { __typename priceRule(id: \$priceRuleId) { __typename id value { __typename ... on PriceRulePercentValue { __typename percentage }... on PriceRuleFixedAmountValue { __typename amount } } valueV2 { __typename ... on MoneyV2 { __typename amount }... on PricingPercentageValue { __typename percentage } } } }",
  operationType: 'query',
  selections: ([
    {
      name: "__typename",
      type: { name: "String", definedType: "Scalar" },
      typeCondition: { name: "QueryRoot", definedType: "Object" },
    }, 
    {
      name: "priceRule",
      type: { name: "PriceRule", definedType: "Object" },
      typeCondition: { name: "QueryRoot", definedType: "Object" },
      arguments: { id: { type: "OperationVariableKey", value: "priceRuleId" } },
      passedGID: "priceRuleId",
      selections: ([
        {
          name: "__typename",
          type: { name: "String", definedType: "Scalar" },
          typeCondition: { name: "PriceRule", definedType: "Object" },
        }, 
        {
          name: "id",
          type: { name: "ID", definedType: "Scalar" },
          typeCondition: { name: "PriceRule", definedType: "Object" },
        }, 
        {
          name: "value",
          type: { name: "PriceRuleValue", definedType: "Union" },
          typeCondition: { name: "PriceRule", definedType: "Object" },
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "PriceRuleValue", definedType: "Union" },
            }, 
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "PriceRulePercentValue", definedType: "Object" },
            }, 
            {
              name: "percentage",
              type: { name: "Float", definedType: "Scalar" },
              typeCondition: { name: "PriceRulePercentValue", definedType: "Object" },
            }, 
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "PriceRuleFixedAmountValue", definedType: "Object" },
            }, 
            {
              name: "amount",
              type: { name: "Money", definedType: "Scalar" },
              typeCondition: { name: "PriceRuleFixedAmountValue", definedType: "Object" },
            }
          ] as GraphSelection[])
        }, 
        {
          name: "valueV2",
          type: { name: "PricingValue", definedType: "Union" },
          typeCondition: { name: "PriceRule", definedType: "Object" },
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "PricingValue", definedType: "Union" },
            }, 
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "MoneyV2", definedType: "Object" },
            }, 
            {
              name: "amount",
              type: { name: "Decimal", definedType: "Scalar" },
              typeCondition: { name: "MoneyV2", definedType: "Object" },
            }, 
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "PricingPercentageValue", definedType: "Object" },
            }, 
            {
              name: "percentage",
              type: { name: "Float", definedType: "Scalar" },
              typeCondition: { name: "PricingPercentageValue", definedType: "Object" },
            }
          ] as GraphSelection[])
        }
      ] as GraphSelection[])
    }
  ] as GraphSelection[])
}
export default document
