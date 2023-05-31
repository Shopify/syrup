// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace Subscription1SubscriptionData {
}

export interface Subscription1SubscriptionData {

  presenceChanged: boolean;
}

const document: SyrupOperation<Subscription1SubscriptionData, {}> = {
  id: "60ffe5fded111be9f9d2f92c0d4dc51bdd6395527a7b1855adebfa0f5aeff5c9",
  name: "Subscription1",
  source: "subscription Subscription1 { presenceChanged }",
  operationType: 'subscription',
  selections: ([
    {
      selectionType: "field",
      name: "presenceChanged",
      type: { name: "Boolean", definedType: "Scalar" },
      typeCondition: { name: "Subscription", definedType: "Object" },
    }
  ] as GraphSelection[])
}
export default document
