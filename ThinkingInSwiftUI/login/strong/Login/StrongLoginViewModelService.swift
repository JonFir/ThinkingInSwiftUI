import Foundation
import Combine

final class StrongLoginViewModelService: StrongLoginViewModel {
    private let service: AuthService
    
    @Published var login = ""
    @Published var password = ""
    
    var isValid: Bool { login.count > 2 && password.count > 5 }
    
    init(service: AuthService) {
        self.service = service
    }
    
    func onAuth() {
        service.auth(login: login, password: password)
    }
    
}
