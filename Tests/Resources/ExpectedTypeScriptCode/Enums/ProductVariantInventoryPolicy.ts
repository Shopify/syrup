export enum ProductVariantInventoryPolicy {

  /**
   * Stop selling a product variant when it is out of stock.
   */
  DENY = "DENY",

  /**
   * Continue selling a product variant when it is out of stock.
   */
  CONTINUE = "CONTINUE",

  /**
   * Unknown Syrup enum.
   */
  UNKNOWN_SYRUP_ENUM = "UNKNOWN_SYRUP_ENUM"
}
