//
//  AlohaController.swift
//  
//
//  Created by hengyu on 2021/2/13.
//

import Vapor

struct AlohaController: RouteCollection {
    private static let name: PathComponent = "aloha"

    func boot(routes: RoutesBuilder) throws {
        let chessbot = routes.grouped(AlohaController.name)
        chessbot.get("handshake", use: handshake(request:))
        chessbot.get("systemDate", use: systemDate(request:))
    }

    private func handshake(request: Request) throws -> String {
        "Hello, world!"
    }

    private func systemDate(request: Request) throws -> String {
        Date().description(with: .current)
    }
}
