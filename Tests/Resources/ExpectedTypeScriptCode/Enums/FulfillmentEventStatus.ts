// Syrup auto-generated file

export enum FulfillmentEventStatus {

  /**
   * A shipping label has been purchased.
   */
  LabelPurchased = "LABEL_PURCHASED",

  /**
   * A purchased shipping label has been printed.
   */
  LabelPrinted = "LABEL_PRINTED",

  /**
   * The fulfillment is ready to be picked up.
   */
  ReadyForPickup = "READY_FOR_PICKUP",

  /**
   * The fulfillment is confirmed.
   */
  Confirmed = "CONFIRMED",

  /**
   * The fulfillment is in transit.
   */
  InTransit = "IN_TRANSIT",

  /**
   * The fulfillment is out for delivery.
   */
  OutForDelivery = "OUT_FOR_DELIVERY",

  /**
   * A delivery was attempted.
   */
  AttemptedDelivery = "ATTEMPTED_DELIVERY",

  /**
   * The fulfillment was successfully delivered.
   */
  Delivered = "DELIVERED",

  /**
   * The fulfillment request failed.
   */
  Failure = "FAILURE",

  /**
   * Unknown Syrup enum.
   */
  UnknownSyrupEnum = "UNKNOWN_SYRUP_ENUM"
}
