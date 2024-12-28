import SwiftUI

struct GridContainer<Content: View>: View {
    let content: Content
    var gridView: GridView
    init(gridView: GridView, @ViewBuilder content: () -> Content) {
        self.gridView = gridView
        self.content = content()
    }
    var body: some View {
        ZStack {
            content
                .opacity(0.2)
            gridView
        }
    }
}
#Preview {
   let gridView = GridView(size: GridSize(), style: GridStyle())
   GridContainer(gridView: gridView) {
      VStack {
         Text("TitleText")
         Text("DescriptionText")
      }
   }
}
