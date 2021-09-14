//
//  File.swift
//  
//
//  Created by Samer Alabi on 2021-09-15.
//

import Basic
import Foundation

public enum ConfigNext {
	case integrated(config: IntegratedConfig)
	case isolated(config: IsolatedConfig)
}

public struct IntegratedConfig {
	var filesLocation: String
	var generatedDestination: String
	var template: TemplateSpec
	var project: ProjectSpec
	var schema: SchemaSpec
	var verbose: Bool
	var deprecationReport: AbsolutePath? = nil
	var shouldOverwriteReport: Bool = false
}

public struct IsolatedConfig {
	var filesLocation: String
	var sharedElementsDestination: String
	var template: TemplateSpec
	var project: ProjectSpec
	var schema: SchemaSpec
	var verbose: Bool
	var deprecationReport: AbsolutePath? = nil
	var shouldOverwriteReport: Bool = false
}
