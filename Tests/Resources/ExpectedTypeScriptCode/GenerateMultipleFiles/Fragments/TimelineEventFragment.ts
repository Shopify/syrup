// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace TimelineEventFragmentFragmentData {
  export interface Other {
    __typename: '';
  }

  export interface CommentEventAttachmentsImage {
    __typename: 'Image';
    /**
     * The location of the transformed image as a URL.
     * All transformation arguments are considered "best-effort". If they can be applied to an image, they will be.
     * Otherwise any transformations which an image type does not support will be ignored.
     */
    transformedSrc: string;
  }
  export interface CommentEventAttachments {
    __typename: 'CommentEventAttachment';
    /**
     * Globally unique identifier.
     */
    id: ID;
    /**
     * The filename of the comment event attachment.
     */
    name: string;
    /**
     * The size of the attachment.
     */
    size: number;
    /**
     * The file extension of the comment event attachment, indicating the file format.
     */
    fileExtension?: string | null;
    /**
     * The URL of the attachment.
     */
    url: string;
    /**
     * The image attached to the comment event.
     */
    image?: CommentEventAttachmentsImage | null;
  }
  export interface CommentEvent {
    __typename: 'CommentEvent';
    /**
     * Whether the comment event has been edited. If true, then the comment event has been edited.
     */
    edited: boolean;
    /**
     * Whether the comment event can be edited. If true, then the comment event can be edited.
     */
    canEdit: boolean;
    /**
     * Whether the comment event can be deleted. If true, then the comment event can be deleted.
     */
    canDelete: boolean;
    /**
     * The attachments associated with the comment event.
     */
    attachments: CommentEventAttachments[];
  }

  export interface _BaseFields_ {

    /**
     * Globally unique identifier.
     */
    id: ID;

    /**
     * The date and time when the event was created.
     */
    createdAt: string;

    /**
     * Human readable text that describes the event.
     */
    message: string;

    /**
     * Whether the event was created by an app.
     */
    attributeToApp: boolean;

    /**
     * Whether the event was caused by an admin user.
     */
    attributeToUser: boolean;

    /**
     * Whether the event is critical.
     */
    criticalAlert: boolean;
  }
}

export type TimelineEventFragmentFragmentData = TimelineEventFragmentFragmentData.CommentEvent | TimelineEventFragmentFragmentData.Other

export const timelineEventFragmentSelections: GraphSelection[] = ([
  {
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }, 
  {
    name: "id",
    type: { name: "ID", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }, 
  {
    name: "createdAt",
    type: { name: "DateTime", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }, 
  {
    name: "message",
    type: { name: "FormattedString", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }, 
  {
    name: "attributeToApp",
    type: { name: "Boolean", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }, 
  {
    name: "attributeToUser",
    type: { name: "Boolean", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }, 
  {
    name: "criticalAlert",
    type: { name: "Boolean", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
  }, 
  {
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "CommentEvent", definedType: "Object" },
  }, 
  {
    name: "edited",
    type: { name: "Boolean", definedType: "Scalar" },
    typeCondition: { name: "CommentEvent", definedType: "Object" },
  }, 
  {
    name: "canEdit",
    type: { name: "Boolean", definedType: "Scalar" },
    typeCondition: { name: "CommentEvent", definedType: "Object" },
  }, 
  {
    name: "canDelete",
    type: { name: "Boolean", definedType: "Scalar" },
    typeCondition: { name: "CommentEvent", definedType: "Object" },
  }, 
  {
    name: "attachments",
    type: { name: "CommentEventAttachment", definedType: "Object" },
    typeCondition: { name: "CommentEvent", definedType: "Object" },
    selections: ([
      {
        name: "__typename",
        type: { name: "String", definedType: "Scalar" },
        typeCondition: { name: "CommentEventAttachment", definedType: "Object" },
      }, 
      {
        name: "id",
        type: { name: "ID", definedType: "Scalar" },
        typeCondition: { name: "CommentEventAttachment", definedType: "Object" },
      }, 
      {
        name: "name",
        type: { name: "String", definedType: "Scalar" },
        typeCondition: { name: "CommentEventAttachment", definedType: "Object" },
      }, 
      {
        name: "size",
        type: { name: "Int", definedType: "Scalar" },
        typeCondition: { name: "CommentEventAttachment", definedType: "Object" },
      }, 
      {
        name: "fileExtension",
        type: { name: "String", definedType: "Scalar" },
        typeCondition: { name: "CommentEventAttachment", definedType: "Object" },
      }, 
      {
        name: "url",
        type: { name: "URL", definedType: "Scalar" },
        typeCondition: { name: "CommentEventAttachment", definedType: "Object" },
      }, 
      {
        name: "image",
        type: { name: "Image", definedType: "Object" },
        typeCondition: { name: "CommentEventAttachment", definedType: "Object" },
        selections: ([
          {
            name: "__typename",
            type: { name: "String", definedType: "Scalar" },
            typeCondition: { name: "Image", definedType: "Object" },
          }, 
          {
            name: "transformedSrc",
            type: { name: "URL", definedType: "Scalar" },
            typeCondition: { name: "Image", definedType: "Object" },
            arguments: { maxWidth: { type: "OperationVariableKey", value: "maxImageWidth" }, maxHeight: { type: "OperationVariableKey", value: "maxImageHeight" } },
          }
        ] as GraphSelection[])
      }
    ] as GraphSelection[])
  }
] as GraphSelection[])

