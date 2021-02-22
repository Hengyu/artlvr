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
            version: .init(3, 6, 0),
            platform: .init(platform: .macOS, version: .init(stringLiteral: "11.0"))
        )

        public static var latestProduction: TypedRelease = TypedRelease.production(
            version: .init(3, 5, 0),
            platform: .init(platform: .macOS, version: .init(stringLiteral: "10.15"))
        )

        /// Alpha
        public static let v3_6: Release = .init(
            version: .init(3, 6, 0),
            platform: .init(platform: .macOS, version: .init(stringLiteral: "11.0")),
            url: URL(string: "https://apps.apple.com/us/app/id1065334169")!,
            latestProduction: latestProduction
        )

        /// In App Store. The latest version of ChessBot 3.x, for macOS 11.0+.
        public static let v3_5: Release = .init(
            version: .init(3, 5, 0),
            platform: .init(platform: .macOS, version: .init(stringLiteral: "11.0")),
            url: URL(string: "https://apps.apple.com/us/app/id1065334169")!,
            latestProduction: latestProduction
        )

        /// In App Store. The latest version of ChessBot 2.x, for macOS 10.15+.
        /// Make the `URL` point to the `.v3_5` as a temp fix for the design flaws between native and backend.
        public static let v2_4: Release = .init(
            version: .init(2, 4, 0),
            platform: .init(platform: .macOS, version: .init(stringLiteral: "10.15")),
            url: URL(string: "https://apps.apple.com/us/app/id1065334169")!,
            latestProduction: latestProduction
        )

        public static let v2_3: Release = .init(
            version: .init(2, 3, 0),
            platform: .init(platform: .macOS, version: .init(stringLiteral: "10.15")),
            url: URL(string: "https://apps.apple.com/us/app/id1481168175")!,
            latestProduction: latestProduction
        )

        public static func getRelease(_ version: Version) -> Release? {
            switch version.description {
            case "3.6.0": return Catalyst.v3_6
            case "3.5.0": return Catalyst.v3_5
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
