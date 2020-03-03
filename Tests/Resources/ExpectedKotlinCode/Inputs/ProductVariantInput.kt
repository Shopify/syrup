
package com.shopify.syrup.inputs

import com.shopify.foundation.syrupsupport.*
import com.shopify.syrup.enums.*
import java.math.BigDecimal
import org.joda.time.DateTime;
import javax.annotation.Generated

@Generated("com.shopify.syrup")
data class ProductVariantInput(var barcode: InputWrapper<String?> = InputWrapper(), var compareAtPrice: InputWrapper<BigDecimal?> = InputWrapper(), var fulfillmentServiceId: InputWrapper<ID?> = InputWrapper(), var harmonizedSystemCode: InputWrapper<String?> = InputWrapper(), var id: InputWrapper<ID?> = InputWrapper(), var imageId: InputWrapper<ID?> = InputWrapper(), var imageSrc: InputWrapper<String?> = InputWrapper(), var inventoryManagement: InputWrapper<ProductVariantInventoryManagement?> = InputWrapper(), var inventoryPolicy: InputWrapper<ProductVariantInventoryPolicy?> = InputWrapper(), var inventoryQuantities: InputWrapper<List<InventoryLevelInput>?> = InputWrapper(), var inventoryItem: InputWrapper<InventoryItemInput?> = InputWrapper(), var metafields: InputWrapper<List<MetafieldInput>?> = InputWrapper(), var privateMetafields: InputWrapper<List<PrivateMetafieldInput>?> = InputWrapper(), var options: InputWrapper<List<String>?> = InputWrapper(), var position: InputWrapper<Int?> = InputWrapper(), var price: InputWrapper<BigDecimal?> = InputWrapper(), var productId: InputWrapper<ID?> = InputWrapper(), var requiresShipping: InputWrapper<Boolean?> = InputWrapper(), var sku: InputWrapper<String?> = InputWrapper(), var taxable: InputWrapper<Boolean?> = InputWrapper(), var title: InputWrapper<String?> = InputWrapper(), var taxCode: InputWrapper<String?> = InputWrapper(), var weight: InputWrapper<Double?> = InputWrapper(), var weightUnit: InputWrapper<WeightUnit?> = InputWrapper()) {

      fun setBarcode(value: String?) {
        this.barcode.defineValue(value)
      }

      fun setCompareatprice(value: BigDecimal?) {
        this.compareAtPrice.defineValue(value)
      }

      fun setFulfillmentserviceid(value: ID?) {
        this.fulfillmentServiceId.defineValue(value)
      }

      fun setHarmonizedsystemcode(value: String?) {
        this.harmonizedSystemCode.defineValue(value)
      }

      fun setId(value: ID?) {
        this.id.defineValue(value)
      }

      fun setImageid(value: ID?) {
        this.imageId.defineValue(value)
      }

      fun setImagesrc(value: String?) {
        this.imageSrc.defineValue(value)
      }

      fun setInventorymanagement(value: ProductVariantInventoryManagement?) {
        this.inventoryManagement.defineValue(value)
      }

      fun setInventorypolicy(value: ProductVariantInventoryPolicy?) {
        this.inventoryPolicy.defineValue(value)
      }

      fun setInventoryquantities(value: List<InventoryLevelInput>?) {
        this.inventoryQuantities.defineValue(value)
      }

      fun setInventoryitem(value: InventoryItemInput?) {
        this.inventoryItem.defineValue(value)
      }

      fun setMetafields(value: List<MetafieldInput>?) {
        this.metafields.defineValue(value)
      }

      fun setPrivatemetafields(value: List<PrivateMetafieldInput>?) {
        this.privateMetafields.defineValue(value)
      }

      fun setOptions(value: List<String>?) {
        this.options.defineValue(value)
      }

      fun setPosition(value: Int?) {
        this.position.defineValue(value)
      }

      fun setPrice(value: BigDecimal?) {
        this.price.defineValue(value)
      }

      fun setProductid(value: ID?) {
        this.productId.defineValue(value)
      }

      fun setRequiresshipping(value: Boolean?) {
        this.requiresShipping.defineValue(value)
      }

      fun setSku(value: String?) {
        this.sku.defineValue(value)
      }

      fun setTaxable(value: Boolean?) {
        this.taxable.defineValue(value)
      }

      fun setTitle(value: String?) {
        this.title.defineValue(value)
      }

      fun setTaxcode(value: String?) {
        this.taxCode.defineValue(value)
      }

      fun setWeight(value: Double?) {
        this.weight.defineValue(value)
      }

      fun setWeightunit(value: WeightUnit?) {
        this.weightUnit.defineValue(value)
      }

}
