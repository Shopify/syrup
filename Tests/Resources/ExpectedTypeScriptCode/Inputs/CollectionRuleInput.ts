import { ID } from "../GraphApi"
import {
  CollectionRuleColumn,
  CollectionRuleRelation,
} from "../Enums"

export interface CollectionRuleInput {
  column?: CollectionRuleColumn;
  relation?: CollectionRuleRelation;
  condition?: string;
}
