//
//  TestEqualityFailuresTests.swift
//  TestEqualityFailuresTests
//
//  Created by Jon Duenas on 6/18/23.
//

import XCTest
@testable import TestEqualityFailures

final class TestEqualityFailuresTests: XCTestCase {
    var testModelClass: TestModelClass!

    override func setUpWithError() throws {
        try super.setUpWithError()
        UserDefaults.standard.removeObject(forKey: "testStruct")
        testModelClass = TestModelClass()
        XCTAssertEqual(testModelClass.testStruct, TestStruct(foo: 1.0, bar: 15.0))
    }

    override func tearDownWithError() throws {
        testModelClass = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        let expectedStruct = TestStruct(foo: 1.0, bar: 16.0)
        testModelClass.mutateTestStruct()
        XCTAssertEqual(testModelClass.testStruct, expectedStruct)
    }
}
