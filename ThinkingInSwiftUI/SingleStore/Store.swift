import Combine
import Foundation

class Store {
    let state: CurrentValueSubject<GlobalState, Never>
    
    private let middlewaries: [Middleware]
    private let reducers: [Reducer]
    private let queue = DispatchQueue(label: "store", qos: .default)
    
    init(
        state: GlobalState,
        middlewaries: [Middleware],
        reducers: [Reducer]
    ) {
        self.middlewaries = middlewaries
        self.reducers = reducers
        self.state = CurrentValueSubject<GlobalState, Never>(state)
    }
    
    func dispatch(_ action: Action) {
        queue.async {
            var state = self.state.value
            self.reducers.forEach { state = $0(state, action) }
            self.middlewaries.forEach { $0.perform(store: self, action: action) }
            DispatchQueue.main.async {
                self.state.value = state
            }
        }
    }
    
}
