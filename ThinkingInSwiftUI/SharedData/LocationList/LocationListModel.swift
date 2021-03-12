import Foundation

protocol LocationListModel: ObservableObject {
    var locations: [String] { get }
    
    func onDelete(at offsets: IndexSet)
}
