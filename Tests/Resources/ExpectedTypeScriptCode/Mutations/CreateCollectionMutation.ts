import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"
import {
  CollectionInput,
} from "../Inputs"

export namespace CreateCollectionMutationData {
  export interface Variables {
    input: CollectionInput;
  }
  export interface CollectionCreateUserErrors {
    __typename: 'UserError';
    /**
     * Path to the input field which caused the error.
     */
    field?: string[] | null;
    /**
     * The error message.
     */
    message: string;
  }
  export interface CollectionCreateCollectionFeedback {
    __typename: 'ResourceFeedback';
    /**
     * Summary of resource feedback pertaining to the resource.
     */
    summary: string;
  }
  export interface CollectionCreateCollection {
    __typename: 'Collection';
    /**
     * The title of the collection.
     */
    title: string;
    /**
     * Globally unique identifier.
     */
    id: ID;
    /**
     * Information about the collection that's provided through resource feedback.
     */
    feedback?: CollectionCreateCollectionFeedback | null;
  }
  export interface CollectionCreate {
    __typename: 'CollectionCreatePayload';
    /**
     * List of errors that occurred executing the mutation.
     */
    userErrors: CollectionCreateUserErrors[];
    /**
     * The collection that has been created.
     */
    collection?: CollectionCreateCollection | null;
  }
}

export interface CreateCollectionMutationData {

  /**
   * Creates a collection.
   */
  collectionCreate?: CreateCollectionMutationData.CollectionCreate | null;
}

const document: SyrupOperation<CreateCollectionMutationData, CreateCollectionMutationData.Variables> = {
  id: "abafa5f2606e8e323707b978fd34db34da7ba6f12c9af3eac1aa6bc15718e3aa",
  name: "CreateCollection",
  source: "mutation CreateCollection(\$input: CollectionInput!) { __typename collectionCreate(input: \$input) { __typename userErrors { __typename field message } collection { __typename title id feedback { __typename summary } } } }",
  operationType: 'mutation',
  selections: ([
    {
      name: "__typename",
      alias: null,
      type: { name: "String", definedType: "Scalar" },
      arguments: {},
      passedGID: null,
      typeCondition: { name: "Mutation", definedType: "Object" },
      directive: null,
      selections: ([] as GraphSelection[])
    }, 
    {
      name: "collectionCreate",
      alias: null,
      type: { name: "CollectionCreatePayload", definedType: "Object" },
      arguments: { input: { type: "OperationVariableKey", value: "input" } },
      passedGID: null,
      typeCondition: { name: "Mutation", definedType: "Object" },
      directive: null,
      selections: ([
        {
          name: "__typename",
          alias: null,
          type: { name: "String", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "CollectionCreatePayload", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "userErrors",
          alias: null,
          type: { name: "UserError", definedType: "Object" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "CollectionCreatePayload", definedType: "Object" },
          directive: null,
          selections: ([
            {
              name: "__typename",
              alias: null,
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "UserError", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "field",
              alias: null,
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "UserError", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "message",
              alias: null,
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "UserError", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }
          ] as GraphSelection[])
        }, 
        {
          name: "collection",
          alias: null,
          type: { name: "Collection", definedType: "Object" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "CollectionCreatePayload", definedType: "Object" },
          directive: null,
          selections: ([
            {
              name: "__typename",
              alias: null,
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "Collection", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "title",
              alias: null,
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "Collection", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "id",
              alias: null,
              type: { name: "ID", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "Collection", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "feedback",
              alias: null,
              type: { name: "ResourceFeedback", definedType: "Object" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "Collection", definedType: "Object" },
              directive: null,
              selections: ([
                {
                  name: "__typename",
                  alias: null,
                  type: { name: "String", definedType: "Scalar" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "ResourceFeedback", definedType: "Object" },
                  directive: null,
                  selections: ([] as GraphSelection[])
                }, 
                {
                  name: "summary",
                  alias: null,
                  type: { name: "String", definedType: "Scalar" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "ResourceFeedback", definedType: "Object" },
                  directive: null,
                  selections: ([] as GraphSelection[])
                }
              ] as GraphSelection[])
            }
          ] as GraphSelection[])
        }
      ] as GraphSelection[])
    }
  ] as GraphSelection[])
}
export default document
