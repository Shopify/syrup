export enum CollectionRuleRelation {

  /**
   * The attribute contains the condition.
   */
  CONTAINS = "CONTAINS",

  /**
   * The attribute ends with the condition.
   */
  ENDS_WITH = "ENDS_WITH",

  /**
   * The attribute is equal to the condition.
   */
  EQUALS = "EQUALS",

  /**
   * The attribute is greater than the condition.
   */
  GREATER_THAN = "GREATER_THAN",

  /**
   * The attribute is not set.
   */
  IS_NOT_SET = "IS_NOT_SET",

  /**
   * The attribute is set.
   */
  IS_SET = "IS_SET",

  /**
   * The attribute is less than the condition.
   */
  LESS_THAN = "LESS_THAN",

  /**
   * The attribute does not contain the condition.
   */
  NOT_CONTAINS = "NOT_CONTAINS",

  /**
   * The attribute does not equal the condition.
   */
  NOT_EQUALS = "NOT_EQUALS",

  /**
   * The attribute starts with the condition.
   */
  STARTS_WITH = "STARTS_WITH",

  /**
   * Unknown Syrup enum.
   */
  UNKNOWN_SYRUP_ENUM = "UNKNOWN_SYRUP_ENUM"
}
