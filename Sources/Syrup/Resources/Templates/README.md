## Template Package Structure

A template folder contains the various Stencil templates to be used during code generation. Each template must also contain a `Template.yml` file that provides information about language specific things.

Currently only `swift` and `kotlin` are supported language types.

The `Template.yml` file needs to follow the structure below:
```yaml
language: swift // The language this template package represents
extension: swift // The file extension
nullString: nil // The string value used to represent null (nil, null, none, etc.)
reservedWords: [] // A list of reserved words that cannot be used directly. When these are encountered they will be properly quoted or mangled.
builtInScalars:
  Int: "" // The the name of the native type to be used when this GraphQL scalar is encountered
  Float: ""
  String: ""
  Boolean: ""
  ID: ""
```
