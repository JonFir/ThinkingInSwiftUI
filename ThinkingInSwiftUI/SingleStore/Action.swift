enum Action {
    case startAuth(_ login: String, _ password: String)
    case successAuth(_ token: String)
    case failAuth(_ error: String)
    
    case intoDashboardFlow
    case leaveDashboardFlow
    case newLocationReceived(CLLocation)
    case saveLocation(CLLocation)
    case saveCurrentLocation
    case deleteLocations([CLLocation])
}
