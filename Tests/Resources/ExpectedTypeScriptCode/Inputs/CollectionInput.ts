import { ID } from "../GraphApi"
import {
  CollectionSortOrder,
} from "../Enums"
import { ImageInput } from "./ImageInput"
import { CollectionPublicationInput } from "./CollectionPublicationInput"
import { PrivateMetafieldInput } from "./PrivateMetafieldInput"
import { CollectionRuleSetInput } from "./CollectionRuleSetInput"
import { MetafieldInput } from "./MetafieldInput"
import { SEOInput } from "./SEOInput"

export interface CollectionInput {
  descriptionHtml?: string | null;
  handle?: string | null;
  id?: ID | null;
  image?: ImageInput | null;
  products?: ID[];
  publications?: CollectionPublicationInput[];
  privateMetafields?: PrivateMetafieldInput[];
  ruleSet?: CollectionRuleSetInput | null;
  templateSuffix?: string | null;
  sortOrder?: CollectionSortOrder | null;
  title?: string | null;
  metafields?: MetafieldInput[];
  seo?: SEOInput | null;
  redirectNewHandle?: boolean | null;
}
