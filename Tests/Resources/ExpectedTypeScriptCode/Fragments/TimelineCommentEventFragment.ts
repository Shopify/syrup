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

export type TimelineCommentEventFragmentFragmentData = TimelineCommentEventFragmentFragmentData.CommentEvent | TimelineCommentEventFragmentFragmentData.Other

export const timelineCommentEventFragmentSelections: GraphSelection[] = ([
  {
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    arguments: {},
    passedGID: null,
    typeCondition: { name: "Event", definedType: "Interface" },
    directive: null,
    selections: ([] as GraphSelection[])
  }, 
  {
    name: "__typename",
    type: { name: "String", definedType: "Scalar" },
    arguments: {},
    passedGID: null,
    typeCondition: { name: "CommentEvent", definedType: "Object" },
    directive: null,
    selections: ([] as GraphSelection[])
  }, 
  {
    name: "edited",
    type: { name: "Boolean", definedType: "Scalar" },
    arguments: {},
    passedGID: null,
    typeCondition: { name: "CommentEvent", definedType: "Object" },
    directive: null,
    selections: ([] as GraphSelection[])
  }
] as GraphSelection[])

