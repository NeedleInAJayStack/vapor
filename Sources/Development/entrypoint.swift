import Vapor
import Logging

@main
struct Entrypoint {
    static func main() async throws {
        var env = try Environment.detect()
        try LoggingSystem.bootstrap(from: &env)

        let app = await Application(env)
        defer { app.shutdown() }

        try configure(app)
        try await app.execute()
    }
}

