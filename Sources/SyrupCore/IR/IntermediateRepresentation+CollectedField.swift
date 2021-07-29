/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2020 Shopify Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Foundation

protocol CollectedField {
	var name: String { get }
	var parentTypeCondition: IntermediateRepresentation.TypeCondition { get set }
	var type: FieldTypeProtocol { get }
	var attributes: IntermediateRepresentation.Attributes { get }
	var fragmentOriginPath: IntermediateRepresentation.SelectionPath? { get }
	var parentFragment: IntermediateRepresentation.SelectionPath.PathComponent.Fragment? { get }
	var referencedVariables: [String] { get }
}

extension CollectedField {
	var parentType: String {
		parentTypeCondition.name
	}
}

extension IntermediateRepresentation {
	struct CollectedObjectField: CollectedField {
		let name: String
		var parentTypeCondition: TypeCondition
		let type: FieldTypeProtocol
		var collectedFields: [CollectedField]
		let attributes: Attributes
		var fragmentSpreads: [SelectionPath]
		var fragmentOriginPath: SelectionPath?
		var parentFragment: SelectionPath.PathComponent.Fragment?
		var referencedVariables: [String]
	}
	
	struct CollectedInterfaceField: CollectedField {
		let name: String
		var parentTypeCondition: TypeCondition
		let type: FieldTypeProtocol
		var collectedFields: [CollectedField]
		let attributes: Attributes
		var fragmentSpreads: [SelectionPath]
		var fragmentOriginPath: SelectionPath?
		var parentFragment: SelectionPath.PathComponent.Fragment?
		var referencedVariables: [String]
	}
	
	struct CollectedUnionField: CollectedField {
		let name: String
		var parentTypeCondition: TypeCondition
		let type: FieldTypeProtocol
		var collectedFields: [CollectedField]
		let attributes: Attributes
		var fragmentSpreads: [SelectionPath]
		var fragmentOriginPath: SelectionPath?
		var parentFragment: SelectionPath.PathComponent.Fragment?
		var referencedVariables: [String]
	}
	
	struct CollectedScalarField: CollectedField {
		let name: String
		var parentTypeCondition: TypeCondition
		let type: FieldTypeProtocol
		let attributes: Attributes
		var fragmentOriginPath: SelectionPath?
		var parentFragment: SelectionPath.PathComponent.Fragment?
		var referencedVariables: [String]
	}
	
	struct SelectionPath: Equatable {
		enum PathComponent: Equatable {
			case field(String)
			case operation(String)
			case fragment(Fragment)
			case inlineFragment(TypeCondition)
			
			struct Fragment: Equatable, Hashable {
				let name: String
				let typeCondition: TypeCondition
				let invokedOnType: String
				let conditionallySelected: Bool
			}
			
			public static func ==(lhs: PathComponent, rhs: PathComponent) -> Bool {
				switch (lhs, rhs) {
				case (.field(let lhsVal), .field(let rhsVal)):
					return lhsVal == rhsVal
				case (.operation(let lhsVal), .operation(let rhsVal)):
					return lhsVal == rhsVal
				case (.fragment(let lhsVal), .fragment(let rhsVal)):
					return lhsVal == rhsVal
				case (.inlineFragment(let lhsVal), .inlineFragment(let rhsVal)):
					return lhsVal == rhsVal
				default:
					return false
				}
			}
			
			var name: String {
				switch self {
				case .field(let name), .operation(let name):
					return name
				case .inlineFragment(let typeCondition):
					return typeCondition.name
				case .fragment(let fragment):
					return fragment.name
				}
			}
		}
		
		private(set) var path: [PathComponent]
		var parent: PathComponent {
			path.first!
		}
		
		func with(_ pathComponent: PathComponent) -> SelectionPath {
			var copy = self
			copy.path.append(pathComponent)
			return copy
		}
		
		func prepending(_ pathComponent: PathComponent) -> SelectionPath {
			var copy = self
			copy.path = [pathComponent] + copy.path
			return copy
		}
		
		func dropLast() -> SelectionPath {
			var copy = self
			copy.path.removeLast()
			return copy
		}
		
		private func suffix(from index: Int) -> SelectionPath {
			guard index < count else { return SelectionPath(path: []) }
			let suffix = Array(path.suffix(from: index))
			return SelectionPath(path: suffix)
		}
		
