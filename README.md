![GitHub Actions status](https://github.com/Shopify/syrup/workflows/Swift/badge.svg) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# Syrup

Syrup generates strongly-typed Swift and Kotlin models based on the GraphQL queries used in your app. It generates client-side types to represent the queries, mutations, and responses that your app relies on.

## Running Syrup
Xcode 9 is required to build this application.

### Running via Command Line:
Build the tool by running:
```bash
$ make
```

This will create an executable for you located at `.build/debug/Syrup`
To run Syrup, simply run the executable from the command line with the required [command](https://github.com/shopify/syrup#commands) and [launch arguments](https://github.com/shopify/syrup#launch-arguments)

### Running via Xcode:
First, create your Xcode project:
```bash
$ make xcode
```

Select the Syrup scheme (Product -> Scheme -> Syrup)

After this, the project should successfully build. To get it to successfully run, you must supply the required [command](https://github.com/shopify/syrup#commands) and [launch arguments](https://github.com/shopify/syrup#launch-arguments) by editing the Syrup target's scheme (Product -> Scheme -> Edit Scheme) and providing them as "Arguments passed on launch" under the Arguments tab.

### Commands
Syrup supports the following commands. The launch arguments of each command are described in more detail under [launch arguments](https://github.com/shopify/syrup#launch-arguments).

#### generate
This will generate the models representing your GraphQL operations as well as the necessary support files.

```bash
$ .build/debug/Syrup generate <Operations Location> <Models Destination> <Support Files Destination> <Template>
```

#### generate-models
This will generate only the models representing your GraphQL operations.

```bash
$ .build/debug/Syrup generate-models <Operations Location> <Models Destination> <Template>
```

#### generate-support-files
This will generate only the support files representing your GraphQL operations.

```bash
$ .build/debug/Syrup generate-support-files <Support Files Destination> <Template>
```

### Launch Arguments
This lists the possible arguments to Syrup. Note that not all launch arguments apply to every command.

#### Applies to generate and generate-models commands
- **Operations Location**: This provides the path to the folder containing all of your graphql operation definitions. These files are expected to have the .graphql suffix and should be valid graphql operations.
- **Models Destination**: This provides the path to the folder where the generated code should be written to.

#### Applies to generate and generate-support-files commands
- **Support Files Destination**: This provides the path to the folder where the support files the generated code relies on should be written to. This is provided as a separate argument from the models destination in the case that your app has multiple frameworks using Syrup and you would like them to all share the same support files.

#### Applies to all commands
- **Template**: This provides the path to the [Templates](https://github.com/Shopify/Syrup/tree/main/Templates) folder that are included in the Syrup repository.
- **`--project`**: The (optional) location of the [YAML file](https://github.com/shopify/syrup#project-file-format) that describes the project. By default, `.syrup.yml` in the current directory is used.
- **`--schema`**: The (optional) location of the [YAML file](https://github.com/shopify/syrup#schema-file-format) that describes the schema. By default, `.syrup.yml` in the current directory is used.
- **`--override-schema`**: An optional argument to override the location of the schema to be used. Can be either a file path or URL.

### Project File Format
The project file provides schema and project specific information. This includes the location of the schema, custom scalar mappings, the module name, access level override, and a suffix that is appended to the generated files.

The Shopify project uses something similar to the following:
```yaml
moduleName: MerchantApi
filenameSuffix: "Next"
header: |
        // Syrup auto-generated file
        import SomeFramework
supportFilesHeader: |
        // Syrup auto-generated support file
accessLevelOverride: "internal" # optional field
generateSelections: true # optional field
```

**moduleName**: This is the namespace under which all generated models will be defined. For example, a module name of `GraphQLApi` will result in all models being defined as `GraphQLApi.ShopNameQuery`, `GraphQLApi.ShopNameResponse` etc.

**header**: This is a block that will be written to the top of every generated model file. It can be used to include some comments as well as any import statements you need. For example, if your support files are written to a different module, you can import them from the header block here.

**supportFilesHeader**: This is similar to the header above, but will be written to the generated support files instead of the generated models.

**acccessLevelOverride**: This is an optional field which allows you to change the access level of the generated code from the default of public. The only other valid option for Swift is "internal".

**generateSelections:**: This is an optional field which generates a data structure representing the selections of every operation. The default value of this is "false".

### Schema File Format
The schema file provides schema specific information. This includes the location of the schema and custom scalar mappings.

The Shopify project uses something similar to the following:
```yaml
location: https://app.shopify.com/services/ping/graphql_schema
customScalars:
- graphType: DateTime
  nativeType: Date
- graphType: Money
  nativeType: Money
- graphType: URL
  nativeType: URL
- graphType: FormattedString
  nativeType: String
- graphType: UnsignedInt64
  nativeType: UInt64
  rawValueType: String
```

**customScalars**:
  - graphType: The typename described in the GraphQL schema.
  - nativeType: The native language type it will be translated/mapped to.
  - rawValueType: The transport or intermediary type that is seen in GraphQL responses. A CustomScalarResolver is required in order to translate to/from the `graphType` to the `nativeType`.

## GraphQL Operation Format
Syrup requires that every graphql operation begins with either `query`, `mutation` or `fragment`, and that all operations and fragments have a name. This name maps to the name of the generated Query and Response objects.
Example:
```graphql
query ShopName {
   shop {
      name
   }
}
```

## Syrup Artifacts
The code generator will create the following types of files:
### Enumerations
This will create a basic swift enumeration that maps to the string values of the corresponding GraphQL type. These enums will only be created if a query references a field of the enum type.

### Input Objects
These represent the data passed in to mutations. They are fully mutable reference types that are generated if a query requires an argument of the input type.

### Queries
These are structs that represent the queries that can be performed in the app. They contain properties for all of the arguments the query requires and can be serialized to the GraphQL format required for the network request.

### Mutations
These are the same as queries, and simply differ by name.

### Responses
These are immutable value types that represent the deserialized response from a query. They conform to swift’s Decodable protocol to facilitate automatic deserializing from JSON response to these strongly typed models.

### Fragments
GraphQL fragments are pieces of queries that can be shared across multiple queries. The code generator will create protocols representing each fragment and will ensure the response objects of all queries that reference a fragment conform to its corresponding protocol.

### Scalar Resolver
The Custom Scalar Resolver file is created to handle any of the custom coded scalars defined in your project file. If your project file specifies no custom coded scalars, you can simply use the BaseCustomScalarResolver file as the `customScalarResolver` property of your module type.

### Module File
In Swift, Syrup will generate all its models as an extension off of a base "module type". In practice, this is represented by an empty enum. All generated models will be namespaced under this module type, which will provide easier autocompletion and will avoid naming collisions with other types in your project. It also serves as the location where the custom JSONDecoder and JSONEncoder's must be provided. It is recommended that users of Syrup define an extension on the module type (in a separate file to avoid Syrup overwriting it) that provides values for the `customEncoder`, `customDecoder`, and the `customScalarResolver` properties. These properties are used in the serialization and deserialization of Syrup models, and your code will not compile without them.

### Support Files
Syrup generates a set of support files based on the GraphQL schema and the custom scalars provided in the project file.

#### GraphApi.swift
The `GraphApi.swift` file contains the base type definitions that generated models rely on. It has definitions for the `GraphApiQuery` and `GraphApiResponse` protocols which serve as the base for every operation and response model.

## Integration

### Gradle

The [Shopify/syrup-gradle](https://github.com/shopify/syrup-gradle) plugin provides Gradle tasks for generating support files and models for multiple schemas.
