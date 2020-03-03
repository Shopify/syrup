
package com.shopify.syrup.inputs

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class MetafieldInput(var description: InputWrapper<String?> = InputWrapper(), var id: InputWrapper<ID?> = InputWrapper(), var key: InputWrapper<String?> = InputWrapper(), var namespace: InputWrapper<String?> = InputWrapper(), var value: InputWrapper<String?> = InputWrapper(), var valueType: InputWrapper<MetafieldValueType?> = InputWrapper()) {

      fun setDescription(value: String?) {
        this.description.defineValue(value)
      }

      fun setId(value: ID?) {
        this.id.defineValue(value)
      }

      fun setKey(value: String?) {
        this.key.defineValue(value)
      }

      fun setNamespace(value: String?) {
        this.namespace.defineValue(value)
      }

      fun setValue(value: String?) {
        this.value.defineValue(value)
      }

      fun setValuetype(value: MetafieldValueType?) {
        this.valueType.defineValue(value)
      }

}
