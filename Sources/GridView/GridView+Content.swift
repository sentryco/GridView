import SwiftUI
import HybridColor

extension GridView {
   /**
    * - Fixme: ⚠️️ Add doc
    */
   var body: some View {
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
