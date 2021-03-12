import Foundation

protocol CurrentLocationViewModel: ObservableObject {
    var location: String { get }
    
    func save()
}
