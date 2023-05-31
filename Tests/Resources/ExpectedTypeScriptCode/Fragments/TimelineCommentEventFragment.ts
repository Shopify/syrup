// Syrup auto-generated file

import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace TimelineCommentEventFragmentFragmentData {
  export interface Other {
    __typename: '';
  }

  export interface CommentEvent {
    __typename: 'CommentEvent';
    /**
     * Whether the comment event has been edited. If true, then the comment event has been edited.
     */
    edited: boolean;
  }

  export interface _BaseFields_ {
  }
}

export type TimelineCommentEventFragmentFragmentData = TimelineCommentEventFragmentFragmentData._BaseFields_ & (TimelineCommentEventFragmentFragmentData.CommentEvent | TimelineCommentEventFragmentFragmentData.Other)

export const timelineCommentEventFragmentTypeCondition = { name: "Event", definedType: "Interface" }

export const timelineCommentEventFragmentSelections: GraphSelection[] = ([
  {
    selectionType: "field",
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    typeCondition: { name: "Event", definedType: "Interface" },
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
      }
    ] as GraphSelection[])
  }
] as GraphSelection[])

