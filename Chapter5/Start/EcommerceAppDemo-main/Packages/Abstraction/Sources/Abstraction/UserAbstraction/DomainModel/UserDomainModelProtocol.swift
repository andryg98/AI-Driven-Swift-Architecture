import Foundation

public protocol UserDomainModelProtocol: Sendable {
    
    var id: UUID { get }
    
    var userName: String { get }
}
