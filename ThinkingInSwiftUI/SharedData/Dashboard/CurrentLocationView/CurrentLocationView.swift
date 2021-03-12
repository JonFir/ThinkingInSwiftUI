import SwiftUI

struct CurrentLocationView<ViewModel: CurrentLocationViewModel>: View {
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        return HStack {
            Button(
                action: model.save,
                label: { Image(systemName: "plus.app") }
            )
            Text(model.location)
            Spacer()
        }
    }
}

struct CurrentLocationView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationView<CurrentLocationViewModelMock>()
            .environmentObject(CurrentLocationViewModelMock(location: "S:5.65 C: 34.5565 | 895.666"))
    }
}
