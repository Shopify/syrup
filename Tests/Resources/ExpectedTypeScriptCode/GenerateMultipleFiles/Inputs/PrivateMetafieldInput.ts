// Syrup auto-generated file

import { ID } from "../GraphApi"
import { PrivateMetafieldValueInput } from "./PrivateMetafieldValueInput"

export interface PrivateMetafieldInput {
  owner?: ID | null;
  'namespace'?: string;
  key?: string;
  valueInput?: PrivateMetafieldValueInput;
}
