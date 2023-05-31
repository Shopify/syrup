// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"
import {
  EventPreviewInfoFragmentData,
  eventPreviewInfoSelections,
  eventPreviewInfoTypeCondition,
} from "./EventPreviewInfo"
import {
  EventAttributeFieldsFragmentData,
  eventAttributeFieldsSelections,
  eventAttributeFieldsTypeCondition,
} from "./EventAttributeFields"
import {
  EventAlertFragmentData,
  eventAlertSelections,
  eventAlertTypeCondition,
} from "./EventAlert"

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
  export interface EdgesNode_BaseFields_ extends EventPreviewInfoFragmentData._BaseFields_, EventAttributeFieldsFragmentData._BaseFields_, EventAlertFragmentData._BaseFields_ {
    /**
     * Globally unique identifier.
     */
    id: ID;
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

export const timelineFragmentTypeCondition = { name: "EventConnection", definedType: "Object" }

export const timelineFragmentSelections: GraphSelection[] = ([
  {
    selectionType: "field",
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "EventConnection", definedType: "Object" },
  }, 
  {
    selectionType: "field",
    name: "pageInfo",
    type: { name: "PageInfo", definedType: "Object" },
    typeCondition: { name: "EventConnection", definedType: "Object" },
    selections: ([
      {
        selectionType: "field",
        name: "__typename",
        type: { name: "String", definedType: "Scalar" },
        typeCondition: { name: "PageInfo", definedType: "Object" },
      }, 
      {
        selectionType: "field",
        name: "hasNextPage",
        type: { name: "Boolean", definedType: "Scalar" },
        typeCondition: { name: "PageInfo", definedType: "Object" },
      }
    ] as GraphSelection[])
  }, 
  {
    selectionType: "field",
    name: "edges",
    type: { name: "EventEdge", definedType: "Object" },
    typeCondition: { name: "EventConnection", definedType: "Object" },
    selections: ([
      {
        selectionType: "field",
        name: "__typename",
        type: { name: "String", definedType: "Scalar" },
        typeCondition: { name: "EventEdge", definedType: "Object" },
      }, 
      {
        selectionType: "field",
        name: "cursor",
        type: { name: "String", definedType: "Scalar" },
        typeCondition: { name: "EventEdge", definedType: "Object" },
      }, 
      {
        selectionType: "field",
        name: "node",
        type: { name: "Event", definedType: "Interface" },
        typeCondition: { name: "EventEdge", definedType: "Object" },
        selections: ([
          {
            selectionType: "field",
            name: "__typename",
            type: { name: "String", definedType: "Scalar" },
            typeCondition: { name: "Event", definedType: "Interface" },
          }, 
          {
            selectionType: "field",
            name: "id",
            type: { name: "ID", definedType: "Scalar" },
            typeCondition: { name: "Event", definedType: "Interface" },
          }, 
          {
            selectionType: "fragmentSpread",
            name: "EventPreviewInfo",
            typeCondition: eventPreviewInfoTypeCondition,
            selections: eventPreviewInfoSelections
          }, 
          {
            selectionType: "fragmentSpread",
            name: "EventAttributeFields",
            typeCondition: eventAttributeFieldsTypeCondition,
            selections: eventAttributeFieldsSelections
          }, 
          {
            selectionType: "fragmentSpread",
            name: "EventAlert",
            typeCondition: eventAlertTypeCondition,
            selections: eventAlertSelections
          }, 
          {
            selectionType: "inlineFragment",
            typeCondition: { name: "CommentEvent", definedType: "Object" },
            selections: ([
              {
                selectionType: "field",
                name: "__typename",
                type: { name: "String", definedType: "Scalar" },
                typeCondition: { name: "CommentEvent", definedType: "Object" },
              }, 
              {
                selectionType: "field",
                name: "edited",
                type: { name: "Boolean", definedType: "Scalar" },
                typeCondition: { name: "CommentEvent", definedType: "Object" },
              }, 
              {
                selectionType: "field",
                name: "canEdit",
                type: { name: "Boolean", definedType: "Scalar" },
                typeCondition: { name: "CommentEvent", definedType: "Object" },
              }, 
              {
                selectionType: "field",
                name: "canDelete",
                type: { name: "Boolean", definedType: "Scalar" },
                typeCondition: { name: "CommentEvent", definedType: "Object" },
              }, 
              {
                selectionType: "field",
                name: "attachments",
                type: { name: "CommentEventAttachment", definedType: "Object" },
                typeCondition: { name: "CommentEvent", definedType: "Object" },
                selections: ([
                  {
                    selectionType: "field",
                    name: "__typename",
                    type: { name: "String", definedType: "Scalar" },
                    typeCondition: { name: "CommentEventAttachment", definedType: "Object" },
                  }, 
                  {
                    selectionType: "field",
                    name: "id",
                    type: { name: "ID", definedType: "Scalar" },
                    typeCondition: { name: "CommentEventAttachment", definedType: "Object" },
                  }, 
                  {
                    selectionType: "field",
                    name: "name",
                    type: { name: "String", definedType: "Scalar" },
                    typeCondition: { name: "CommentEventAttachment", definedType: "Object" },
                  }, 
                  {
                    selectionType: "field",
                    name: "size",
                    type: { name: "Int", definedType: "Scalar" },
                    typeCondition: { name: "CommentEventAttachment", definedType: "Object" },
                  }, 
                  {
                    selectionType: "field",
                    name: "fileExtension",
                    type: { name: "String", definedType: "Scalar" },
                    typeCondition: { name: "CommentEventAttachment", definedType: "Object" },
                  }, 
                  {
                    selectionType: "field",
                    name: "url",
                    type: { name: "URL", definedType: "Scalar" },
                    typeCondition: { name: "CommentEventAttachment", definedType: "Object" },
                  }, 
                  {
                    selectionType: "field",
                    name: "image",
                    type: { name: "Image", definedType: "Object" },
                    typeCondition: { name: "CommentEventAttachment", definedType: "Object" },
                    selections: ([
                      {
                        selectionType: "field",
                        name: "__typename",
                        type: { name: "String", definedType: "Scalar" },
                        typeCondition: { name: "Image", definedType: "Object" },
                      }, 
                      {
                        selectionType: "field",
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
  }
] as GraphSelection[])
