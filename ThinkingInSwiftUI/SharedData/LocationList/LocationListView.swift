import SwiftUI

struct LocationListView<ViewModel: LocationListModel>: View {
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        List {
            ForEach(model.locations.indices, id: \.self) { index in
                Text(model.locations[index])
                    
            }.onDelete(perform: model.onDelete)
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    
    static var previews: some View {
        LocationListView<LocationListModelMock>()
            .environmentObject(LocationListModelMock())
    }
}
