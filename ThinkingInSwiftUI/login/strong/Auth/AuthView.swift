import SwiftUI

struct AuthView<ViewModel: AuthViewModel, LoginViewModel: StrongLoginViewModel>: View {
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        if model.isProcess {
            ProgressView()
        } else {
            StrongLoginView<LoginViewModel>()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView<AuthViewSingleMockModel, StrongLoginViewMockModel>()
            .environmentObject(AuthViewSingleMockModel(isProcess: false))
            .environmentObject(StrongLoginViewMockModel())
    }
}
