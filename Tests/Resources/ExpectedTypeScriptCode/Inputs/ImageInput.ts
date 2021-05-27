import { ID } from "../GraphApi"

export interface ImageInput {
  id?: ID | null;
  altText?: string | null;
  src?: string | null;
}