		func partialPath(after prefix: SelectionPath) -> SelectionPath? {
			guard self.hasPrefix(prefix) else { return nil }
			return suffix(from: prefix.count)
		}
		
		static func ==(lhs: SelectionPath, rhs: SelectionPath) -> Bool {
			lhs.path == rhs.path
		}
		
		func hasPrefix(_ prefix: SelectionPath) -> Bool {
			Array(path.prefix(upTo: prefix.path.count)) == prefix.path
		}
		
		/// Returns true if the field is a result of a fragment spread
		var isResultOfFragmentSpread: Bool {
			for component in path[1...] {
				if case .fragment = component {
					return true
				}
			}
			return false
		}
		
		var count: Int {
			path.count
		}
	}
	
	func collectFields(for operation: OperationDefinition) throws -> (fields: [CollectedField], fragmentSpreads: [SelectionPath]) {
		let parentType = operation.typeName
		var fragmentSpreads: [SelectionPath] = []
		let collectedFields = operation.selections.flatMap {
			self.collectedFields(
				from: $0,
				parentTypeCondition: .object(parentType),
				inlineFragmentSelection: false,
				conditionallySelect: false,
				partialFragmentOriginPath: nil,
				parentFragment: nil,
				fragmentSpreads: &fragmentSpreads
			)
		}
		try validateVariableReferences(forOperation: operation, withCollectedFields: collectedFields)
		let filteredFields = filterTypeNameField(collectedFields: collectedFields)
		let deDupedFields = try IntermediateRepresentation.mergeDuplicateFields(fields: filteredFields)
		return (deDupedFields, fragmentSpreads)
	}
	
	func collectFields(for fragmentDefinition: FragmentDefinition) throws -> (fields: [CollectedField], fragmentSpreads: [SelectionPath]) {
		var fragmentSpreads: [SelectionPath] = []
		let collectedFields = collectFields(for: fragmentDefinition, fragmentSpreads: &fragmentSpreads, parentTypeCondition: fragmentDefinition.typeCondition, conditionallySelect: false)
		let filteredFields = filterTypeNameField(collectedFields: collectedFields)
		let deDupedFields = try IntermediateRepresentation.mergeDuplicateFields(fields: filteredFields)
		return (deDupedFields, fragmentSpreads)
	}
	
	private func filterTypeNameField(collectedFields: [CollectedField]) -> [CollectedField] {
		collectedFields.compactMap { field in
			switch field {
			case var field as CollectedObjectField:
				field.collectedFields = filterTypeNameField(collectedFields: field.collectedFields)
				return field
			case var field as CollectedInterfaceField:
				field.collectedFields = filterTypeNameField(collectedFields: field.collectedFields)
				return field
			case var field as CollectedUnionField:
				field.collectedFields = filterTypeNameField(collectedFields: field.collectedFields)
				return field
			case let field as CollectedScalarField:
				guard field.name != IntermediateRepresentation.typeNameField else {
					return nil
				}
				return field
			default:
				fatalError("Encountered collected field of unknown type \(field)")
			}
		}
	}
	
	enum Error: LocalizedError {
		case undeclaredVariable(variable: String, operation: String)
		case duplicateFieldsNonMatchingVariables(field: String, variables1: [String], variables2: [String])
		
		var errorDescription: String? {
			switch self {
			case let .undeclaredVariable(variable: variable, operation: operation):
				return "Variable $\(variable) was referenced but not declared by operation \(operation)"
			case let .duplicateFieldsNonMatchingVariables(field: field, variables1: variables1, variables2: variables2):
				return "Field \(field) was queried twice with different variable arguments \(variables1) and \(variables2)"
			}
		}
	}
	
	private func validateVariableReferences(forOperation operation: OperationDefinition, withCollectedFields collectedFields: [CollectedField]) throws {
		func referencedVariables(ofField field: CollectedField) -> Set<String> {
			var variables: Set<String> = Set(field.referencedVariables)
			switch field {
			case let field as CollectedObjectField:
				let nestedVariables = field.collectedFields.flatMap { referencedVariables(ofField: $0) }
				variables = variables.union(nestedVariables)
			case let field as CollectedInterfaceField:
				let nestedVariables = field.collectedFields.flatMap { referencedVariables(ofField: $0) }
				variables = variables.union(nestedVariables)
			case let field as CollectedUnionField:
				let nestedVariables = field.collectedFields.flatMap { referencedVariables(ofField: $0) }
				variables = variables.union(nestedVariables)
			default:
				break
			}
			return variables
		}
		let variables = collectedFields.reduce(Set<String>()) { (result, field) -> Set<String> in
			result.union(referencedVariables(ofField: field))
		}
		let declaredVariables = operation.variables.map { $0.name }
		for variable in variables {
			if declaredVariables.contains(variable) == false {
				throw Error.undeclaredVariable(variable: variable, operation: operation.name)
			}
		}
	}
	
