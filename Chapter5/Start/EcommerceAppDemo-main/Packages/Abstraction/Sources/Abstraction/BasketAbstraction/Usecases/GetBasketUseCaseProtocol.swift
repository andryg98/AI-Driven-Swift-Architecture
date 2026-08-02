import Foundation

public protocol GetBasketUseCaseProtocol: Sendable {

    func start(userID: UUID) async throws -> [BasketDomainModelProtocol]
}
