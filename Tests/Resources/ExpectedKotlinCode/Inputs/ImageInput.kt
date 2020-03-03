
package com.shopify.syrup.inputs

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class ImageInput(var id: InputWrapper<ID?> = InputWrapper(), var altText: InputWrapper<String?> = InputWrapper(), var src: InputWrapper<String?> = InputWrapper()) {

      fun setId(value: ID?) {
        this.id.defineValue(value)
      }

      fun setAlttext(value: String?) {
        this.altText.defineValue(value)
      }

      fun setSrc(value: String?) {
        this.src.defineValue(value)
      }

}
