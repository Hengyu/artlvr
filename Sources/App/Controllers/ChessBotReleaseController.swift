//
//  ChessBotReleaseController.swift
//  
//
//  Created by hengyu on 2021/2/8.
//

import Vapor

struct ChessBotReleaseController: RouteCollection {

    private static let name: PathComponent = "release"

    func boot(routes: RoutesBuilder) throws {
        let version = routes.grouped(ChessBotReleaseController.name)
        version.get("catalyst", use: catalyst(request:))
    }

    private func catalyst(request: Request) throws -> ReleaseResponse {
        try ReleaseRequest.validate(query: request)
        let typedRequest = try request.query.decode(ReleaseRequest.self)
        request.logger.info("Query for catalyst release with version: \(typedRequest.version.description)")
        return ReleaseResponse(release: ChessBotReleaseManager.getRelease(typedRequest.version, in: .macOS))
    }
}
