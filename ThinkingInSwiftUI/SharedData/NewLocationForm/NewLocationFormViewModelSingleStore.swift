import Foundation

final class NewLocationFormViewModelSingleStore: NewLocationFormViewModel {
    
    private let store: Store
    
    @Published var longitude: String = ""
    @Published var latitude: String = ""
    
    var location: CLLocation? {
        guard let longitude = Double(longitude), let latitude = Double(latitude) else { return nil }
        return CLLocation(latitude: longitude, longitude: latitude)
    }
    
    var isValid: Bool { location != nil }
    
    init(store: Store) {
        self.store = store
    }
    
    func save() {
        guard let location = location else { return }
        store.dispatch(.saveLocation(location))
        longitude.removeAll()
        latitude.removeAll()
    }
    
}
