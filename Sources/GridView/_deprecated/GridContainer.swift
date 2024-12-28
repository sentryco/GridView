import SwiftUI

struct GridContainer<Content: View>: View {
    let content: Content
    var gridView: GrdView
    init(gridView: GrdView, @ViewBuilder content: () -> Content) {
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
   let gridView = GrdView(size: GrdSize(), style: GrdStyle())
   GridContainer(gridView: gridView) {
      VStack {
         Text("TitleText")
         Text("DescriptionText")
      }
   }
}
