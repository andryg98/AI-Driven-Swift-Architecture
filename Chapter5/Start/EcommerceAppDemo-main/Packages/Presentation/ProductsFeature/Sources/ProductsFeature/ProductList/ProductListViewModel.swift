import Foundation
import Combine

import ProductAbstraction
import DIAbstraction

@MainActor
final class ProductsListViewModel: ObservableObject {

    @Published var products: [ProductDomainModelProtocol] = []

    private let getProductsUseCase: GetProductsUseCaseProtocol

    init() {

        self.getProductsUseCase = DIContainer.shared.resolve(GetProductsUseCaseProtocol.self)!

        subscribe()
    }

    private func subscribe() {

        Task { @MainActor in
            do {
                self.products = try await getProductsUseCase.start()
            } catch {
                print("⚠️ [ProductsListViewModel.subscribe] failed: \(error)")
            }
        }

    }
}
