import SwiftUI

struct SpyNavigationLink<Destination> : View where Destination : View {
    private let label: String
    private let destination: Destination
    private let onChangeActive: (Bool) -> Void
    
    @State private var isActive = false
    
    init(_ label: String, _ destination: Destination, _ onChangeActive: @escaping (Bool) -> Void) {
        self.label = label
        self.destination = destination
        self.onChangeActive = onChangeActive
    }
    
    var body: some View {
        NavigationLink(
            destination: destination,
            isActive: .init(
                isActive,
                {
                    if (self.isActive != $0) {
                        onChangeActive($0)
                        self.isActive = $0
                    }
                }
            ),
            label: { Text(label) }
        )
    }
}
