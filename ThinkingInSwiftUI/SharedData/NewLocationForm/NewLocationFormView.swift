import SwiftUI

class EventTestModel: ObservableObject {
    @Published var TestValue = "йцуйцуйцуйцуйцу"

    init() {
        print("EventTestModel init")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.TestValue = "1231232"
        }
    }

    deinit {
        print("EventTestModel deinit")
    }
}

struct EventTestView: View {
    @StateObject var model = EventTestModel()

    init() {
        print("EventTestView init")
    }

    var body: some View {
        Text(model.TestValue)
    }
}

struct NewLocationFormView<ViewModel: NewLocationFormViewModel>: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        VStack {
            if (model.latitude.count < 10) {
                EventTestView()
            }
            TextField("Latitude", text: $model.latitude)
            TextField("Longitude", text: $model.longitude)
            Button(
                "Submit",
                action: {
                    model.save()
                    self.presentationMode.wrappedValue.dismiss()
                }
            ).disabled(!model.isValid)
        }
        .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
    }
}

struct NewLocationFormView_Previews: PreviewProvider {
    static var previews: some View {
        NewLocationFormView<NewLocationFormViewModelMock>()
            .environmentObject(NewLocationFormViewModelMock())
    }
}
