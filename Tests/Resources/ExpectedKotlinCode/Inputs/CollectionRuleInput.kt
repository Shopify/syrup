
package com.shopify.syrup.inputs

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class CollectionRuleInput(var column: InputWrapper<CollectionRuleColumn>, var relation: InputWrapper<CollectionRuleRelation>, var condition: InputWrapper<String>) {

      fun setColumn(value: CollectionRuleColumn) {
        this.column.defineValue(value)
      }

      fun setRelation(value: CollectionRuleRelation) {
        this.relation.defineValue(value)
      }

      fun setCondition(value: String) {
        this.condition.defineValue(value)
      }

}
