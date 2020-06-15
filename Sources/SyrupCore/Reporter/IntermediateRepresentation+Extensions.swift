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

func warnDupeKey(key: [String], verbose: Bool = false) {
	if  verbose {
		print("\u{001B}[3mWarning: duplicate field detected `\(key.joined(separator: "."))`\u{001B}[0m")
	}
}

extension Sequence where Iterator.Element == IntermediateRepresentation.OperationDefinition {
	func findFields(verbose: Bool = false) -> [[String]: IntermediateRepresentation.Field] {
		return self.reduce([[String]: IntermediateRepresentation.Field]()) {
			$0.merging($1.selections.findFields(parentKey: [$1.name], verbose: verbose)) { (_, new) in new }
		}
	}
}

extension Sequence where Iterator.Element == IntermediateRepresentation.FragmentDefinition {
	func findFields(verbose: Bool = false) -> [[String]: IntermediateRepresentation.Field] {
		return self.reduce([[String]: IntermediateRepresentation.Field]()) {
			$0.merging($1.selections.findFields(parentKey: [$1.name], verbose: verbose)) { (_, new) in new }
		}
	}
}

extension Sequence where Iterator.Element == IntermediateRepresentation.Selection {
	// Builds a dictionary of Key:Field
	func findFields(parentKey: [String], verbose: Bool = false) -> [[String]: IntermediateRepresentation.Field] {
		return self.reduce([[String]: IntermediateRepresentation.Field]()) { (result, selection) in
			switch selection {
				case .field(let field):
					let currentKey = parentKey + [field.name]
					let currentKeyField = [currentKey: field]
					if result.keys.contains(currentKey) {
						warnDupeKey(key: currentKey, verbose: verbose)
					}
					let subKeyFields = field.type.findFields(parentKey: currentKey) ?? [:]
					subKeyFields.keys.forEach {
						if result.keys.contains($0) {
							warnDupeKey(key: $0, verbose: verbose)
						}
					}
					return result
							.merging(currentKeyField) { (_, new) in new }
							.merging(subKeyFields) { (_, new) in new }
				case .inlineFragment(let inline):
					let currentKey = parentKey + [inline.typeCondition.name]
					let inlineFields = inline.selectionSet.findFields(parentKey: currentKey, verbose: verbose)
					if result.keys.contains(currentKey) { warnDupeKey(key: currentKey, verbose: verbose) }
					return result.merging(inlineFields) { (_, new) in new }
				case .fragmentSpread:
					return result
			}
		}
	}
}

extension IntermediateRepresentation.FieldType {
	func findFields(parentKey: [String], verbose: Bool = false) -> [[String]: IntermediateRepresentation.Field]? {
		switch self {
			case .list(let nestedType):
				return nestedType.findFields(parentKey: parentKey, verbose: verbose)
			case .nonNull(let nestedType):
				return nestedType.findFields(parentKey: parentKey, verbose: verbose)
			case .scalar, .enum:
				return nil
			case .object(let object):
				return object.selectionSet.findFields(parentKey: parentKey, verbose: verbose)
			case .interface(let interface):
				return interface.selectionSet.findFields(parentKey: parentKey, verbose: verbose)
			case .union(let union):
				return union.selectionSet.findFields(parentKey: parentKey, verbose: verbose)
		}
	}
}

extension Sequence where Iterator.Element == IntermediateRepresentation.Selection {
	func printInfo(depth: Int = 1) {
		let prefix: String = String(repeating: "\t", count: depth)
		self.forEach {
			switch $0 {
				case .field(let field):
					field.printInfo(depth: depth)
				case .fragmentSpread(let spread):
					print(prefix + "...\(spread.name)")
				case .inlineFragment(let inline):
					print(prefix + "... on \(inline.typeCondition.name) {")
					inline.selectionSet.printInfo(depth: depth + 1)
					print("\(prefix)}")
			}
		}
	}
}

extension Sequence where Iterator.Element == IntermediateRepresentation.OperationDefinition {
	func printInfo() {
		self.forEach {
			print("operation \($0.name):\(String(describing: $0.type)) {")
			$0.selections.printInfo()
			print("}")
		}
	}
}

extension IntermediateRepresentation.Field {
	func printInfo(depth: Int) {
		let suffix: String = self.attributes.isDeprecated ? " [DEPRECATED]" : ""
		self.type.printInfo(depth: depth, fieldName: "field \(self.name)" + suffix)
	}
}

extension Sequence where Iterator.Element == IntermediateRepresentation.FragmentDefinition {
	func printInfo() {
		self.forEach {
			print("fragment: \($0.name):\($0.typeCondition.name):\(String(describing: $0.typeCondition.name)) ")
		}
	}
}

extension Sequence {
	func compactFlatMap<SegmentOfResult>(_ transform: (Self.Element) throws -> SegmentOfResult?) rethrows -> [SegmentOfResult.Element] where SegmentOfResult: Sequence {
		return try self
				.compactMap(transform)
				.flatMap { $0 }
	}
}

extension Sequence where Iterator.Element == IntermediateRepresentation.EnumType {
	func printInfo() {
		self.forEach {
			print("enum: \($0.name) \($0.attributes.isDeprecated ? "[DEPRECATED]" : "") ")
		}
	}
}

extension Sequence where Iterator.Element == IntermediateRepresentation.EnumType.Value {
	func printInfo() {
		let values: [String] = self.reduce(into: [String]()) {
			$0.append($1.value)
		}
		print("[\(values.joined(separator: ","))]")
	}
}

extension IntermediateRepresentation.FieldType {
	func printInfo(depth: Int, fieldName: String, suffixes: [String] = [String]()) {
		let prefix: String = String(repeating: "\t", count: depth)
		switch self {
			case .list(let nestedType):
				nestedType.printInfo(depth: depth, fieldName: fieldName, suffixes: suffixes + ["listOf"])
			case .nonNull(let nestedType):
				nestedType.printInfo(depth: depth, fieldName: fieldName, suffixes: suffixes + ["nonNull"])
			case .scalar(let scalarType):
				print("\(prefix)\(fieldName):\(scalarType.graphType) scalar(\(scalarType.nativeType))[\(suffixes.joined(separator: ","))]")
			case .enum(let name):
				print("\(prefix)\(fieldName):\(name) [\(suffixes.joined(separator: ",")),enum]")
			case .object(let object):
				print("\(prefix)\(fieldName):\(object.graphQLTypeName) object[\(object.selectionSet.count)][\(suffixes.joined(separator: ","))] {")
				object.selectionSet.printInfo(depth: depth + 1)
				print("\(prefix)}")
			case .interface(let interface):
				print("\(prefix)\(fieldName):\(interface.graphQLTypeName) interface[\(interface.selectionSet.count)][\(suffixes.joined(separator: ","))] {")
				interface.selectionSet.printInfo(depth: depth + 1)
				print("\(prefix)}")
			case .union(let union):
				print("\(prefix)\(fieldName):\(union.graphQLTypeName) union[\(union.selectionSet.count)][\(suffixes.joined(separator: ","))] {")
				union.selectionSet.printInfo(depth: depth + 1)
				print("\(prefix)}")
		}
	}
}
