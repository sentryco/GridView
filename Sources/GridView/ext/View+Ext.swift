import SwiftUI

extension View {
   /**
    * Draws a line between two points with a specified color.
    * - Parameters:
    *   - a: The starting point of the line.
    *   - b: The ending point of the line.
    *   - color: The color of the line.
    * - Returns: A view that represents a line drawn from point `a` to point `b` using the specified color.
    */
   func draw(a: CGPoint, b: CGPoint, color: Color) -> some View {
      Path { path in
         path.move(to: CGPoint(x: a.x, y: a.y))
         path.addLine(to: CGPoint(x: b.x, y: b.y))
      }
      .stroke(color, lineWidth: 1)
   }
}
