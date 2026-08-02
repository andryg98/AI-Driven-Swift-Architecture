import Foundation
import Combine

import BasketAbstraction
import DIAbstraction

@MainActor
public final class BasketViewModel: ObservableObject {

    @Published var baskets: [BasketDomainModelProtocol] = []

    private let getBasketUseCase: GetBasketUseCaseProtocol

    public init() {

        self.getBasketUseCase = DIContainer.shared.resolve(GetBasketUseCaseProtocol.self)!

    }

    func getBasket(userId: UUID) {

        Task { @MainActor in
            do {
                self.baskets = try await getBasketUseCase.start(userID: userId)
            } catch {
                print("⚠️ [BasketViewModel.getBasket] failed: \(error)")
            }
        }

    }

    func calculateTotalPrice() -> Double {
         return baskets.reduce(0) { result, item in
            result + (item.price * Double(item.quantity))
        }
    }
}
