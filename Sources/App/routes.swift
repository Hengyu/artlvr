import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: AlohaController())
    try app.register(collection: ChessBotController())
}
