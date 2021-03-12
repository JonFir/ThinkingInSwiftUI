import Foundation

final class MediumLoginViewModel: ObservableObject {
    
    @Published var login = ""
    @Published var password = ""
    @Published var isProcess = false
    
    var isValid: Bool { login.count > 2 && password.count > 5 }
    
    func onAuth() {
        isProcess = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isProcess = false
        }
    }
    
}
