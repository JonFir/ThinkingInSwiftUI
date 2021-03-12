import Foundation

final class StrongLoginViewMockModel: StrongLoginViewModel {
    var login = "ivan"
    var password = "god"
    var isValid = false
    
    
    var onAuth_pressedCount = 0
    func onAuth() {
        onAuth_pressedCount += 1
    }
    
}
