import Foundation

protocol NewLocationFormViewModel: ObservableObject {
    var longitude: String { get set }
    var latitude: String { get set }
    
    var isValid: Bool { get }
    
    func save()
}
