import Foundation

final class AuthMiddleware: Middleware {

    func perform(store: Store, action: Action) {
        switch action {
        case let .startAuth(login, password):
            auth(login: login, password: password, store: store)
        default:
            break
        }
        
    }
    
    private func auth(login: String, password: String, store: Store) {
        print(login, password)
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            store.dispatch(.successAuth("TOKEN_TOKEN_TOKEN"))
        }
    }
    
}
