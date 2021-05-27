export enum ProductVariantInventoryManagement {

  /**
   * Shopify tracks this product variant's inventory.
   */
  SHOPIFY = "SHOPIFY",

  /**
   * This product variant's inventory is not tracked.
   */
  NOT_MANAGED = "NOT_MANAGED",

  /**
   * A third-party fulfillment service tracks this product variant's inventory.
   */
  FULFILLMENT_SERVICE = "FULFILLMENT_SERVICE",

  /**
   * Unknown Syrup enum.
   */
  UNKNOWN_SYRUP_ENUM = "UNKNOWN_SYRUP_ENUM"
}
