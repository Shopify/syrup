import { ID } from "../GraphApi"
import {
  CustomerMarketingOptInLevel,
  TaxExemption,
} from "../Enums"
import { MailingAddressInput } from "./MailingAddressInput"
import { MetafieldInput } from "./MetafieldInput"
import { PrivateMetafieldInput } from "./PrivateMetafieldInput"

export interface CustomerInput {
  acceptsMarketing?: boolean | null;
  acceptsMarketingUpdatedAt?: string | null;
  addresses?: MailingAddressInput[];
  email?: string | null;
  firstName?: string | null;
  id?: ID | null;
  lastName?: string | null;
  locale?: string | null;
  marketingOptInLevel?: CustomerMarketingOptInLevel | null;
  metafields?: MetafieldInput[];
  note?: string | null;
  phone?: string | null;
  privateMetafields?: PrivateMetafieldInput[];
  tags?: string[];
  taxExempt?: boolean | null;
  taxExemptions?: TaxExemption[];
}
