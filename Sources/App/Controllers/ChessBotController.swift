//
//  ChessBotController.swift
//  
//
//  Created by hengyu on 2021/2/8.
//

import Vapor

struct ChessBotController: RouteCollection {

    private static let name: PathComponent = "chessbot"

    func boot(routes: RoutesBuilder) throws {
        let chessbot = routes.grouped(ChessBotController.name)
        try chessbot.register(collection: ChessBotReleaseController())
    }
}
