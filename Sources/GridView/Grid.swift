import SwiftUI

struct Grid: View {
   let size: GridSizing
   let style: GridStyling
   var body: some View {
      GeometryReader { geom in
         drawInset(geom: geom) // draw inset
         drawVerticals(
            inset: size.inset,
            size: geom.size,
            count: size.verCount,
            innerCount: size.verDivisionCount
         ) // draw vertical lines
         // draw verDivisionCount
         // draw horCount
         // draw horDivisionCount
      }
   }
}
extension Grid {
   @ViewBuilder func drawVerticals(inset: EdgeInsets, size: CGSize, count: Int, innerCount: Int) -> some View {
      ForEach(1..<count, id: \.self) { // grid
         let length = calcLength(length: size.width, inset: inset.hor, count: count)
         let offset = CGFloat($0) * length
         draw( // draw verLines
            a: .init(x: inset.leading + offset, y: inset.top),
            b: .init(x: inset.leading + offset, y: inset.top + size.height - inset.ver),
            color: style.gridColor
         )
         ForEach(1..<innerCount, id: \.self) { // inner grid
            let innerLength = calcLength(length: length, inset: .init(), count: innerCount)
            let innerOffset = CGFloat($0) * innerLength
            let totalOffset = offset + innerOffset
            draw(
               a: .init(x: inset.leading + totalOffset, y: inset.top),
               b: .init(x: inset.leading + totalOffset, y: inset.top + size.height - inset.ver),
               color: style.divisionColor
            )
         }
      }
   }
   @ViewBuilder func drawInset(geom: GeometryProxy) -> some View {
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
         color: style.gridColor
      )
      draw( // horLine2
         a: .init(x: size.inset.leading, y: size.inset.top + size.inset.top + geom.size.height - size.inset.ver),
         b: .init(x: size.inset.leading + geom.size.width - size.inset.hor, y: size.inset.top + size.inset.top + geom.size.height - size.inset.ver),
         color: style.gridColor
      )
   }
}
extension Grid {
   func calcLength(length: CGFloat, inset: CGFloat, count: Int) -> CGFloat {
      let totLength: CGFloat = length - inset
      let length = totLength / CGFloat(count)
      return length
   }
}
#Preview(traits: .fixedLayout(width: 300, height: 400)) {
   let gridSize = GridSizing.defaultSize
   let gridStyle = GridStyling.defaultStyle
   ZStack(alignment: .topLeading) {
      VStack(alignment: .leading, spacing: 20) {
         Text("This is the title that expands to fill the entire screen")
            .font(.system(size: 32).bold())
            .foregroundStyle(.black.opacity(0.8))
//            .background(.orange.opacity(0.2))
         Text("SubheaderText")
            .font(.system(size: 24).bold())
            .foregroundStyle(.black.opacity(0.6))
//            .background(.green.opacity(0.2))
         Text("This is the description that spans multiple lines in the user interface")
            .font(.system(size: 18))
            .foregroundStyle(.black.opacity(0.6))
//            .background(.indigo.opacity(0.2))
      }
      .padding(gridSize.inset)
      Grid(
         size: gridSize,
         style: gridStyle
      )
   }
   .background(Color.white)
}



// drawVer(x: CGFloat, y: CGFloat, length: CGFloat, color: Color)
// drawHor(x: CGFloat, y: CGFloat, length: CGFloat, color: Color)
// draw(a: CGPoint, b: CGPoint)


//ForEach(1..<size.verCount, id: \.self) {
//   let len = calcLength(length: geom.size.height, inset: size.inset.ver, count: size.verCount)
//   let offset = CGFloat($0) * calcLength(length: geom.size.width, inset: size.inset.hor, count: size.verCount)
//   let inset: EdgeInsets = .init(
//      top: size.inset.top,
//      leading: size.inset.leading + offset,
//      bottom: size.inset.bottom,
//      trailing: size.inset.trailing
//   )
//   return drawVerticals(
//      inset: inset,
//      size: geom.size,
//      count: size.verDivisionCount
//   ) // draw vertical lines
//   }
