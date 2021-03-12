import Foundation

final class LocationListModelMock: LocationListModel {
    static private let locations = [
        "S:5.65 C: 34.5565 | 65.666",
        "S:3.65 C: 34.5565 | 65.666",
        "S:5.65 C: 34.5565 | 65.666",
        "S:5.15 C: 34.5565 | 65.666",
        "S:4.27 C: 34.5565 | 65.666",
        "S:5.65 C: 34.5565 | 65.666",
        "S:5.65 C: 34.5565 | 65.666",
        "S:5.65 C: 34.5565 | 65.666",
        "S:5.65 C: 34.5565 | 65.666",
        "S:5.65 C: 34.5565 | 65.666",
        "S:5.65 C: 34.5565 | 65.666",
        "S:5.65 C: 34.5565 | 65.666",
        "S:5.65 C: 34.5565 | 65.666",
        "S:5.65 C: 34.5565 | 65.666",
        "S:5.65 C: 34.5565 | 65.666",
        "S:5.65 C: 34.5565 | 65.666",
    ]
    
    var locations: [String]
    
    init(locations: [String]) {
        self.locations = locations
    }
    
    convenience init() {
        self.init(locations: Self.locations)
    }
    
    var onDelete_pressedCount = 0
    var onDelete_args = [IndexSet]()
    func onDelete(at offsets: IndexSet) {
        onDelete_pressedCount += 1
        onDelete_args.append(offsets)
    }
    
}
