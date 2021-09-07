import { SimpleDocument } from "graphql-typed"

export type ID = string

export interface GraphSelection {
  name: string
  alias: string | null
  arguments: Record<string, any>
  type: TypeDefinition
  passedGID: string | null
  typeCondition: TypeDefinition | null
  directive: ConditionalDirective | null
  selections: GraphSelection[]
}

export interface TypeDefinition {
  name: string,
  definedType: string
}

export interface ConditionalDirective {
  directiveType: string,
  value: any
}

export interface SyrupOperation<Data = {}, Variables = {}, DeepPartial = {}> extends SimpleDocument<Data, Variables, DeepPartial> {
  readonly operationType: 'query' | 'mutation' | 'subscription'
  readonly selections: GraphSelection[]
}

export const copyWithTypeCondition: (
  selection: GraphSelection, 
  typeCondition: TypeDefinition | null
) => GraphSelection = (selection, typeCondition) => {
  return {
    name: selection.name,
    arguments: selection.arguments,
    type: selection.type,
    passedGID: selection.passedGID,
    typeCondition: typeCondition,
    directive: selection.directive,
    selections: selection.selections
  }
}
