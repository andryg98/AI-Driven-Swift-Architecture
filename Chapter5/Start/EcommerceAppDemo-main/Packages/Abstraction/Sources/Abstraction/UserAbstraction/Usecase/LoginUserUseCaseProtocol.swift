import Foundation

public protocol LoginUserUseCaseProtocol: Sendable {

    func start(username: String) async throws -> UserDomainModelProtocol
}
