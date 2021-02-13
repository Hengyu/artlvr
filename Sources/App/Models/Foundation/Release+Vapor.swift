//
//  Release+Vapor.swift
//  
//
//  Created by hengyu on 2021/2/8.
//

import SwiftRelease
import Vapor

extension Release: Content {

    public static var defaultContentType: HTTPMediaType {
        .json
    }
}
