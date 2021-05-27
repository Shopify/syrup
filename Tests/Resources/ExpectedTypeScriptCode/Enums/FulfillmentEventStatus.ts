export enum FulfillmentEventStatus {

  /**
   * A shipping label has been purchased.
   */
  LABEL_PURCHASED = "LABEL_PURCHASED",

  /**
   * A purchased shipping label has been printed.
   */
  LABEL_PRINTED = "LABEL_PRINTED",

  /**
   * The fulfillment is ready to be picked up.
   */
  READY_FOR_PICKUP = "READY_FOR_PICKUP",

  /**
   * The fulfillment is confirmed.
   */
  CONFIRMED = "CONFIRMED",

  /**
   * The fulfillment is in transit.
   */
  IN_TRANSIT = "IN_TRANSIT",

  /**
   * The fulfillment is out for delivery.
   */
  OUT_FOR_DELIVERY = "OUT_FOR_DELIVERY",

  /**
   * A delivery was attempted.
   */
  ATTEMPTED_DELIVERY = "ATTEMPTED_DELIVERY",

  /**
   * The fulfillment was successfully delivered.
   */
  DELIVERED = "DELIVERED",

  /**
   * The fulfillment request failed.
   */
  FAILURE = "FAILURE",

  /**
   * Unknown Syrup enum.
   */
  UNKNOWN_SYRUP_ENUM = "UNKNOWN_SYRUP_ENUM"
}
