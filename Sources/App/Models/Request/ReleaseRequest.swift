//
//  ReleaseRequest.swift
//  
//
//  Created by hengyu on 2021/2/9.
//

import SwiftRelease
import Vapor

public struct ReleaseRequest: Codable, Equatable, Hashable {
    let version: Version
}

extension ReleaseRequest: Content { }

extension ReleaseRequest: Validatable {

    public static func validations(_ validations: inout Validations) {
        validations.add("version", as: String.self, is: .version)
    }
}

extension Validator where T == String {
    /// Validates whether a `String` is a valid email address.
    public static var version: Validator<T> {
        .init {
            guard
                let range = $0.range(of: regex, options: [.regularExpression]),
                range.lowerBound == $0.startIndex && range.upperBound == $0.endIndex
            else {
                return ValidatorResults.Version(isValidVersion: false)
            }
            return ValidatorResults.Version(isValidVersion: true)
        }
    }
}

extension ValidatorResults {
    /// `ValidatorResult` of a validator that validates whether a `String` is a valid version format.
    public struct Version {
        /// The input is a valid version format
        public let isValidVersion: Bool
    }
}

extension ValidatorResults.Version: ValidatorResult {
    public var isFailure: Bool {
        !self.isValidVersion
    }

    public var successDescription: String? {
        "is a valid version format"
    }

    public var failureDescription: String? {
        "is not a valid version format"
    }
}

private let regex: String = "(\\d+\\.)?(\\d+\\.)?(\\*|\\d+)"
