//
//  ChessBotReleaseManager.swift
//  
//
//  Created by hengyu on 2021/2/9.
//

// swiftlint:disable identifier_name

import Foundation
import SwiftRelease

public struct ChessBotReleaseManager {

    public enum Catalyst {
        public static var latestBeta: TypedRelease = TypedRelease.beta(
            version: .init(3, 0, 0),
            platform: .init(platform: .macOS, version: .init(stringLiteral: "11.0"))
        )

        public static var latestProduction: TypedRelease = TypedRelease.production(
            version: .init(2, 4, 0),
            platform: .init(platform: .macOS, version: .init(stringLiteral: "10.15"))
        )

        /// Not submitted to App Store yet.
        public static let v3_0: Release = .init(
            version: .init(3, 0, 0),
            platform: .init(platform: .macOS, version: .init(stringLiteral: "11.0")),
            url: URL(string: "https://apps.apple.com/us/app/id1065334169")!,
            latestProduction: latestProduction
        )

        /// Pending review.
        public static let v2_4: Release = .init(
            version: .init(2, 4, 0),
            platform: .init(platform: .macOS, version: .init(stringLiteral: "10.15")),
            url: URL(string: "https://apps.apple.com/us/app/id1481168175")!,
            latestProduction: latestProduction
        )

        /// In App Store.
        public static let v2_3: Release = .init(
            version: .init(2, 3, 0),
            platform: .init(platform: .macOS, version: .init(stringLiteral: "10.15")),
            url: URL(string: "https://apps.apple.com/us/app/id1481168175")!,
            latestProduction: latestProduction
        )

        public static func getRelease(_ version: Version) -> Release? {
            switch version.description {
            case "3.0.0": return Catalyst.v3_0
            case "2.4.0": return Catalyst.v2_4
            case "2.3.0": return Catalyst.v2_3
            default: return nil
            }
        }
    }

    static func getRelease(_ version: Version, in platform: Platform) -> Release? {
        switch platform {
        case .macOS: return Catalyst.getRelease(version)
        default: return nil
        }
    }
}
