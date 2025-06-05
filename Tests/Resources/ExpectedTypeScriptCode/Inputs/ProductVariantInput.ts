// Syrup auto-generated file

import { ID } from "../GraphApi"
import {
  ProductVariantInventoryManagement,
  ProductVariantInventoryPolicy,
  WeightUnit,
} from "../Enums"
import { InventoryLevelInput } from "./InventoryLevelInput"
import { InventoryItemInput } from "./InventoryItemInput"
import { MetafieldInput } from "./MetafieldInput"
import { PrivateMetafieldInput } from "./PrivateMetafieldInput"

export interface ProductVariantInput {
  barcode?: string | null;
  compareAtPrice?: number | null;
  fulfillmentServiceId?: ID | null;
  harmonizedSystemCode?: string | null;
  id?: ID | null;
  imageId?: ID | null;
  imageSrc?: string | null;
  inventoryManagement?: ProductVariantInventoryManagement | null;
  inventoryPolicy?: ProductVariantInventoryPolicy | null;
  inventoryQuantities?: InventoryLevelInput[];
  inventoryItem?: InventoryItemInput | null;
  metafields?: MetafieldInput[];
  privateMetafields?: PrivateMetafieldInput[];
  options?: string[];
  position?: number | null;
  price?: number | null;
  productId?: ID | null;
  requiresShipping?: boolean | null;
  sku?: string | null;
  taxable?: boolean | null;
  title?: string | null;
  taxCode?: string | null;
  weight?: number | null;
  weightUnit?: WeightUnit | null;
  parent?: ProductVariantInput | null;
}
