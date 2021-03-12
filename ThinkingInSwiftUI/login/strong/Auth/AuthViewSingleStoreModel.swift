import Foundation

final class AuthViewSingleStoreModel: AuthViewModel {
    private let store: Store
    
    @Published var isProcess: Bool
    
    init(store: Store) {
        self.store = store
        self.isProcess = store.state.value.session.authFlow.isInProgress
        store.state
            .map { $0.session.authFlow.isInProgress }
            .removeDuplicates()
            .assign(to: &$isProcess)
    }
    
}
