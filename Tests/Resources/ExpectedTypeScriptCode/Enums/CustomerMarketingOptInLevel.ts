export enum CustomerMarketingOptInLevel {

  /**
   * The customer started receiving marketing email(s) after providing their email address, without any
   * intermediate steps.
   */
  SINGLE_OPT_IN = "SINGLE_OPT_IN",

  /**
   * After providing their email address, the customer received a confirmation email which required them to
   * perform a prescribed action before receiving marketing emails.
   */
  CONFIRMED_OPT_IN = "CONFIRMED_OPT_IN",

  /**
   * The customer receives marketing emails, but the original opt-in process is unknown.
   */
  UNKNOWN = "UNKNOWN",

  /**
   * Unknown Syrup enum.
   */
  UNKNOWN_SYRUP_ENUM = "UNKNOWN_SYRUP_ENUM"
}
