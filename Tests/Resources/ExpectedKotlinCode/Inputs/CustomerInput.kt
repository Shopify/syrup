
package com.shopify.syrup.inputs

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class CustomerInput(var acceptsMarketing: InputWrapper<Boolean?> = InputWrapper(), var acceptsMarketingUpdatedAt: InputWrapper<DateTime?> = InputWrapper(), var addresses: InputWrapper<List<MailingAddressInput>?> = InputWrapper(), var email: InputWrapper<String?> = InputWrapper(), var firstName: InputWrapper<String?> = InputWrapper(), var id: InputWrapper<ID?> = InputWrapper(), var lastName: InputWrapper<String?> = InputWrapper(), var locale: InputWrapper<String?> = InputWrapper(), var marketingOptInLevel: InputWrapper<CustomerMarketingOptInLevel?> = InputWrapper(), var metafields: InputWrapper<List<MetafieldInput>?> = InputWrapper(), var note: InputWrapper<String?> = InputWrapper(), var phone: InputWrapper<String?> = InputWrapper(), var privateMetafields: InputWrapper<List<PrivateMetafieldInput>?> = InputWrapper(), var tags: InputWrapper<List<String>?> = InputWrapper(), var taxExempt: InputWrapper<Boolean?> = InputWrapper(), var taxExemptions: InputWrapper<List<TaxExemption>?> = InputWrapper()) {

      fun setAcceptsmarketing(value: Boolean?) {
        this.acceptsMarketing.defineValue(value)
      }

      fun setAcceptsmarketingupdatedat(value: DateTime?) {
        this.acceptsMarketingUpdatedAt.defineValue(value)
      }

      fun setAddresses(value: List<MailingAddressInput>?) {
        this.addresses.defineValue(value)
      }

      fun setEmail(value: String?) {
        this.email.defineValue(value)
      }

      fun setFirstname(value: String?) {
        this.firstName.defineValue(value)
      }

      fun setId(value: ID?) {
        this.id.defineValue(value)
      }

      fun setLastname(value: String?) {
        this.lastName.defineValue(value)
      }

      fun setLocale(value: String?) {
        this.locale.defineValue(value)
      }

      fun setMarketingoptinlevel(value: CustomerMarketingOptInLevel?) {
        this.marketingOptInLevel.defineValue(value)
      }

      fun setMetafields(value: List<MetafieldInput>?) {
        this.metafields.defineValue(value)
      }

      fun setNote(value: String?) {
        this.note.defineValue(value)
      }

      fun setPhone(value: String?) {
        this.phone.defineValue(value)
      }

      fun setPrivatemetafields(value: List<PrivateMetafieldInput>?) {
        this.privateMetafields.defineValue(value)
      }

      fun setTags(value: List<String>?) {
        this.tags.defineValue(value)
      }

      fun setTaxexempt(value: Boolean?) {
        this.taxExempt.defineValue(value)
      }

      fun setTaxexemptions(value: List<TaxExemption>?) {
        this.taxExemptions.defineValue(value)
      }

}
