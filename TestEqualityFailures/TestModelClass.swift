//
//  TestModelClass.swift
//  TestEqualityFailures
//
//  Created by Jon Duenas on 6/18/23.
//

import Foundation
import SwiftUI

class TestModelClass {
    @AppStorage("testStruct") var testStruct = TestStruct(foo: 1.0, bar: 15.0)

    func mutateTestStruct() {
        testStruct.bar += 1
    }
}
