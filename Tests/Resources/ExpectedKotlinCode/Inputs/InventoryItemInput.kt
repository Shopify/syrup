
package com.shopify.syrup.inputs

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class InventoryItemInput(var cost: InputWrapper<BigDecimal?> = InputWrapper(), var tracked: InputWrapper<Boolean?> = InputWrapper()) {

      fun setCost(value: BigDecimal?) {
        this.cost.defineValue(value)
      }

      fun setTracked(value: Boolean?) {
        this.tracked.defineValue(value)
      }

}
