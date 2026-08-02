import Foundation
import Combine
import ProductAbstraction
import BasketAbstraction
import AnalyticsAbstraction
import DIAbstraction

@MainActor
final class ItemDetailViewModel: ObservableObject {

    @Published var product: ProductDomainModelProtocol

    @Published var quantity: Int = 1

    private let addProductUseCase: AddProductUseCaseProtocol
    private let sendProductDetailAnalyticsDataUseCase: SendProductDetailAnalyticsDataUsecaseProtocol


    private let userId: UUID

    init(
        product: ProductDomainModelProtocol,
        userId: UUID
    ) {

        self.product = product

        self.userId = userId

        addProductUseCase = DIContainer.shared.resolve(AddProductUseCaseProtocol.self)!

        sendProductDetailAnalyticsDataUseCase = DIContainer.shared.resolve(SendProductDetailAnalyticsDataUsecaseProtocol.self)!

    }

    func addProduct() {

        Task { @MainActor in
            do {
                try await addProductUseCase.start(
                    userID: userId,
                    productId: product.id,
                    quantity: quantity
                )
            } catch {
                print("⚠️ [ItemDetailViewModel.addProduct] failed: \(error)")
            }
        }

        // Add some analytics

        sendProductDetailAnalyticsDataUseCase.start(data: "🚀 product added to basket successfully")

    }

}
