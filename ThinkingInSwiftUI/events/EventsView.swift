import SwiftUI

final class ModelA: ObservableObject {
    @Published var textB = ""
    
    init() {
        print("ModelA init")
    }
    
    deinit {
        print("ModelA deinit")
    }
}

final class ModelC: ObservableObject {
    
    init() {
        print("ModelC init")
    }
    
    deinit {
        print("ModelC deinit")
    }
    
}

struct EventsView: View {
    @State var textA = ""
    @StateObject var modelA = ModelA()
    @EnvironmentObject var modelC: ModelC
    
    @State var isShowViewB = true
    @State var isPresentViewB = true
    
    init() {
        print("Top view init")
    }
    
    var body: some View {
        print("Top view body")
        return List {
            TextField("text a", text: $textA)
            TextField("text b", text: $modelA.textB)
            if isPresentViewB {
                ViewB().frame(height: isShowViewB ? nil : 0)
            }
            Button(isShowViewB ? "hide ViewB" : "show ViewB", action: { isShowViewB.toggle() })
            Button(isPresentViewB ? "remove ViewB" : "add ViewB", action: { isPresentViewB.toggle() })
        }.onAppear(perform: { print("Top view onAppear") })
    }
}

final class ModelB: ObservableObject {
    @Published var textC = ""
    
    init() {
        print("ModelB init")
    }
    
    deinit {
        print("ModelB deinit")
    }
}

struct ViewB: View {
    
    @StateObject var modelB = ModelB()
    
    init() {
        print("ViewB init")
    }
    
    var body: some View {
        print("ViewB body")
        return List {
            TextField("text c", text: $modelB.textC)
        }.onAppear(perform: { print("ViewB onAppear") })
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
