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
      type: { name: "String", definedType: "Scalar" },
      typeCondition: { name: "Mutation", definedType: "Object" },
    }, 
    {
      name: "collectionCreate",
      type: { name: "CollectionCreatePayload", definedType: "Object" },
      typeCondition: { name: "Mutation", definedType: "Object" },
      arguments: { input: { type: "OperationVariableKey", value: "input" } },
      selections: ([
        {
          name: "__typename",
          type: { name: "String", definedType: "Scalar" },
          typeCondition: { name: "CollectionCreatePayload", definedType: "Object" },
        }, 
        {
          name: "userErrors",
          type: { name: "UserError", definedType: "Object" },
          typeCondition: { name: "CollectionCreatePayload", definedType: "Object" },
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "UserError", definedType: "Object" },
            }, 
            {
              name: "field",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "UserError", definedType: "Object" },
            }, 
            {
              name: "message",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "UserError", definedType: "Object" },
            }
          ] as GraphSelection[])
        }, 
        {
          name: "collection",
          type: { name: "Collection", definedType: "Object" },
          typeCondition: { name: "CollectionCreatePayload", definedType: "Object" },
          selections: ([
            {
              name: "__typename",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "Collection", definedType: "Object" },
            }, 
            {
              name: "title",
              type: { name: "String", definedType: "Scalar" },
              typeCondition: { name: "Collection", definedType: "Object" },
            }, 
            {
              name: "id",
              type: { name: "ID", definedType: "Scalar" },
              typeCondition: { name: "Collection", definedType: "Object" },
            }, 
            {
              name: "feedback",
              type: { name: "ResourceFeedback", definedType: "Object" },
              typeCondition: { name: "Collection", definedType: "Object" },
              selections: ([
                {
                  name: "__typename",
                  type: { name: "String", definedType: "Scalar" },
                  typeCondition: { name: "ResourceFeedback", definedType: "Object" },
                }, 
                {
                  name: "summary",
                  type: { name: "String", definedType: "Scalar" },
                  typeCondition: { name: "ResourceFeedback", definedType: "Object" },
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