	private func collectFields(for fragmentDefinition: FragmentDefinition, fragmentSpreads: inout [SelectionPath], parentTypeCondition: TypeCondition, conditionallySelect: Bool) -> [CollectedField] {
		let typeCondition = fragmentDefinition.typeCondition
		let fragmentOriginPath = SelectionPath(path: [.fragment(SelectionPath.PathComponent.Fragment(name: fragmentDefinition.name, typeCondition: typeCondition, invokedOnType: parentTypeCondition.name, conditionallySelected: conditionallySelect))])
		let parentFragment = SelectionPath.PathComponent.Fragment(name: fragmentDefinition.name, typeCondition: typeCondition, invokedOnType: parentTypeCondition.name, conditionallySelected: conditionallySelect)
		let collectedFields = fragmentDefinition.selections.flatMap {
			self.collectedFields(
				from: $0,
				parentTypeCondition: parentTypeCondition,
				inlineFragmentSelection: false,
				conditionallySelect: conditionallySelect,
				partialFragmentOriginPath: fragmentOriginPath,
				parentFragment: parentFragment,
				fragmentSpreads: &fragmentSpreads
			)
		}
		return collectedFields
	}
	
	private func collectedFields(from selection: Selection, parentTypeCondition: TypeCondition, inlineFragmentSelection: Bool, conditionallySelect: Bool, partialFragmentOriginPath: SelectionPath?, parentFragment: SelectionPath.PathComponent.Fragment?, fragmentSpreads: inout [SelectionPath]) -> [CollectedField] {
		switch selection {
		case .field(let field):
			let nestedPartialFragmentOriginPath = partialFragmentOriginPath?.with(.field(field.name))
			let collectedField: CollectedField
			var fieldType = field.type.fieldTypeProtocol()
			if (field.hasConditionalDirective || conditionallySelect), let nonNullType = fieldType as? NonNullFieldType {
				fieldType = nonNullType.nestedType
			}
			if let objectType = field.type.nestedObject() {
				let nestedParentType = objectType.graphQLTypeName
				var nestedFragmentSpreads: [SelectionPath] = []
				let nestedCollectedFields = objectType.selectionSet.flatMap {
					collectedFields(
						from: $0,
						parentTypeCondition: .object(nestedParentType),
						inlineFragmentSelection: inlineFragmentSelection,
						conditionallySelect: false,
						partialFragmentOriginPath: nestedPartialFragmentOriginPath,
						parentFragment: parentFragment,
						fragmentSpreads: &nestedFragmentSpreads
					)
				}
				collectedField = CollectedObjectField(
					name: field.name,
					parentTypeCondition: parentTypeCondition,
					type: fieldType,
					collectedFields: nestedCollectedFields,
					attributes: field.attributes,
					fragmentSpreads: nestedFragmentSpreads,
					fragmentOriginPath: nestedPartialFragmentOriginPath,
					parentFragment: parentFragment,
					referencedVariables: field.referencedVariables
				)
			} else if let interfaceType = field.type.nestedInterface() {
				let nestedParentType = interfaceType.graphQLTypeName
				var nestedFragmentSpreads: [SelectionPath] = []
				let nestedCollectedFields = interfaceType.selectionSet.flatMap {
					collectedFields(
						from: $0,
						parentTypeCondition: .interface(nestedParentType),
						inlineFragmentSelection: inlineFragmentSelection,
						conditionallySelect: false,
						partialFragmentOriginPath: nestedPartialFragmentOriginPath,
						parentFragment: parentFragment,
						fragmentSpreads: &nestedFragmentSpreads
					)
				}
				collectedField = CollectedInterfaceField(
					name: field.name,
					parentTypeCondition: parentTypeCondition,
					type: fieldType,
					collectedFields: nestedCollectedFields,
					attributes: field.attributes,
					fragmentSpreads: nestedFragmentSpreads,
					fragmentOriginPath: nestedPartialFragmentOriginPath,
					parentFragment: parentFragment,
					referencedVariables: field.referencedVariables
				)
			} else if let unionType = field.type.nestedUnion() {
				let nestedParentType = unionType.graphQLTypeName
				var nestedFragmentSpreads: [SelectionPath] = []
				let nestedCollectedFields = unionType.selectionSet.flatMap {
					collectedFields(
						from: $0,
						parentTypeCondition: .union(nestedParentType),
						inlineFragmentSelection: inlineFragmentSelection,
						conditionallySelect: false,
						partialFragmentOriginPath: nestedPartialFragmentOriginPath,
						parentFragment: parentFragment,
						fragmentSpreads: &nestedFragmentSpreads
					)
				}
				collectedField = CollectedUnionField(
					name: field.name,
					parentTypeCondition: parentTypeCondition,
					type: fieldType,
					collectedFields: nestedCollectedFields,
					attributes: field.attributes,
					fragmentSpreads: nestedFragmentSpreads,
					fragmentOriginPath: nestedPartialFragmentOriginPath,
					parentFragment: parentFragment,
					referencedVariables: field.referencedVariables
				)
			} else {
				collectedField = CollectedScalarField(
					name: field.name,
					parentTypeCondition: parentTypeCondition,
					type: fieldType,
					attributes: field.attributes,
					fragmentOriginPath: nestedPartialFragmentOriginPath,
					parentFragment: parentFragment,
					referencedVariables: field.referencedVariables
				)
			}
			return [collectedField]
		case .fragmentSpread(let fragmentSpread):
			guard let fragmentDefinition = fragmentDefinitions.first(where: { (fragmentDefinition) -> Bool in
				fragmentSpread.name == fragmentDefinition.name
			}) else { return [] }
			var nestedFragmentSpreads: [SelectionPath] = []
			let collectedFields = collectFields(for: fragmentDefinition, fragmentSpreads: &nestedFragmentSpreads, parentTypeCondition: parentTypeCondition, conditionallySelect: conditionallySelect || fragmentSpread.hasConditionalDirective)
			fragmentSpreads.append(
				SelectionPath(path: [
					.fragment(SelectionPath.PathComponent.Fragment(
						name: fragmentSpread.name,
						typeCondition: fragmentDefinition.typeCondition,
						invokedOnType: parentTypeCondition.name,
						conditionallySelected: conditionallySelect || fragmentSpread.hasConditionalDirective))
					]
				)
				
			)
			fragmentSpreads.append(contentsOf: nestedFragmentSpreads.map { $0.prepending(
					.fragment(SelectionPath.PathComponent.Fragment(
						name: fragmentSpread.name,
						typeCondition: fragmentDefinition.typeCondition,
						invokedOnType: parentTypeCondition.name,
						conditionallySelected: conditionallySelect || fragmentSpread.hasConditionalDirective))
					)
				}
			)
			
			return collectedFields
		case .inlineFragment(let inlineFragment):
			let nestedPartialFragmentOriginPath = partialFragmentOriginPath?.with(.inlineFragment(inlineFragment.typeCondition))
			var nestedFragmentSpreads: [SelectionPath] = []
			let isParentTypeInterfaceOrUnion: Bool
			switch parentTypeCondition {
			case .object:
				isParentTypeInterfaceOrUnion = false
			case .interface, .union:
				isParentTypeInterfaceOrUnion = true
			}
			let conditionallySelect: Bool
			switch inlineFragment.typeCondition {
			case .interface, .union:
				conditionallySelect = isParentTypeInterfaceOrUnion || inlineFragment.hasConditionalDirective
			default:
				conditionallySelect = inlineFragment.hasConditionalDirective
			}
			let nestedCollectedFields = inlineFragment.selectionSet.flatMap {
				collectedFields(
					from: $0,
					parentTypeCondition: inlineFragment.typeCondition,
					inlineFragmentSelection: true,
					conditionallySelect: conditionallySelect,
					partialFragmentOriginPath: nestedPartialFragmentOriginPath,
					parentFragment: parentFragment,
					fragmentSpreads: &nestedFragmentSpreads
				)
			}
			fragmentSpreads.append(contentsOf: nestedFragmentSpreads.map { $0.prepending(.inlineFragment(inlineFragment.typeCondition)) })
			return nestedCollectedFields
		}
	}
	
