import Foundation

public protocol BasketRepositoryProtocol: Sendable {

    func addProduct(
        userID: UUID,
        productId: UUID,
        quantity: Int
    ) async throws

    func fetchBasket(userID: UUID) async throws -> [BasketDomainModelProtocol]
}
