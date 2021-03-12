import SwiftUI

final class ApplicationFactory {
    
    fileprivate let store: Store
    fileprivate var authService: AuthService { AuthService() }
    
    fileprivate var contentViewModel: ContentViewModel {
        ContentViewModel(store: store)
    }
    
    fileprivate var authViewSingleStoreModel: AuthViewSingleStoreModel {
        AuthViewSingleStoreModel(store: store)
    }
    
    fileprivate var strongLoginViewModelSingleStore: StrongLoginViewModelSingleStore {
        StrongLoginViewModelSingleStore(store: store)
    }
    
    fileprivate func authViewModelService(service: AuthService) -> AuthViewModelService {
        AuthViewModelService(service: service)
    }
    
    fileprivate func strongLoginViewModelService(service: AuthService) -> StrongLoginViewModelService {
        StrongLoginViewModelService(service: service)
    }
    
    fileprivate final var currentLocationViewModelSingleStore: CurrentLocationViewModelSingleStore {
        CurrentLocationViewModelSingleStore(store: store)
    }
    
    fileprivate final var locationListModelSingleStore: LocationListModelSingleStore {
        LocationListModelSingleStore(store: store)
    }
    
    fileprivate final var newLocationFormViewModelSingleStore: NewLocationFormViewModelSingleStore {
        NewLocationFormViewModelSingleStore(store: store)
    }
    
    init() {
        self.store = Store(
            state: GlobalState(),
            middlewaries: [
                AuthMiddleware(),
                LocationMiddleware(),
            ],
            reducers: [
                AuthFlow.reducer,
                LocationState.reducer,
            ]
        )
    }
}

let screenViewFactory = ScreenViewFactoryImpl()

final class ScreenViewFactoryImpl {
    
    fileprivate let applicationFactory = ApplicationFactory()
    fileprivate init(){}
    
    func makeContentView() -> some View {
        ContentView()
            .environmentObject(applicationFactory.contentViewModel)
    }

    func makeStrongAuth() -> some View {
//        AuthView<AuthViewSingleStoreModel, StrongLoginViewModelSingleStore>()
//            .environmentObject(applicationFactory.authViewSingleStoreModel)
//            .environmentObject(applicationFactory.strongLoginViewModelSingleStore)
        
        let authService = applicationFactory.authService
        return AuthView<AuthViewModelService, StrongLoginViewModelService>()
            .environmentObject(applicationFactory.authViewModelService(service: authService))
            .environmentObject(applicationFactory.strongLoginViewModelService(service: authService))
    }
    
    func makeDashboardView() -> some View {
        DashboardView<CurrentLocationViewModelSingleStore, LocationListModelSingleStore>()
            .environmentObject(applicationFactory.currentLocationViewModelSingleStore)
            .environmentObject(applicationFactory.locationListModelSingleStore)
    }
    
    func makeNewLocationFormView() -> some View {
        NewLocationFormView<NewLocationFormViewModelSingleStore>()
            .environmentObject(applicationFactory.newLocationFormViewModelSingleStore)
    }

}
