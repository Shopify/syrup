
package com.shopify.syrup.inputs

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class CollectionInput(var descriptionHtml: InputWrapper<String?> = InputWrapper(), var handle: InputWrapper<String?> = InputWrapper(), var id: InputWrapper<ID?> = InputWrapper(), var image: InputWrapper<ImageInput?> = InputWrapper(), var products: InputWrapper<List<ID>?> = InputWrapper(), var publications: InputWrapper<List<CollectionPublicationInput>?> = InputWrapper(), var privateMetafields: InputWrapper<List<PrivateMetafieldInput>?> = InputWrapper(), var ruleSet: InputWrapper<CollectionRuleSetInput?> = InputWrapper(), var templateSuffix: InputWrapper<String?> = InputWrapper(), var sortOrder: InputWrapper<CollectionSortOrder?> = InputWrapper(), var title: InputWrapper<String?> = InputWrapper(), var metafields: InputWrapper<List<MetafieldInput>?> = InputWrapper(), var seo: InputWrapper<SEOInput?> = InputWrapper(), var redirectNewHandle: InputWrapper<Boolean?> = InputWrapper()) {

      fun setDescriptionhtml(value: String?) {
        this.descriptionHtml.defineValue(value)
      }

      fun setHandle(value: String?) {
        this.handle.defineValue(value)
      }

      fun setId(value: ID?) {
        this.id.defineValue(value)
      }

      fun setImage(value: ImageInput?) {
        this.image.defineValue(value)
      }

      fun setProducts(value: List<ID>?) {
        this.products.defineValue(value)
      }

      fun setPublications(value: List<CollectionPublicationInput>?) {
        this.publications.defineValue(value)
      }

      fun setPrivatemetafields(value: List<PrivateMetafieldInput>?) {
        this.privateMetafields.defineValue(value)
      }

      fun setRuleset(value: CollectionRuleSetInput?) {
        this.ruleSet.defineValue(value)
      }

      fun setTemplatesuffix(value: String?) {
        this.templateSuffix.defineValue(value)
      }

      fun setSortorder(value: CollectionSortOrder?) {
        this.sortOrder.defineValue(value)
      }

      fun setTitle(value: String?) {
        this.title.defineValue(value)
      }

      fun setMetafields(value: List<MetafieldInput>?) {
        this.metafields.defineValue(value)
      }

      fun setSeo(value: SEOInput?) {
        this.seo.defineValue(value)
      }

      fun setRedirectnewhandle(value: Boolean?) {
        this.redirectNewHandle.defineValue(value)
      }

}
