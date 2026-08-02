import Foundation
import Combine

import UserAbstraction
import DIAbstraction

@MainActor
public final class LoginViewModel: ObservableObject {

    @Published public var userID: UUID?

    @Published public var isConnected: Bool = false

    private let loginUserUseCase: LoginUserUseCaseProtocol

    public init() {

        self.loginUserUseCase = DIContainer.shared.resolve(LoginUserUseCaseProtocol.self)!

    }

    func login(username: String) {

        Task { @MainActor in
            do {
                let user = try await loginUserUseCase.start(username: username)
                self.userID = user.id
                self.isConnected = !user.id.uuidString.isEmpty
            } catch {
                print("⚠️ [LoginViewModel.login] failed: \(error)")
            }
        }

    }

}
