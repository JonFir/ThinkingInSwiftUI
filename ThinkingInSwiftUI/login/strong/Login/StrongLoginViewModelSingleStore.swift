import Foundation


final class StrongLoginViewModelSingleStore: StrongLoginViewModel {
    private let store: Store
    
    @Published var login = ""
    @Published var password = ""
    
    var isValid: Bool { login.count > 2 && password.count > 5 }
    
    init(store: Store) {
        self.store = store
    }
    
    func onAuth() {
        store.dispatch(.startAuth(login, password))
    }
    
}
