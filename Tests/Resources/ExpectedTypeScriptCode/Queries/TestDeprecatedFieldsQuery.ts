import { ID, GraphSelection, SyrupOperation, copyWithTypeCondition } from "../GraphApi"

export namespace TestDeprecatedFieldsQueryData {
  export interface Variables {
    first?: number | null;
  }
  export interface ChannelsEdgesNodeAppIcon {
    __typename: 'Image';
    /**
     * The location of the image as a URL.
     *
     * @deprecated Previously an image had a single `src` field. This could either return the original image
     * location or a URL that contained transformations such as sizing or scale.
     * These transformations were specified by arguments on the parent field.
     * Now an image has two distinct URL fields: `originalSrc` and `transformedSrc`.
     * * `originalSrc` - the original unmodified image URL
     * * `transformedSrc` - the image URL with the specified transformations included
     * To migrate to the new fields, image transformations should be moved from the parent field to `transformedSrc`.
     * Before:
     * ```graphql
     * {
     *   shop {
     *     productImages(maxWidth: 200, scale: 2) {
     *       edges {
     *         node {
     *           src
     *         }
     *       }
     *     }
     *   }
     * }
     * ```
     * After:
     * ```graphql
     * {
     *   shop {
     *     productImages {
     *       edges {
     *         node {
     *           transformedSrc(maxWidth: 200, scale: 2)
     *         }
     *       }
     *     }
     *   }
     * }
     * ```
     */
    src: string;
  }
  export interface ChannelsEdgesNodeApp {
    __typename: 'App';
    /**
     * Globally unique identifier.
     */
    id: ID;
    /**
     * Icon that represents the app.
     */
    icon: ChannelsEdgesNodeAppIcon;
  }
  export interface ChannelsEdgesNode {
    __typename: 'Channel';
    /**
     * Underlying app used by the channel.
     */
    app: ChannelsEdgesNodeApp;
  }
  export interface ChannelsEdges {
    __typename: 'ChannelEdge';
    /**
     * The item at the end of ChannelEdge.
     */
    node: ChannelsEdgesNode;
  }
  export interface Channels {
    __typename: 'ChannelConnection';
    /**
     * A list of edges.
     */
    edges: ChannelsEdges[];
  }
}

export interface TestDeprecatedFieldsQueryData {

  /**
   * List of the active sales channels.
   *
   * @deprecated Use `publications` instead
   */
  channels: TestDeprecatedFieldsQueryData.Channels;
}

const document: SyrupOperation<TestDeprecatedFieldsQueryData, TestDeprecatedFieldsQueryData.Variables> = {
  id: "7fdd039bc0572bbb159d3fa4a21621ace852fa86160f392c66a8a7907ee5d736",
  name: "TestDeprecatedFields",
  source: "query TestDeprecatedFields(\$first: Int) { __typename channels(first: \$first) { __typename edges { __typename node { __typename app { __typename id icon { __typename src } } } } } }",
  operationType: 'query',
  selections: ([
    {
      name: "__typename",
      alias: null,
      type: { name: "String", definedType: "Scalar" },
      arguments: {},
      passedGID: null,
      typeCondition: { name: "QueryRoot", definedType: "Object" },
      directive: null,
      selections: ([] as GraphSelection[])
    }, 
    {
      name: "channels",
      alias: null,
      type: { name: "ChannelConnection", definedType: "Object" },
      arguments: { first: { type: "OperationVariableKey", value: "first" } },
      passedGID: null,
      typeCondition: { name: "QueryRoot", definedType: "Object" },
      directive: null,
      selections: ([
        {
          name: "__typename",
          alias: null,
          type: { name: "String", definedType: "Scalar" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "ChannelConnection", definedType: "Object" },
          directive: null,
          selections: ([] as GraphSelection[])
        }, 
        {
          name: "edges",
          alias: null,
          type: { name: "ChannelEdge", definedType: "Object" },
          arguments: {},
          passedGID: null,
          typeCondition: { name: "ChannelConnection", definedType: "Object" },
          directive: null,
          selections: ([
            {
              name: "__typename",
              alias: null,
              type: { name: "String", definedType: "Scalar" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "ChannelEdge", definedType: "Object" },
              directive: null,
              selections: ([] as GraphSelection[])
            }, 
            {
              name: "node",
              alias: null,
              type: { name: "Channel", definedType: "Object" },
              arguments: {},
              passedGID: null,
              typeCondition: { name: "ChannelEdge", definedType: "Object" },
              directive: null,
              selections: ([
                {
                  name: "__typename",
                  alias: null,
                  type: { name: "String", definedType: "Scalar" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "Channel", definedType: "Object" },
                  directive: null,
                  selections: ([] as GraphSelection[])
                }, 
                {
                  name: "app",
                  alias: null,
                  type: { name: "App", definedType: "Object" },
                  arguments: {},
                  passedGID: null,
                  typeCondition: { name: "Channel", definedType: "Object" },
                  directive: null,
                  selections: ([
                    {
                      name: "__typename",
                      alias: null,
                      type: { name: "String", definedType: "Scalar" },
                      arguments: {},
                      passedGID: null,
                      typeCondition: { name: "App", definedType: "Object" },
                      directive: null,
                      selections: ([] as GraphSelection[])
                    }, 
                    {
                      name: "id",
                      alias: null,
                      type: { name: "ID", definedType: "Scalar" },
                      arguments: {},
                      passedGID: null,
                      typeCondition: { name: "App", definedType: "Object" },
                      directive: null,
                      selections: ([] as GraphSelection[])
                    }, 
                    {
                      name: "icon",
                      alias: null,
                      type: { name: "Image", definedType: "Object" },
                      arguments: {},
                      passedGID: null,
                      typeCondition: { name: "App", definedType: "Object" },
                      directive: null,
                      selections: ([
                        {
                          name: "__typename",
                          alias: null,
                          type: { name: "String", definedType: "Scalar" },
                          arguments: {},
                          passedGID: null,
                          typeCondition: { name: "Image", definedType: "Object" },
                          directive: null,
                          selections: ([] as GraphSelection[])
                        }, 
                        {
                          name: "src",
                          alias: null,
                          type: { name: "URL", definedType: "Scalar" },
                          arguments: {},
                          passedGID: null,
                          typeCondition: { name: "Image", definedType: "Object" },
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
      ] as GraphSelection[])
    }
  ] as GraphSelection[])
}
export default document
