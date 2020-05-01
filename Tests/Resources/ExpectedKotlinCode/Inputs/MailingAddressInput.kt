
package com.shopify.syrup.inputs

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class MailingAddressInput(var address1: InputWrapper<String?> = InputWrapper(), var address2: InputWrapper<String?> = InputWrapper(), var city: InputWrapper<String?> = InputWrapper(), var company: InputWrapper<String?> = InputWrapper(), var country: InputWrapper<String?> = InputWrapper(), var countryCode: InputWrapper<CountryCode?> = InputWrapper(), var firstName: InputWrapper<String?> = InputWrapper(), var id: InputWrapper<ID?> = InputWrapper(), var lastName: InputWrapper<String?> = InputWrapper(), var phone: InputWrapper<String?> = InputWrapper(), var province: InputWrapper<String?> = InputWrapper(), var provinceCode: InputWrapper<String?> = InputWrapper(), var zip: InputWrapper<String?> = InputWrapper())
