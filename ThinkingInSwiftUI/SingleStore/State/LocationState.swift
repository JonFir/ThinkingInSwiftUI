import Foundation

class LocationState {
    var currentLocation: CLLocation?
    var savedLocations: [CLLocation] = []
    
    static func reducer(state: GlobalState, action: Action) -> GlobalState {
        switch action {
        case .newLocationReceived(let location):
            state.locationState.currentLocation = location
            return state
        case .saveLocation(let location):
            state.locationState.savedLocations.append(location)
            return state
        case .saveCurrentLocation:
            if let location = state.locationState.currentLocation {
                state.locationState.savedLocations.append(location)
            }
            return state
        case .deleteLocations(let locations):
            let locations = Set(locations)
            state.locationState.savedLocations = state.locationState.savedLocations.filter { !locations.contains($0) }
            return state
        default:
            return state
        }
    }
}
