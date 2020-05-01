
package com.shopify.syrup.inputs

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class PrivateMetafieldInput(var owner: InputWrapper<ID?> = InputWrapper(), var namespace: InputWrapper<String>, var key: InputWrapper<String>, var valueInput: InputWrapper<PrivateMetafieldValueInput>)
