
package com.shopify.syrup.inputs

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class PrivateMetafieldInput(var owner: InputWrapper<ID?> = InputWrapper(), var namespace: InputWrapper<String>, var key: InputWrapper<String>, var valueInput: InputWrapper<PrivateMetafieldValueInput>) {

      fun setOwner(value: ID?) {
        this.owner.defineValue(value)
      }

      fun setNamespace(value: String) {
        this.namespace.defineValue(value)
      }

      fun setKey(value: String) {
        this.key.defineValue(value)
      }

      fun setValueinput(value: PrivateMetafieldValueInput) {
        this.valueInput.defineValue(value)
      }

}
