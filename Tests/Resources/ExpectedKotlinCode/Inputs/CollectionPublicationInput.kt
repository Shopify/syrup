
package com.shopify.syrup.inputs

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class CollectionPublicationInput(var publicationId: InputWrapper<ID?> = InputWrapper(), var channelId: InputWrapper<ID?> = InputWrapper(), var channelHandle: InputWrapper<String?> = InputWrapper()) {

      fun setPublicationid(value: ID?) {
        this.publicationId.defineValue(value)
      }

      fun setChannelid(value: ID?) {
        this.channelId.defineValue(value)
      }

      fun setChannelhandle(value: String?) {
        this.channelHandle.defineValue(value)
      }

}
