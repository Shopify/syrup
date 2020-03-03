
package com.shopify.syrup.inputs

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class PrivateMetafieldValueInput(var value: InputWrapper<String>, var valueType: InputWrapper<PrivateMetafieldValueType>) {

      fun setValue(value: String) {
        this.value.defineValue(value)
      }

      fun setValuetype(value: PrivateMetafieldValueType) {
        this.valueType.defineValue(value)
      }

}
