// Syrup auto-generated file

import { ID } from "../GraphApi"
import { SEOInput } from "./SEOInput"
import { ImageInput } from "./ImageInput"
import { MetafieldInput } from "./MetafieldInput"
import { PrivateMetafieldInput } from "./PrivateMetafieldInput"
import { ProductPublicationInput } from "./ProductPublicationInput"
import { ProductVariantInput } from "./ProductVariantInput"

export interface ProductInput {
  descriptionHtml?: string | null;
  handle?: string | null;
  redirectNewHandle?: boolean | null;
  seo?: SEOInput | null;
  productType?: string | null;
  tags?: string[];
  templateSuffix?: string | null;
  giftCard?: boolean | null;
  giftCardTemplateSuffix?: string | null;
  title?: string | null;
  vendor?: string | null;
  bodyHtml?: string | null;
  collectionsToJoin?: ID[];
  collectionsToLeave?: ID[];
  id?: ID | null;
  images?: ImageInput[];
  metafields?: MetafieldInput[];
  privateMetafields?: PrivateMetafieldInput[];
  options?: string[];
  productPublications?: ProductPublicationInput[];
  publications?: ProductPublicationInput[];
  publishDate?: string | null;
  publishOn?: string | null;
  published?: boolean | null;
  publishedAt?: string | null;
  variants?: ProductVariantInput[];
}
