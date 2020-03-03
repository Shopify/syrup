import XCTest

extension SwiftTests {
    static let __allTests = [
        ("testKotlinGeneratedFiles", testKotlinGeneratedFiles),
        ("testSwiftGeneratedFiles", testSwiftGeneratedFiles),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwiftTests.__allTests),
    ]
}
#endif

