
package com.shopify.syrup.inputs

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class ProductVariantInput(var barcode: InputWrapper<String?> = InputWrapper(), var compareAtPrice: InputWrapper<BigDecimal?> = InputWrapper(), var fulfillmentServiceId: InputWrapper<ID?> = InputWrapper(), var harmonizedSystemCode: InputWrapper<String?> = InputWrapper(), var id: InputWrapper<ID?> = InputWrapper(), var imageId: InputWrapper<ID?> = InputWrapper(), var imageSrc: InputWrapper<String?> = InputWrapper(), var inventoryManagement: InputWrapper<ProductVariantInventoryManagement?> = InputWrapper(), var inventoryPolicy: InputWrapper<ProductVariantInventoryPolicy?> = InputWrapper(), var inventoryQuantities: InputWrapper<List<InventoryLevelInput>?> = InputWrapper(), var inventoryItem: InputWrapper<InventoryItemInput?> = InputWrapper(), var metafields: InputWrapper<List<MetafieldInput>?> = InputWrapper(), var privateMetafields: InputWrapper<List<PrivateMetafieldInput>?> = InputWrapper(), var options: InputWrapper<List<String>?> = InputWrapper(), var position: InputWrapper<Int?> = InputWrapper(), var price: InputWrapper<BigDecimal?> = InputWrapper(), var productId: InputWrapper<ID?> = InputWrapper(), var requiresShipping: InputWrapper<Boolean?> = InputWrapper(), var sku: InputWrapper<String?> = InputWrapper(), var taxable: InputWrapper<Boolean?> = InputWrapper(), var title: InputWrapper<String?> = InputWrapper(), var taxCode: InputWrapper<String?> = InputWrapper(), var weight: InputWrapper<Double?> = InputWrapper(), var weightUnit: InputWrapper<WeightUnit?> = InputWrapper(), var parent: InputWrapper<ProductVariantInput?> = InputWrapper())
