import FluentSQLite
import Vapor

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    if env == .development {
        #if os(Linux)
        services.register(Server.self) { container -> EngineServer in
            var serverConfig = try container.make() as EngineServerConfig
            serverConfig.hostname = "0.0.0.0"

            return EngineServer(config: serverConfig, container: container)
        }
        #endif
    }
    /// Register providers first
    try services.register(FluentSQLiteProvider())

    /// Register routes to the router
    services.register(Router.self) { container -> EngineRouter in
        let router = EngineRouter.default()
        try routes(router, container)
        return router
    }

    services.register { container -> PostService in
        return PostService()
    }

    /// Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    /// middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)

    // Configure a SQLite database
    let sqlite = try SQLiteDatabase(storage: .memory)

    /// Register the configured SQLite database to the database config.
    var databases = DatabasesConfig()
    databases.add(database: sqlite, as: .sqlite)
    services.register(databases)

    /// Configure migrations
    var migrations = MigrationConfig()
    services.register(migrations)

}
