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

final class TypeAnnotationExtension: Extension {
	let moduleName: String
	init(moduleName: String) {
		self.moduleName = moduleName
		super.init()
		
		registerFilter("renderTypeAnnotation") { (value, args) -> Any? in
			enum Context: String {
				case fragment
				case unknown
			}
			
			let contextString = args.first as? String ?? ""
			let context = Context(rawValue: contextString) ?? .unknown
			
			if let field = value as? IntermediateRepresentation.CollectedScalarField {
				if context == .fragment {
					return SwiftTypeAnnotationRenderer.render(scalarField: field, outsideOfModule: moduleName)
				} else {
					return SwiftTypeAnnotationRenderer.render(scalarField: field)
				}
			} else if let field = value as? IntermediateRepresentation.CollectedObjectField {
				switch context {
				case .fragment:
					return SwiftTypeAnnotationRenderer.renderInFragment(objectField: field)
				case .unknown:
					return nil
				}
			} else if let field = value as? IntermediateRepresentation.CollectedInterfaceField {
				switch context {
				case .fragment:
					return SwiftTypeAnnotationRenderer.renderInFragment(interfaceField: field)
				case .unknown:
					return nil
				}
			} else if let field = value as? IntermediateRepresentation.CollectedUnionField {
				switch context {
				case .fragment:
					return SwiftTypeAnnotationRenderer.renderInFragment(unionField: field)
				case .unknown:
					return nil
				}
			}
			return nil
		}
	}
}
