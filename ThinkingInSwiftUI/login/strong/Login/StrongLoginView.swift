import SwiftUI

struct StrongLoginView<ViewModel: StrongLoginViewModel>: View {
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        VStack {
            TextField("Login", text: $model.login)
            TextField("Password", text: $model.password)
            Button("Submit", action: model.onAuth).disabled(!model.isValid)
        }
        .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
    }
}

struct StrongLoginView_Previews: PreviewProvider {
    static var previews: some View {
        StrongLoginView<StrongLoginViewMockModel>()
            .environmentObject(StrongLoginViewMockModel())
    }
}
