export enum CollectionSortOrder {

  /**
   * Alphabetically, in ascending order (A - Z).
   */
  ALPHA_ASC = "ALPHA_ASC",

  /**
   * Alphabetically, in descending order (Z - A).
   */
  ALPHA_DESC = "ALPHA_DESC",

  /**
   * By best-selling products.
   */
  BEST_SELLING = "BEST_SELLING",

  /**
   * By date created, in ascending order (oldest - newest).
   */
  CREATED = "CREATED",

  /**
   * By date created, in descending order (newest - oldest).
   */
  CREATED_DESC = "CREATED_DESC",

  /**
   * In the order set manually by the merchant.
   */
  MANUAL = "MANUAL",

  /**
   * By price, in ascending order (lowest - highest).
   */
  PRICE_ASC = "PRICE_ASC",

  /**
   * By price, in descending order (highest - lowest).
   */
  PRICE_DESC = "PRICE_DESC",

  /**
   * Unknown Syrup enum.
   */
  UNKNOWN_SYRUP_ENUM = "UNKNOWN_SYRUP_ENUM"
}
