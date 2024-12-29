import SwiftUI
import HybridColor
/**
 * Components
 * - Note: These calculations are kind of repetative and lengthy. But shortening and reusing code introduces rigiddity and makes it harder to comprehend. So hold of for now. There might be some way to refactor cleanly but will require some effort and clever design etc
 */
extension GridView {
   /**
    * Draw vertical lines
    * - Note: We could make this recursive. it would require a differnt geom setup. drawing more high-level. but would make the code less readable
    * - Parameters:
    *   - inset: The edge insets that define the padding for the grid.
    *   - size: The size of the grid.
    *   - count: The number of vertical lines to be drawn in the grid.
    *   - innerCount: The number of inner vertical lines to be drawn in each grid cell.
    * - Returns: A SwiftUI view that represents the vertical lines of the grid.
    */
   @ViewBuilder internal func drawVerticals(inset: EdgeInsets, size: CGSize, count: Int, innerCount: Int) -> some View {
      let length = GridSize.calcLength(length: size.width, inset: inset.hor, count: count)
      ForEach(0..<count, id: \.self) { // grid
         let offset = CGFloat($0) * length
         if $0 != 0 { // don't draw first line
            draw( // draw verLines
               a: .init(x: inset.leading + offset, y: inset.top),
               b: .init(x: inset.leading + offset, y: inset.top + size.height - inset.ver),
               color: style.verGridColor
            )
         }
         let innerLength = GridSize.calcLength(length: length, inset: .init(), count: innerCount)
         ForEach(1..<innerCount, id: \.self) { // inner grid
            let innerOffset = CGFloat($0) * innerLength
            let totalOffset = offset + innerOffset
            draw(
               a: .init(x: inset.leading + totalOffset, y: inset.top),
               b: .init(x: inset.leading + totalOffset, y: inset.top + size.height - inset.ver),
               color: style.verDivisionColor
            )
         }
      }
   }
   /**
    * Draw horizontal lines
    * - Note: We could merge this into drawVerticals and toggle on a boolean, but that would make the code less readable.
    * - Parameters:
    *   - inset: The edge insets that define the padding for the grid.
    *   - size: The size of the grid area where the lines will be drawn.
    *   - count: The number of horizontal lines to be drawn in the grid.
    *   - innerCount: The number of inner horizontal lines to be drawn within each grid cell.
    * - Returns: A SwiftUI view that represents the horizontal lines of the grid.
    */
   @ViewBuilder internal func drawHorizontals(inset: EdgeInsets, size: CGSize, count: Int, innerCount: Int) -> some View {
      let length = GridSize.calcLength(length: size.height, inset: inset.ver, count: count)
      ForEach(0..<count, id: \.self) { // grid
         let offset = CGFloat($0) * length
         if $0 != 0 { // don't draw first line
            draw( // draw horLines
               a: .init(x: inset.leading, y: inset.top + offset),
               b: .init(x: inset.leading + size.width - inset.hor, y: inset.top + offset),
               color: style.horGridColor
            )
         }
         let innerLength = GridSize.calcLength(length: length, inset: .init(), count: innerCount)
         ForEach(1..<innerCount, id: \.self) { // inner grid
            let innerOffset = CGFloat($0) * innerLength
            let totalOffset = offset + innerOffset
            draw(
               a: .init(x: inset.leading, y: inset.top + totalOffset),
               b: .init(x: inset.leading + size.width - inset.hor, y: inset.top + totalOffset),
               color: style.horDivisionColor
            )
         }
      }
   }
   /**
    * Draw hor and ver insets
    * - Parameter geom: The geometry proxy of the grid view.
    * - Returns: A SwiftUI view that represents the inset lines of the grid.
    */
   @ViewBuilder internal func drawInset(geom: GeometryProxy, inset: EdgeInsets, color: Color) -> some View {
      draw( // verLine1
         a: .init(x: inset.leading, y: inset.top),
         b: .init(x: inset.leading, y: inset.top + geom.size.height - inset.ver),
         color: color
      )
      draw( // verLine2
         a: .init(x: inset.leading + geom.size.width - inset.hor, y: inset.top),
         b: .init(x: inset.leading + geom.size.width - inset.hor, y: inset.top + geom.size.height - inset.ver),
         color: color
      )
      draw( // horLine1
         a: .init(x: inset.leading, y: inset.top),
         b: .init(x: inset.leading + geom.size.width - inset.hor, y: inset.top),
         color: color
      )
      draw( // horLine2
         a: .init(x: inset.leading, y: inset.top + geom.size.height - inset.ver),
         b: .init(x: inset.leading + geom.size.width - inset.hor, y: inset.top + geom.size.height - inset.ver),
         color: color
      )
   }
   /**
    * - Fixme: ⚠️️ add doc
    */
   @ViewBuilder internal func drawNotchMarks(geom: GeometryProxy) -> some View {
      Group { // Vertical
         // Notch 1 (tl)
         draw(
            a: .init(x: size.inset.leading, y: 0),
            b: .init(x: size.inset.leading, y: size.inset.top),
            color: style.notchColor
         )
         // Notch 2 (tr)
         draw(
            a: .init(x: size.inset.leading + geom.size.width - size.inset.hor, y: 0),
            b: .init(x: size.inset.leading + geom.size.width - size.inset.hor, y: size.inset.top),
            color: style.notchColor
         )
         // Notch 3 (bl)
         draw(
            a: .init(x: size.inset.leading, y: size.inset.top + geom.size.height - size.inset.ver),
            b: .init(x: size.inset.leading, y: geom.size.height),
            color: style.notchColor
         )
         // Notch 4 (br)
         draw(
            a: .init(x: size.inset.leading + geom.size.width - size.inset.hor, y: size.inset.top + geom.size.height - size.inset.ver),
            b: .init(x: size.inset.leading + geom.size.width - size.inset.hor, y: geom.size.height),
            color: style.notchColor
         )
      }
      Group { // horizontal
         // Notch 1 (tl)
         draw(
            a: .init(x: 0, y: size.inset.top),
            b: .init(x: size.inset.leading, y: size.inset.top),
            color: style.notchColor
         )
         // Notch 2 (tr)
         draw(
            a: .init(x: size.inset.leading + geom.size.width - size.inset.hor, y: size.inset.top),
            b: .init(x: geom.size.width, y: size.inset.top),
            color: style.notchColor
         )
         // Notch 3 (bl)
         draw(
            a: .init(x: 0, y: size.inset.top + geom.size.height - size.inset.ver),
            b: .init(x: size.inset.leading, y: size.inset.top + geom.size.height - size.inset.ver),
            color: style.notchColor
         )
         // Notch 4 (br)
         draw(
            a: .init(x: size.inset.leading + geom.size.width - size.inset.hor, y: size.inset.top + geom.size.height - size.inset.ver),
            b: .init(x: geom.size.width, y: size.inset.top + geom.size.height - size.inset.ver),
            color: style.notchColor
         )
      }
   }
}
