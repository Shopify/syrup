
package com.shopify.syrup.inputs

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class CollectionRuleSetInput(var appliedDisjunctively: InputWrapper<Boolean>, var rules: InputWrapper<List<CollectionRuleInput>?> = InputWrapper()) {

      fun setApplieddisjunctively(value: Boolean) {
        this.appliedDisjunctively.defineValue(value)
      }

      fun setRules(value: List<CollectionRuleInput>?) {
        this.rules.defineValue(value)
      }

}
