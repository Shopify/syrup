
package com.shopify.syrup.inputs

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class CollectionInput(var descriptionHtml: InputWrapper<String?> = InputWrapper(), var handle: InputWrapper<String?> = InputWrapper(), var id: InputWrapper<ID?> = InputWrapper(), var image: InputWrapper<ImageInput?> = InputWrapper(), var products: InputWrapper<List<ID>?> = InputWrapper(), var publications: InputWrapper<List<CollectionPublicationInput>?> = InputWrapper(), var privateMetafields: InputWrapper<List<PrivateMetafieldInput>?> = InputWrapper(), var ruleSet: InputWrapper<CollectionRuleSetInput?> = InputWrapper(), var templateSuffix: InputWrapper<String?> = InputWrapper(), var sortOrder: InputWrapper<CollectionSortOrder?> = InputWrapper(), var title: InputWrapper<String?> = InputWrapper(), var metafields: InputWrapper<List<MetafieldInput>?> = InputWrapper(), var seo: InputWrapper<SEOInput?> = InputWrapper(), var redirectNewHandle: InputWrapper<Boolean?> = InputWrapper())
