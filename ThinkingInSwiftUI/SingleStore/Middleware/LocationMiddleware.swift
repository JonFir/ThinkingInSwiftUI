import Foundation
import CoreLocation

final class LocationMiddleware: NSObject, Middleware {
    let locationManager: CLLocationManager
    private var store: Store?
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
    }
    
    func perform(store: Store, action: Action) {
        switch action {
        case .intoDashboardFlow:
            startUpdateLocation(store: store)
        case .leaveDashboardFlow:
            locationManager.stopUpdatingLocation()
        default:
            break
        }
    }
    
    
    private func startUpdateLocation(store: Store) {
        locationManager.requestWhenInUseAuthorization()
        self.store = store
        locationManager.startUpdatingLocation()
    }
    
    private func stopUpdateLocation() {
        self.store = nil
        locationManager.startUpdatingLocation()
    }
    
}

extension LocationMiddleware: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            store?.dispatch(.newLocationReceived(location))
        }
    }
    
}
