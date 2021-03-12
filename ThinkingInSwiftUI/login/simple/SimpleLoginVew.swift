import SwiftUI

struct SimpleLoginVew: View {
    
    @State var login = ""
    @State var password = ""
    @State var isProcess = false
    
    var isValid: Bool { login.count > 2 && password.count > 5 }
    
    func onAuth() {
        isProcess = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isProcess = false
        }
    }
    
    var body: some View {
        if isProcess {
            ProgressView()
        } else {
            VStack {
                TextField("Login", text: $login)
                TextField("Password", text: $password)
                Button("Submit", action: onAuth).disabled(!isValid)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
        }
    }
}

struct SimpleLoginVew_Previews: PreviewProvider {
    static var previews: some View {
        SimpleLoginVew()
    }
}
