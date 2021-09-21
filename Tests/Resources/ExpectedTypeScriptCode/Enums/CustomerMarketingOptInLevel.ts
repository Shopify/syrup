// Syrup auto-generated file

export enum CustomerMarketingOptInLevel {

  /**
   * The customer started receiving marketing email(s) after providing their email address, without any
   * intermediate steps.
   */
  SingleOptIn = "SINGLE_OPT_IN",

  /**
   * After providing their email address, the customer received a confirmation email which required them to
   * perform a prescribed action before receiving marketing emails.
   */
  ConfirmedOptIn = "CONFIRMED_OPT_IN",

  /**
   * The customer receives marketing emails, but the original opt-in process is unknown.
   */
  Unknown = "UNKNOWN",

  /**
   * Unknown Syrup enum.
   */
  UnknownSyrupEnum = "UNKNOWN_SYRUP_ENUM"
}