	private static func mergeDuplicateFields(fields: [CollectedField]) throws -> [CollectedField] {
		var mergedFields: [CollectedField] = []
		func areDuplicates(lhs: CollectedField, rhs: CollectedField) -> Bool {
			lhs.name == rhs.name && lhs.parentType == rhs.parentType && lhs.parentFragment == rhs.parentFragment
		}
		for field in fields {
			if let mergedIndex = mergedFields.firstIndex(where: { areDuplicates(lhs: $0, rhs: field) }) {
				let duplicateField = mergedFields[mergedIndex]
				mergedFields[mergedIndex] = try merge(leftField: field, rightField: duplicateField)
			} else {
				mergedFields.append(field)
			}
		}
		
		mergedFields = try mergedFields.map { field in
			switch field {
			case var field as CollectedObjectField:
				field.collectedFields = try mergeDuplicateFields(fields: field.collectedFields)
				return field
			case var field as CollectedInterfaceField:
				field.collectedFields = try mergeDuplicateFields(fields: field.collectedFields)
				return field
			case var field as CollectedUnionField:
				field.collectedFields = try mergeDuplicateFields(fields: field.collectedFields)
				return field
			case let field as CollectedScalarField:
				return field
			default:
				fatalError("Encountered collected field of unknown type")
			}
		}
		
		return mergedFields
	}
	
