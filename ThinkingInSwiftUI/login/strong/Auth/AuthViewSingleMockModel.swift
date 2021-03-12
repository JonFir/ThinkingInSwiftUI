import Foundation

final class AuthViewSingleMockModel: AuthViewModel {
    let isProcess: Bool
    
    init(isProcess: Bool) {
        self.isProcess = isProcess
    }
}
