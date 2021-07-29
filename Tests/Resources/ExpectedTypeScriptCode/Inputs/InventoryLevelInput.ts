import { ID } from "../GraphApi"

export interface InventoryLevelInput {
  availableQuantity?: number;
  locationId?: ID;
}
