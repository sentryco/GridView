import SwiftUI

extension View {
   /**
    * - Fixme: ⚠️️ Add doc
    */
   func draw(a: CGPoint, b: CGPoint, color: Color) -> some View {
      Path { path in
         path.move(to: CGPoint(x: a.x, y: a.y))
         path.addLine(to: CGPoint(x: b.x, y: b.y))
      }
      .stroke(color, lineWidth: 1)
   }
}
