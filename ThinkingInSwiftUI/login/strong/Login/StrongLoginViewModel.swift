import Foundation

protocol StrongLoginViewModel: ObservableObject {
    var login: String { get set }
    var password: String { get set }
    
    var isValid: Bool { get }
    
    func onAuth()
}
