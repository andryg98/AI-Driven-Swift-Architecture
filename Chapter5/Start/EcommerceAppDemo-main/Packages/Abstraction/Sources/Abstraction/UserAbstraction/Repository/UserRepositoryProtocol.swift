import Foundation

public protocol UserRepositoryProtocol: Sendable {

    func addUser(username: String) async throws -> UserDomainModelProtocol
}
