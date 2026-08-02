import Foundation

import API
import ProductAbstraction

public struct ProductService: Sendable {

    private let apiProvider: APIProviderProtocol

    init() {
        self.apiProvider = APIProvider()
    }

    func getProducts() async throws -> [ProductDTO] {

        let response = try await apiProvider.perform(ProductAPI.getProducts)
        return try response.decode([ProductDTO].self)
    }
}

