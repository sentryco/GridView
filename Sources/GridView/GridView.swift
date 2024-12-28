import SwiftUI

struct GridView: View {
    var size: GridSize
    var style: GridStyle
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
               // Draw column gutters
               
               ForEach(0..<size.columnCount /* + 1*/, id: \.self) { col in
                  verLine(
                     size: geometry.size.height - size.columnGutter,
                     position: size.columnGutter + (CGFloat(col) * (size.rowWidth)),
                     offset: size.rowGutter,
                     color: style.columnColor
                  )
//                  verLine(size: , position: .init(x: , y: ))
//                    Rectangle()
//                        .fill(style.gutterColor)
//                        .frame(width: size.columnGutter)
//                        .position(x: , y: geometry.size.height / 2)
                }
                // Draw row gutters
                ForEach(0..<size.rowCount + 1/**/, id: \.self) { row in
                   horLine(
                     size: geometry.size.width - size.rowGutter,
                     position:  size.rowGutter + (CGFloat(row) * (size.columnHeight)),
                     offset: size.columnGutter,
                     color: style.rowColor
                   )
//                    Rectangle()
//                        .fill(style.gutterColor)
//                        .frame(height: size.rowGutter)
//                        .position(x: geometry.size.width / 2, y: CGFloat(row) * (size.columnHeight + size.rowGutter))
                }
               verLine(size: geometry.size.height, position: size.columnGutter, color: style.gutterColor)
               verLine(size: geometry.size.height, position: geometry.size.width - size.columnGutter, color: style.gutterColor)
               horLine(size: geometry.size.width, position: size.rowGutter, color: style.gutterColor)
               horLine(size: geometry.size.width, position: geometry.size.height - size.rowGutter, color: style.gutterColor)
                // Draw columns
//                ForEach(0..<size.columnCount, id: \.self) { col in
//                    Rectangle()
//                        .fill(col % size.colGroupCount == 0 ? style.colGroupColor : style.columnColor)
//                        .frame(width: size.rowWidth)
//                        .position(x: CGFloat(col) * (size.rowWidth + size.columnGutter) + size.rowWidth / 2, y: geometry.size.height / 2)
//                }
                // Draw rows
//                ForEach(0..<size.rowCount, id: \.self) { row in
//                    Rectangle()
//                        .fill(row % size.rowGroupCount == 0 ? style.rowGroupColor : style.rowColor)
//                        .frame(height: size.columnHeight)
//                        .position(x: geometry.size.width / 2, y: CGFloat(row) * (size.columnHeight + size.rowGutter) + size.columnHeight / 2)
//                }
            }
        }
    }
   func horLine(size: CGFloat, position: CGFloat, offset: CGFloat = 0, color: Color) -> some View {
      draw(
         pointA: .init(x: offset, y: position),
         pointB: .init(x: size, y: position),
         color: color
      )
   }
   func verLine(size: CGFloat, position: CGFloat, offset: CGFloat = 0, color: Color) -> some View {
      draw(
         pointA: .init(x: position, y: offset),
         pointB: .init(x: position, y: size),
         color: color
      )
   }
   func draw(pointA: CGPoint, pointB: CGPoint, color: Color = Color.blue) -> some View {
      Path { path in
         path.move(to: CGPoint(x: pointA.x, y: pointA.y))
         path.addLine(to: CGPoint(x: pointB.x, y: pointB.y))
      }
      .stroke(color, lineWidth: 1)
   }
}
#Preview(traits: .fixedLayout(width: 360, height: 548)) {
   let gridSize = GridSize(
      rowGutter: 20,
      columnGutter: 20,
      rowWidth: 40,
      columnHeight: 40,
      rowCount: 12,
      columnCount: 8,
      colGroupCount: 1,
      rowGroupCount: 1
   )
   let gridStyle = GridStyle(
      gutterColor: .gray,
      rowColor: .green,
      columnColor: .blue,
      colGroupColor: .red,
      rowGroupColor: .yellow
   )
   ZStack(alignment: .topLeading) {
      VStack(alignment: .leading, spacing: 20) {
         Text("This is the title that expands to fill the entire screen")
            .font(.system(size: 32).bold())
            .background(.orange)
         Text("SubheaderText")
            .font(.system(size: 24).bold())
            .background(.green)
         Text("This is the description that spans multiple lines in the user interface")
            .font(.system(size: 18))
            .background(.indigo)
      }
      .padding(.vertical, gridSize.rowGutter)
      .padding(.horizontal, gridSize.columnGutter)
      GridView(
         size: gridSize,
         style: gridStyle
      )
   }
   .background(Color.black)
}
