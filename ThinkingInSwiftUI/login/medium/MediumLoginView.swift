import SwiftUI

struct MediumLoginView: View {
    
    @StateObject var model = MediumLoginViewModel()
    
    var body: some View {
        if model.isProcess {
            ProgressView()
        } else {
            VStack {
                TextField("Login", text: $model.login)
                TextField("Password", text: $model.password)
                Button("Submit", action: model.onAuth).disabled(!model.isValid)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
        }
    }
}

struct MediumLoginView_Previews: PreviewProvider {
    static var previews: some View {
        MediumLoginView()
    }
}
