import SwiftUI
import HybridColor

extension GridView {
   /**
    * The main view of the GridView.
    * - Note: This view is responsible for rendering the grid by using the `GeometryReader` to provide the necessary size information for drawing vertical and horizontal lines, as well as the insets.
    * - Fixme: ⚠️️ Maybe instead of using geom, we could just use calculated size? or do we need to set frame to be able to draw or something? do some testing?
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
         // - Fixme: ⚠️️ pass geom.size for the bellow
         drawInset(geom: geom) // draw inset
         drawNotchMarks(geom: geom)
      }
   }
}