	fileprivate static func mergeDuplicateFields(forInterfaceType interfaceType: String, inheritedFields: [CollectedField], concreteFields: [CollectedField]) throws -> [CollectedField] {
		var mergedFields: [CollectedField] = []
		let fields = inheritedFields + concreteFields
		func areDuplicates(lhs: CollectedField, rhs: CollectedField) -> Bool {
			lhs.name == rhs.name
		}
		for (index, field) in fields.enumerated() {
			var finalField = field
			if let duplicateField = fields.suffix(from: index).dropFirst().first(where: { areDuplicates(lhs: $0, rhs: field) }) {
				finalField = try merge(leftField: field, rightField: duplicateField, overrideParentType: .interface(interfaceType))
			}
			if let mergedIndex = mergedFields.firstIndex(where: { areDuplicates(lhs: $0, rhs: finalField) }) {
				let duplicateField = mergedFields[mergedIndex]
				mergedFields[mergedIndex] = try merge(leftField: finalField, rightField: duplicateField, overrideParentType: .interface(interfaceType))
			} else {
				mergedFields.append(finalField)
			}
		}
		
		mergedFields = try mergedFields.map { field in
			switch field {
			case var field as CollectedObjectField:
				field.collectedFields = try mergeDuplicateFields(fields: field.collectedFields)
				return field
			case var field as CollectedInterfaceField:
				field.collectedFields = try mergeDuplicateFields(fields: field.collectedFields)
				return field
			case var field as CollectedUnionField:
				field.collectedFields = try mergeDuplicateFields(fields: field.collectedFields)
				return field
			case let field as CollectedScalarField:
				return field
			default:
				fatalError("Encountered collected field of unknown type")
			}
		}
		
		return mergedFields
	}
	
	private static func merge(leftField: CollectedField, rightField: CollectedField, overrideParentType: TypeCondition? = nil) throws -> CollectedField {
		if leftField.referencedVariables != rightField.referencedVariables {
			throw Error.duplicateFieldsNonMatchingVariables(field: leftField.name, variables1: leftField.referencedVariables, variables2: rightField.referencedVariables)
		}
		var mergedField: CollectedField
		switch (leftField, rightField) {
		case (let leftField as CollectedScalarField, _ as CollectedScalarField):
			mergedField = leftField
		case (var leftField as CollectedObjectField, let rightField as CollectedObjectField):
			leftField.collectedFields = try mergeDuplicateFields(fields: (leftField.collectedFields + rightField.collectedFields))
			leftField.fragmentSpreads = leftField.fragmentSpreads + rightField.fragmentSpreads
			mergedField = leftField
		case (var leftField as CollectedInterfaceField, let rightField as CollectedInterfaceField):
			leftField.collectedFields = try mergeDuplicateFields(fields: (leftField.collectedFields + rightField.collectedFields))
			leftField.fragmentSpreads = leftField.fragmentSpreads + rightField.fragmentSpreads
			mergedField = leftField
		case (var leftField as CollectedUnionField, let rightField as CollectedUnionField):
			leftField.collectedFields = try mergeDuplicateFields(fields: (leftField.collectedFields + rightField.collectedFields))
			leftField.fragmentSpreads = leftField.fragmentSpreads + rightField.fragmentSpreads
			mergedField = leftField
		default:
			fatalError("Encountered two fields of different types \(leftField) \(rightField)")
		}
		if let parentTypeCondition = overrideParentType {
			mergedField.parentTypeCondition = parentTypeCondition
		}
		return mergedField
	}
	
