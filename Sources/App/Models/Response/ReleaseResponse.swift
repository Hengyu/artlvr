//
//  ReleaseResponse.swift
//  
//
//  Created by hengyu on 2021/2/9.
//

import SwiftRelease
import Vapor

public struct ReleaseResponse: Codable, Equatable, Hashable {

    private enum CodingKeys: CodingKey {
        case release
    }

    public let release: Release?

    public init(release: Release?) {
        self.release = release
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let release = try container.decodeIfPresent(Release.self, forKey: .release)
        self.release = release
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if let release = release {
            try container.encode(release, forKey: .release)
        } else {
            try container.encodeNil(forKey: .release)
        }
    }
}

extension ReleaseResponse: Content {
    public static var defaultContentType: HTTPMediaType {
        .json
    }
}
