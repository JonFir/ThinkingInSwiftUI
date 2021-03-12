import Foundation

final class CurrentLocationViewModelMock: CurrentLocationViewModel {
    var location: String
    
    init(location: String) {
        self.location = location
    }
    
    var save_pressedCount = 0
    func save() {
        save_pressedCount += 1
    }
    
    
}
