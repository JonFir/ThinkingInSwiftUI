import Foundation

final class AuthViewModelService: AuthViewModel {
    private let service: AuthService
    
    @Published var isProcess: Bool
    
    init(service: AuthService) {
        self.isProcess = service.state.value.isProcess
        self.service = service
        service.state
            .map { $0.isProcess }
            .removeDuplicates()
            .assign(to: &$isProcess)
    }
}
