import XCTest

extension SwiftTests {
    static let __allTests = [
        ("testKotlinGeneratedFiles", testKotlinGeneratedFiles),
        ("testSwiftGeneratedFiles", testSwiftGeneratedFiles),
        ("testKotlinGeneratedFilesFromFiles", testKotlinGeneratedFilesFromFiles),
        ("testSwiftGeneratedFilesFromFiles", testSwiftGeneratedFilesFromFiles)
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwiftTests.__allTests),
    ]
}
#endif
