import Vapor
import Fluent
import FluentPostgresDriver
// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.databases.use(.postgres(configuration:
                        SQLPostgresConfiguration(hostname: "localhost", username: "postgres", password:"",
                        database: "conferencesystem",
                        tls: .prefer(try .init(configuration: .clientDefault)))), as: .psql)
    
    app.migrations.add(CreateSession())
    app.migrations.add(CreateAttendee())
    app.migrations.add(CreateSessionAttendee())

    // register routes
    
    try app.register(collection: AttendeeController())
    try app.register(collection: SessionController())
    try app.register(collection: AttendSessionController())
    try routes(app)
}
