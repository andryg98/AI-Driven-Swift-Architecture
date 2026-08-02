import Foundation

import API

public struct BasketService: Sendable {

    private let apiProvider: APIProviderProtocol

    init() {
        self.apiProvider = APIProvider()
    }

    public func addProduct(
        userID: UUID,
        productId: UUID,
        quantity: Int
    ) async throws {

        _ = try await apiProvider.perform(
            BasketAPI.addProduct(
                userID: userID,
                productId: productId,
                quantity: quantity
            )
        )
    }

    func getBasket(userID: UUID) async throws -> [BasketItemDTO] {

        let response = try await apiProvider.perform(BasketAPI.getBasket(userID: userID))
        return try response.decode([BasketItemDTO].self)
    }
}

