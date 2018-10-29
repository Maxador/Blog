//
//  Application+Testable.swift
//  App
//
//  Created by Maxime Mongeau on 2018-10-27.
//

//@testable import App
import Vapor
import Foundation

extension Application {
    static func testable() throws -> Application {
        var config = Config.default()
        var services = Services.default()
        var env = Environment.testing
        try App.configure(&config, &env, &services)
        let app = try Application(config: config, environment: env, services: services)
        try App.boot(app)

        return app
    }

    func sendRequest(to path: String, method: HTTPMethod = .GET, headers: HTTPHeaders = .init()) throws -> Response {
        let httpRequest = HTTPRequest(method: method, url: path)
        let wrappedRequest = Request(http: httpRequest, using: self)
        let responder = try make(Responder.self)

        return try responder.respond(to: wrappedRequest).wait()
    }
}
