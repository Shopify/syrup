import { ID } from "../GraphApi"
import {
  CountryCode,
} from "../Enums"

export interface MailingAddressInput {
  address1?: string | null;
  address2?: string | null;
  city?: string | null;
  company?: string | null;
  country?: string | null;
  countryCode?: CountryCode | null;
  firstName?: string | null;
  id?: ID | null;
  lastName?: string | null;
  phone?: string | null;
  province?: string | null;
  provinceCode?: string | null;
  zip?: string | null;
}
