import { ID } from "../GraphApi"

export interface CollectionPublicationInput {
  publicationId?: ID | null;
  channelId?: ID | null;
  channelHandle?: string | null;
}
