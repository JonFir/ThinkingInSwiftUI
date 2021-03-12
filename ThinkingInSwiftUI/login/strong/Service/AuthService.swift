import Foundation
import Combine

final class AuthService {
    
    let state = CurrentValueSubject<State, Never>(State.initial)
    
    func auth(login: String, password: String) {
        state.value = state.value.with(isProcess: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.state.value = self.state.value
                .with(isProcess: false)
                .with(token: "TOKEN_TOKEN_TOKEN")
        }
    }
    
}


extension AuthService {
    
    struct State {
        let isProcess: Bool
        let token: String?
        let error: String?
        
        static let initial = State(isProcess: false, token: nil, error: nil)
        
        func with(isProcess: Bool) -> State {
            State(isProcess: isProcess, token: token, error: error)
        }
        
        func with(token: String?) -> State {
            State(isProcess: isProcess, token: token, error: error)
        }
        
        func with(error: String?) -> State {
            State(isProcess: isProcess, token: token, error: error)
        }
    }
    
}
