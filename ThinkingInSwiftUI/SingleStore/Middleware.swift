import Foundation

protocol Middleware {
    func perform(store: Store, action: Action);
}


