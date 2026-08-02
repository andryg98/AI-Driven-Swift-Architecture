import Foundation

public protocol AddProductUseCaseProtocol: Sendable {

    func start(
        userID: UUID,
        productId: UUID,
        quantity: Int
    ) async throws
}
