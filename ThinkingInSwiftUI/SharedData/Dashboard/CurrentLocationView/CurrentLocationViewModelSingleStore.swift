import Foundation

final class CurrentLocationViewModelSingleStore: CurrentLocationViewModel {
    private let store: Store
    
    @Published var location: String
    
    init(store: Store) {
        self.store = store
        self.location = store.state.value.locationState.currentLocation.map(Self.makeLocationFromLocation) ?? ""
        
        store.state
            .compactMap { $0.locationState.currentLocation }
            .map(Self.makeLocationFromLocation)
            .removeDuplicates()
            .assign(to: &$location)
    }
    
    func save() {
        store.dispatch(.saveCurrentLocation)
    }
    
    static private func makeLocationFromLocation(_ location: CLLocation) -> String {
        "S:\(location.speed) C: \(location.coordinate.longitude) | \(location.coordinate.latitude)"
    }
    
    
}
