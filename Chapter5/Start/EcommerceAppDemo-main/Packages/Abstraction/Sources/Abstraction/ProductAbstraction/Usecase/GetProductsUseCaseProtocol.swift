import Foundation

public protocol GetProductsUseCaseProtocol: Sendable {

    func start() async throws -> [ProductDomainModelProtocol]
}
