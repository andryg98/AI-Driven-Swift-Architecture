import Foundation

import UserAbstraction
import API

public struct UserService: Sendable {

    private let apiProvider: APIProviderProtocol

    init() {
        self.apiProvider = APIProvider()
    }

    func addUser(user: UserDomainModelProtocol) async throws -> UserDTO {

        let userRequestBody = UserDTO(
            id: user.id,
            userName: user.userName
        )

        let response = try await apiProvider.perform(
            UserServiceAPI.addUser(user: userRequestBody)
        )
        return try response.decode(UserDTO.self)
    }
}

