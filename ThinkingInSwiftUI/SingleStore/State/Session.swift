import Foundation

class Session {
    var authFlow = AuthFlow()
}

class AuthFlow {
    var isInProgress = false
    var token: String?
    var error: String?
    
    static func reducer(state: GlobalState, action: Action) -> GlobalState {
        switch action {
        case .startAuth:
            state.session.authFlow.isInProgress = true
            return state
        case .successAuth(let token):
            state.session.authFlow.isInProgress = false
            state.session.authFlow.token = token
            state.session.authFlow.error = nil
            return state
        case .failAuth(let error):
            state.session.authFlow.isInProgress = false
            state.session.authFlow.token = nil
            state.session.authFlow.error = error
            return state
        default:
            return state
        }
    }
}
