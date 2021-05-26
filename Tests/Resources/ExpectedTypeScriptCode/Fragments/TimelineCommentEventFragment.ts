import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace TimelineCommentEventFragmentFragmentData {
  export interface Other {
    __typename: '';
  }

  export interface CommentEventAuthor {
    __typename: 'StaffMember';
    /**
     * The staff member's email address.
     */
    email: string;
  }
  export interface CommentEvent {
    __typename: 'CommentEvent';
    /**
     * The name of the user that authored the comment event.
     */
    author: CommentEventAuthor;
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
    name: "author",
    type: { name: "StaffMember", definedType: "Object" },
    arguments: {},
    passedGID: null,
    typeCondition: { name: "CommentEvent", definedType: "Object" },
    directive: null,
    selections: ([
      {
        name: "__typename",
        type: { name: "String", definedType: "Scalar" },
        arguments: {},
        passedGID: null,
        typeCondition: { name: "StaffMember", definedType: "Object" },
        directive: null,
        selections: ([] as GraphSelection[])
      }, 
      {
        name: "email",
        type: { name: "String", definedType: "Scalar" },
        arguments: {},
        passedGID: null,
        typeCondition: { name: "StaffMember", definedType: "Object" },
        directive: null,
        selections: ([] as GraphSelection[])
      }
    ] as GraphSelection[])
  }
] as GraphSelection[])

