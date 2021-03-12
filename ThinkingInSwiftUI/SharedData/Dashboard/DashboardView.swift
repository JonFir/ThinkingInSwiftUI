import SwiftUI

struct DashboardView<CLVModel: CurrentLocationViewModel, LLVModel: LocationListModel>: View {
    var body: some View {
        return VStack {
            NavigationLink("Add custom location", destination: screenViewFactory.makeNewLocationFormView())
            CurrentLocationView<CLVModel>().padding()
            Divider()
            LocationListView<LLVModel>()
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView<CurrentLocationViewModelMock, LocationListModelMock>()
            .environmentObject(CurrentLocationViewModelMock(location: "12.213213 & 54.623784"))
            .environmentObject(LocationListModelMock())
    }
}
