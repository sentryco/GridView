import SwiftUI
import HybridColor

extension GridView {
   /**
    * The main view of the GridView.
    * - Note: This view is responsible for rendering the grid by using the `GeometryReader` to provide the necessary size information for drawing vertical and horizontal lines, as well as the insets.
    */
   public var body: some View {
      GeometryReader { geom in
         drawVerticals( // draw vertical lines
            inset: size.inset,
            size: geom.size,
            count: size.verCount,
            innerCount: size.verDivisionCount
         )
         drawHorizontals( // draw horizontal lines
            inset: size.inset,
            size: geom.size,
            count: size.horCount,
            innerCount: size.horDivisionCount
         )
         drawInset(geom: geom) // draw inset
      }
   }
}
