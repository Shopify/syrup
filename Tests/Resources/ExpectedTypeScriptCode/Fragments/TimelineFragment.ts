// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace TimelineFragmentFragmentData {
  export interface PageInfo {
    __typename: 'PageInfo';
    /**
     * Indicates if there are more pages to fetch.
     */
    hasNextPage: boolean;
  }
  export interface EdgesNodeOther {
    __typename: '';
  }
  export interface EdgesNodeCommentEventAttachmentsImage {
    __typename: 'Image';
    /**
     * The location of the transformed image as a URL.
     * All transformation arguments are considered "best-effort". If they can be applied to an image, they will be.
     * Otherwise any transformations which an image type does not support will be ignored.
     */
    transformedSrc: string;
  }
  export interface EdgesNodeCommentEventAttachments {
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
    image?: EdgesNodeCommentEventAttachmentsImage | null;
  }
  export interface EdgesNodeCommentEvent {
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
    attachments: EdgesNodeCommentEventAttachments[];
  }
  export interface EdgesNode_BaseFields_ {
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
  export type EdgesNode = EdgesNode_BaseFields_ & (EdgesNodeCommentEvent | EdgesNodeOther)
  export interface Edges {
    __typename: 'EventEdge';
    /**
     * A cursor for use in pagination.
     */
    cursor: string;
    /**
     * The item at the end of EventEdge.
     */
    node: EdgesNode;
  }
}

export interface TimelineFragmentFragmentData {
  __typename: 'EventConnection';

  /**
   * Information to aid in pagination.
   */
  pageInfo: TimelineFragmentFragmentData.PageInfo;

  /**
   * A list of edges.
   */
  edges: TimelineFragmentFragmentData.Edges[];
}

export const timelineFragmentSelections: GraphSelection[] = ([
  {
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "EventConnection", definedType: "Object" },
  }, 
  {
    name: "pageInfo",
    type: { name: "PageInfo", definedType: "Object" },
    typeCondition: { name: "EventConnection", definedType: "Object" },
    selections: ([
      {
        name: "__typename",
        type: { name: "String", definedType: "Scalar" },
        typeCondition: { name: "PageInfo", definedType: "Object" },
      }, 
      {
        name: "hasNextPage",
        type: { name: "Boolean", definedType: "Scalar" },
        typeCondition: { name: "PageInfo", definedType: "Object" },
      }
    ] as GraphSelection[])
  }, 
  {
    name: "edges",
    type: { name: "EventEdge", definedType: "Object" },
    typeCondition: { name: "EventConnection", definedType: "Object" },
    selections: ([
      {
        name: "__typename",
        type: { name: "String", definedType: "Scalar" },
        typeCondition: { name: "EventEdge", definedType: "Object" },
      }, 
      {
        name: "cursor",
        type: { name: "String", definedType: "Scalar" },
        typeCondition: { name: "EventEdge", definedType: "Object" },
      }, 
      {
        name: "node",
        type: { name: "Event", definedType: "Interface" },
        typeCondition: { name: "EventEdge", definedType: "Object" },
        selections: ([
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
                  }
                ] as GraphSelection[])
              }
            ] as GraphSelection[])
          }
        ] as GraphSelection[])
      }
    ] as GraphSelection[])
  }
] as GraphSelection[])
