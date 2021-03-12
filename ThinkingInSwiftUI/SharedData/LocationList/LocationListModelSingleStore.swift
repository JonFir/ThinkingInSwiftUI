import Foundation

final class LocationListModelSingleStore: LocationListModel {
    private let store: Store
    
    @Published var locations: [String]
    
    init(store: Store) {
        self.store = store
        self.locations = store.state.value.locationState.savedLocations.map(Self.makeLocationFromLocation)
        
        store.state
            .compactMap { $0.locationState.savedLocations }
            .map { $0.map(Self.makeLocationFromLocation) }
            .removeDuplicates()
            .assign(to: &$locations)
    }
    
    func onDelete(at offsets: IndexSet) {
        let locations = offsets.map {  store.state.value.locationState.savedLocations[$0] }
        store.dispatch(.deleteLocations(locations))
    }
    
    static private func makeLocationFromLocation(_ location: CLLocation) -> String {
        "S:\(location.speed) C: \(location.coordinate.longitude) | \(location.coordinate.latitude)"
    }
    
}
