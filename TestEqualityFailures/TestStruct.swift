//
//  TestStruct.swift
//  TestEqualityFailures
//
//  Created by Jon Duenas on 6/18/23.
//

import Foundation

struct TestStruct: Equatable {
    internal init(foo: Double, bar: Double) {
        self.foo = foo
        self.bar = bar
    }

    var foo: Double
    var bar: Double
}

extension TestStruct: Codable {
    enum CodingKeys: CodingKey {
        case foo, bar
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.foo = try container.decode(Double.self, forKey: .foo)
        self.bar = try container.decode(Double.self, forKey: .bar)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(foo, forKey: .foo)
        try container.encode(bar, forKey: .bar)
    }
}

extension TestStruct: RawRepresentable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode(TestStruct.self, from: data) else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8) else {
            return "[]"
        }
        return result
    }
}
