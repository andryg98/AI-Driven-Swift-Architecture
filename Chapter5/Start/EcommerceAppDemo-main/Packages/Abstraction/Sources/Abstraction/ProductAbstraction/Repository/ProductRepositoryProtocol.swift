import Foundation

public protocol ProductRepositoryProtocol: Sendable {

    func fetchAll() async throws -> [ProductDomainModelProtocol]
}
