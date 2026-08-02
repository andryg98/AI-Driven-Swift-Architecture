import Foundation

import UserAbstraction

public struct UserRepository: UserRepositoryProtocol {

    private var userService: UserService

    public init(userService: UserService) {
        self.userService = userService
    }

    public func addUser(username: String) async throws -> UserDomainModelProtocol {

        let user = UserDomainModel(id: UUID(), userName: username)

        let dto = try await userService.addUser(user: user)
        return UserDomainModel(
            id: dto.id,
            userName: dto.userName
        )
    }

}
