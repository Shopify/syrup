
package com.shopify.syrup.inputs

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class CustomerInput(var acceptsMarketing: InputWrapper<Boolean?> = InputWrapper(), var acceptsMarketingUpdatedAt: InputWrapper<DateTime?> = InputWrapper(), var addresses: InputWrapper<List<MailingAddressInput>?> = InputWrapper(), var email: InputWrapper<String?> = InputWrapper(), var firstName: InputWrapper<String?> = InputWrapper(), var id: InputWrapper<ID?> = InputWrapper(), var lastName: InputWrapper<String?> = InputWrapper(), var locale: InputWrapper<String?> = InputWrapper(), var marketingOptInLevel: InputWrapper<CustomerMarketingOptInLevel?> = InputWrapper(), var metafields: InputWrapper<List<MetafieldInput>?> = InputWrapper(), var note: InputWrapper<String?> = InputWrapper(), var phone: InputWrapper<String?> = InputWrapper(), var privateMetafields: InputWrapper<List<PrivateMetafieldInput>?> = InputWrapper(), var tags: InputWrapper<List<String>?> = InputWrapper(), var taxExempt: InputWrapper<Boolean?> = InputWrapper(), var taxExemptions: InputWrapper<List<TaxExemption>?> = InputWrapper())