	static func fragments(from fragmentSpreads: [IntermediateRepresentation.SelectionPath], onInterfaceType interfaceType: String) -> [IntermediateRepresentation.SelectionPath.PathComponent.Fragment] {
		fragments(from: fragmentSpreads, onType: interfaceType, isInterfaceType: true)
	}
	
	static func fragments(from fragmentSpreads: [IntermediateRepresentation.SelectionPath], onConcreteType concreteType: String) -> [IntermediateRepresentation.SelectionPath.PathComponent.Fragment] {
		fragments(from: fragmentSpreads, onType: concreteType, isInterfaceType: false)
	}
	
	private static func fragments(from fragmentSpreads: [IntermediateRepresentation.SelectionPath], onType type: String, isInterfaceType: Bool) -> [IntermediateRepresentation.SelectionPath.PathComponent.Fragment] {
		var fragments: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment] = []
		for fragmentSpread in fragmentSpreads {
			loop: for component in fragmentSpread.path {
				switch component {
				case .inlineFragment(let typeCondition):
					switch typeCondition {
					case .object(let name):
						if name != type {
							break loop
						}
					case .interface, .union:
						break
					}
				case .fragment(let fragment):
					switch fragment.typeCondition {
					case .object(let name):
						if isInterfaceType == false && name == type {
							fragments.append(fragment)
						}
					case .interface, .union:
						fragments.append(fragment)
					}
					break loop
				default:
					break
				}
			}
		}
		return fragments.unique
	}
	
	/// Returns all of the protocol conformances derived from the fragment spreads,
	/// grouped by the type conditions that they apply to.
	/// Calling it on the fragment spreads of field 'a' with the inherited type of 'A' (Either the interface or union type name), it will return:
	/// ["A": ["Spread1", "Spread2"], "SomeType": ["Spread1", "Spread2", "Spread3"]]
	///```
	/// query SomeQuery {
	///   a {
	///     b
	///     ...Spread1
	///     ...Spread2
	///     ... on SomeType {
	///        ...Spread3
	///     }
	///    }
	/// }
	/// ```
	static func groupedFragmentSpreads(fragmentSpreads: [IntermediateRepresentation.SelectionPath], inheritedType: String) -> [String: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment]] {
		var concreteTypes: [String] = []
		var interfaceAndUnionTypes: [String] = []
		for fragment in fragmentSpreads {
			loop: for component in fragment.path {
				switch component {
				case .inlineFragment(let typeCondition):
					if case .object = typeCondition {
						concreteTypes.append(typeCondition.name)
					} else {
						interfaceAndUnionTypes.append(typeCondition.name)
					}
				case .fragment(let fragment):
					if case .object(let name) = fragment.typeCondition {
						concreteTypes.append(name)
					} else {
						interfaceAndUnionTypes.append(fragment.typeCondition.name)
					}
					break loop
				default:
					break
				}
			}
		}
		concreteTypes = concreteTypes.unique
		interfaceAndUnionTypes = interfaceAndUnionTypes.unique
		
		var groupedFragmentSpreads: [String: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment]] = [:]
		groupedFragmentSpreads[inheritedType] = fragments(from: fragmentSpreads, onInterfaceType: inheritedType)
		for interfaceOrUnionType in interfaceAndUnionTypes {
			groupedFragmentSpreads[inheritedType] = fragments(from: fragmentSpreads, onInterfaceType: interfaceOrUnionType).unique
		}
		for concreteType in concreteTypes {
			groupedFragmentSpreads[concreteType] = fragments(from: fragmentSpreads, onConcreteType: concreteType).unique
		}
		return groupedFragmentSpreads
	}

    static func allReferencedFragmentNames(selections: [IntermediateRepresentation.Selection]) -> [String] {
        var fragmentNames: [String] = []
        
        for selection in selections {
            switch selection {
            case .fragmentSpread(let fragmentSpread):
                fragmentNames.append(fragmentSpread.name)
            case .field(let field):
                let nestedSelections = pullSelectionSetFromFieldType(fieldType: field.type)
                fragmentNames.append(contentsOf: allReferencedFragmentNames(selections: nestedSelections))
            default:
                break
            }
        }

        return fragmentNames.unique.sorted()
    }
    
    static func allReferencedEnumNames(fields: [CollectedField]) -> [String] {

        return []
    }
    
    private static func pullSelectionSetFromFieldType(fieldType: IntermediateRepresentation.FieldType) -> [IntermediateRepresentation.Selection] {
        switch fieldType {
        case .nonNull(let nestedFieldType):
            return pullSelectionSetFromFieldType(fieldType: nestedFieldType)
        case .list(let nestedFieldType):
            return pullSelectionSetFromFieldType(fieldType: nestedFieldType)
        case .union(let union):
            return union.selectionSet
        case .interface(let interface):
            return interface.selectionSet
        case .object(let object):
            return object.selectionSet
        default:
            return []
        }
    }
}

