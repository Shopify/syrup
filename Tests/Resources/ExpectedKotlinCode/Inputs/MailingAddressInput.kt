
package com.shopify.syrup.inputs

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class MailingAddressInput(var address1: InputWrapper<String?> = InputWrapper(), var address2: InputWrapper<String?> = InputWrapper(), var city: InputWrapper<String?> = InputWrapper(), var company: InputWrapper<String?> = InputWrapper(), var country: InputWrapper<String?> = InputWrapper(), var countryCode: InputWrapper<CountryCode?> = InputWrapper(), var firstName: InputWrapper<String?> = InputWrapper(), var id: InputWrapper<ID?> = InputWrapper(), var lastName: InputWrapper<String?> = InputWrapper(), var phone: InputWrapper<String?> = InputWrapper(), var province: InputWrapper<String?> = InputWrapper(), var provinceCode: InputWrapper<String?> = InputWrapper(), var zip: InputWrapper<String?> = InputWrapper()) {

      fun setAddress1(value: String?) {
        this.address1.defineValue(value)
      }

      fun setAddress2(value: String?) {
        this.address2.defineValue(value)
      }

      fun setCity(value: String?) {
        this.city.defineValue(value)
      }

      fun setCompany(value: String?) {
        this.company.defineValue(value)
      }

      fun setCountry(value: String?) {
        this.country.defineValue(value)
      }

      fun setCountrycode(value: CountryCode?) {
        this.countryCode.defineValue(value)
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

      fun setPhone(value: String?) {
        this.phone.defineValue(value)
      }

      fun setProvince(value: String?) {
        this.province.defineValue(value)
      }

      fun setProvincecode(value: String?) {
        this.provinceCode.defineValue(value)
      }

      fun setZip(value: String?) {
        this.zip.defineValue(value)
      }

}
