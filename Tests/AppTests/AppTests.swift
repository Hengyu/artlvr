@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    func testAlohaHandshake() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)

        try app.test(.GET, "aloha/handshake", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "Hello, world!")
        })
    }

    static var allTests = [
        ("testAlohaHandshake", testAlohaHandshake)
    ]
}