extension Array where Element == CollectedField {
	func groupedFields(fromInterfaceType interfaceType: String) throws -> [String: [CollectedField]] {
		var grouped = Dictionary(grouping: self) { (collectedField) -> String in
			collectedField.parentType
		}
		for collectedField in self {
			switch collectedField.parentTypeCondition {
			case .object:
				break
			case .union(let name), .interface(let name):
				grouped.removeValue(forKey: name)
			}
		}
		let baseFields = self.baseFields(fromInterfaceType: interfaceType)
		return try grouped.mapValues { (fields) -> [CollectedField] in
			try IntermediateRepresentation.mergeDuplicateFields(forInterfaceType: interfaceType, inheritedFields: baseFields, concreteFields: fields)
		}
	}
	
	func groupedFields(fromUnionType unionType: String) -> [String: [CollectedField]] {
		var grouped = Dictionary(grouping: self) { (collectedField) -> String in
			collectedField.parentType
		}
		for collectedField in self {
			switch collectedField.parentTypeCondition {
			case .object:
				break
			case .union(let name), .interface(let name):
				grouped.removeValue(forKey: name)
			}
		}
		return grouped
	}
	
	func baseFields(fromInterfaceType interfaceType: String) -> [CollectedField] {
		let concreteTypes = self.compactMap { (collectedField) -> String? in
			switch collectedField.parentTypeCondition {
			case .object(let name):
				return name
			default:
				return nil
			}
		}
		return self.compactMap { (collectedField) -> CollectedField? in
			if concreteTypes.contains(collectedField.parentType) {
				return nil
			}
			var field = collectedField
			field.parentTypeCondition = .interface(interfaceType)
			return field
		}
	}
	
	func scopedTo(parentFragment: String?) -> [CollectedField] {
		guard let parentFragment = parentFragment else {
			return filter {
				$0.parentFragment == nil
			}
		}
		return filter {
			guard let fieldParentFragment = $0.parentFragment else {
				return false
			}
			return fieldParentFragment.name == parentFragment
		}
	}
	
	func scopedTo(fragmentOriginPath: IntermediateRepresentation.SelectionPath?) -> [CollectedField] {
		let parentFragment: String?
		if let fragmentOriginPath = fragmentOriginPath, case .fragment(let fragment) = fragmentOriginPath.parent {
			parentFragment = fragment.name
		} else {
			parentFragment = nil
		}
		return scopedTo(parentFragment: parentFragment)
	}
	
	func computedFragmentFields(fragmentSpreads: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment], parentType: String) -> [CollectedField] {
		computedFragmentFields(fragmentSpreads: fragmentSpreads, parentTypes: [parentType])
	}
	
	func computedFragmentFields(fragmentSpreads: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment], parentTypes: [String]) -> [CollectedField] {
		var computedFragmentFields: [CollectedField] = []
		var duplicateFields: [String] = []
		var visitedFields: [String] = []
		
		for field in self {
			guard parentTypes.contains(field.parentType) else {
				continue
			}
			if visitedFields.contains(field.name) {
				duplicateFields.append(field.name)
			} else if let parentFragment = field.parentFragment, fragmentSpreads.contains(parentFragment), field.parentType == parentFragment.typeCondition.name {
				computedFragmentFields.append(field)
			}
			visitedFields.append(field.name)
		}
		
		computedFragmentFields = computedFragmentFields.filter { field in
			!duplicateFields.contains(field.name)
		}
		
		return computedFragmentFields
	}
}
