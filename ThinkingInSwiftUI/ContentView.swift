import SwiftUI

final class ContentViewModel: ObservableObject {
    private let store: Store
    
    init(store: Store) {
        self.store = store
    }
    
    func onLinkDashboard(isShow: Bool) {
        if isShow {
            store.dispatch(.intoDashboardFlow)
        } else {
            store.dispatch(.leaveDashboardFlow)
        }
    }
}

struct ContentView: View {
    
    @EnvironmentObject var model: ContentViewModel
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("events", destination: EventsView().environmentObject(ModelC()))
                NavigationLink("simple login", destination: SimpleLoginVew())
                NavigationLink("medium login", destination: MediumLoginView())
                NavigationLink("strong login", destination: screenViewFactory.makeStrongAuth())
                SpyNavigationLink("dashboard", screenViewFactory.makeDashboardView(), model.onLinkDashboard)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
