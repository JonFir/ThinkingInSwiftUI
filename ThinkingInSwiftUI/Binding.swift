import SwiftUI

extension Binding {
    
    init(_ get: @escaping @autoclosure () -> Value, _ set: @escaping (Value) -> Void) {
        self = .init(get: get, set: set)
    }
    
}
