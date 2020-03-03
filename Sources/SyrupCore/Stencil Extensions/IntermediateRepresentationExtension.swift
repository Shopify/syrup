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

import Stencil

final class IntermediateRepresentationExtension: Extension {
	override init() {
		super.init()
		
		registerFilter("isNullable", filter: IntermediateRepresentationExtension.isNullable)
		registerFilter("requiresCustomCoder", filter: IntermediateRepresentationExtension.requiresCustomCoder)
		registerFilter("nestedRawValueType", filter: IntermediateRepresentationExtension.nestedRawValueType)
		registerFilter("nestedGraphType", filter: IntermediateRepresentationExtension.nestedGraphType)
	}
	
	static func isNullable(_ value: Any?) throws -> Any? {
		guard let variable = value as? IntermediateRepresentation.Variable else { return false }
		if case .nonNull = variable.type {
			return false
		} else {
			return true
		}
	}
	
	static func requiresCustomCoder(_ value: Any?) throws -> Any? {
		if let collectedField = value as? CollectedField {
			return collectedField.type.nestedScalar is IntermediateRepresentation.CustomCodedScalar
		} else if let variable = value as? IntermediateRepresentation.Variable {
			return variable.type.nestedScalar() is IntermediateRepresentation.CustomCodedScalar
		}
		return false
	}
	
	static func nestedRawValueType(_ value: Any?) throws -> Any? {
		var customCodedScalar: IntermediateRepresentation.CustomCodedScalar?
		if let variable = value as? IntermediateRepresentation.Variable {
			customCodedScalar = variable.type.nestedScalar() as? IntermediateRepresentation.CustomCodedScalar
		} else if let collectedField = value as? CollectedField {
			customCodedScalar = collectedField.type.nestedScalar as? IntermediateRepresentation.CustomCodedScalar
		}
		return customCodedScalar?.rawValueType
	}
	
	static func nestedGraphType(_ value: Any?) throws -> Any? {
		var customCodedScalar: IntermediateRepresentation.CustomCodedScalar?
		if let variable = value as? IntermediateRepresentation.Variable {
			customCodedScalar = variable.type.nestedScalar() as? IntermediateRepresentation.CustomCodedScalar
		} else if let collectedField = value as? CollectedField {
			customCodedScalar = collectedField.type.nestedScalar as? IntermediateRepresentation.CustomCodedScalar
		}
		return customCodedScalar?.graphType
	}
}
