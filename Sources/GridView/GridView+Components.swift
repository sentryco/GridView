import SwiftUI
import HybridColor
/**
 * Components
 */
extension GridView {
   /**
    * Draw vertical lines
    * - Note: We could make this recursive. it would require a differnt geom setup. drawing more high-level. but would make the code less readable
    * - Parameters:
    *   - inset: - Fixme: ⚠️️ Add doc
    *   - size: - Fixme: ⚠️️ Add doc
    *   - count: - Fixme: ⚠️️ Add doc
    *   - innerCount: - Fixme: ⚠️️ Add doc
    * - Returns: - Fixme: ⚠️️ Add doc
    */
   @ViewBuilder internal func drawVerticals(inset: EdgeInsets, size: CGSize, count: Int, innerCount: Int) -> some View {
      let length = GridSize.calcLength(length: size.width, inset: inset.hor, count: count)
      let _ = {
         Swift.print("length:  \(length)")
      }()
      ForEach(0..<count, id: \.self) { // grid
         let offset = CGFloat($0) * length
         if $0 != 0 { // dont draw first line
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
    * - Note: We could merge this into drawVerticals. and toggle on bool. but would make the code less readable
    * - Parameters:
    *   - inset: - Fixme: ⚠️️ Add doc
    *   - size: - Fixme: ⚠️️ Add doc
    *   - count: - Fixme: ⚠️️ Add doc
    *   - innerCount: - Fixme: ⚠️️ Add doc
    * - Returns: - Fixme: ⚠️️ Add doc
    */
   @ViewBuilder internal func drawHorizontals(inset: EdgeInsets, size: CGSize, count: Int, innerCount: Int) -> some View {
      let length = GridSize.calcLength(length: size.height, inset: inset.ver, count: count)
      ForEach(0..<count, id: \.self) { // grid
         let offset = CGFloat($0) * length
         if $0 != 0 { // dont draw first line
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
    * - Parameter geom: - Fixme: ⚠️️ Add doc
    * - Returns: - Fixme: ⚠️️ Add doc
    */
   @ViewBuilder internal func drawInset(geom: GeometryProxy) -> some View {
      draw( // verLine1
         a: .init(x: size.inset.leading, y: size.inset.top),
         b: .init(x: size.inset.leading, y: size.inset.top + geom.size.height - size.inset.ver),
         color: style.insetColor
      )
      draw( // verLine2
         a: .init(x: size.inset.leading + geom.size.width - size.inset.hor, y: size.inset.top),
         b: .init(x: size.inset.leading + geom.size.width - size.inset.hor, y: size.inset.top + geom.size.height - size.inset.ver),
         color: style.insetColor
      )
      draw( // horLine1
         a: .init(x: size.inset.leading, y: size.inset.top),
         b: .init(x: size.inset.leading + geom.size.width - size.inset.hor, y: size.inset.top),
         color: style.insetColor
      )
      draw( // horLine2
         a: .init(x: size.inset.leading, y: size.inset.top + geom.size.height - size.inset.ver),
         b: .init(x: size.inset.leading + geom.size.width - size.inset.hor, y: size.inset.top + geom.size.height - size.inset.ver),
         color: style.insetColor
      )
   }
}
