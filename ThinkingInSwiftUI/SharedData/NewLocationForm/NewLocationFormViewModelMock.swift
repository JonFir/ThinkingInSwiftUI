import Foundation

final class NewLocationFormViewModelMock: NewLocationFormViewModel {
    var longitude: String
    var latitude: String
    
    var isValid: Bool
    
    init(longitude: String, latitude: String, isValid: Bool) {
        self.longitude = longitude
        self.latitude = latitude
        self.isValid = isValid
    }
    
    convenience init() {
        self.init(longitude: "56.007966", latitude: "92.837809", isValid: true)
    }
    
    var save_pressedCount = 0
    func save() {
        save_pressedCount += 1
    }
    
}
