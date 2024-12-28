import SwiftUI
import HybridColor
// Use TextFields
// add some basic buttons
// add some rounded background
// test for iOS and macOS

#Preview {
   let size: GridSize = .defaultSize
   let style: GridStyle = .defaultStyle
   ZStack(alignment: .topLeading) {
      VStack(alignment: .leading, spacing: .zero) {
         Text("Hello, SwiftUI!")
            .frame(maxWidth: .infinity, maxHeight: 20*2, alignment: .leading)
            .background(.orange.opacity(0.2))
         Spacer()
            .frame(height: 20)
         TextField("", text: .constant("Hello, World!"))
            .font(.headline)
            .multilineTextAlignment(.leading)
//            .lineLimit(0)
            .background(Color.indigo.opacity(0.2))
         Spacer()
            .frame(height: 20)
         TextField("", text: .constant("More text \nanother line"), axis: .vertical)
            .frame(height: 20 * 2, alignment: .topLeading)
            .font(.system(size: 14))
//            .lineSpacing(6)
            .lineLimit(2...4)
            .multilineTextAlignment(.leading)
//            .lineLimit(0)
            .background(Color.pink.opacity(0.2))
            .getHeight { height in
               Swift.print("height:  \(height)")
            }
         Spacer()
            .frame(height: 20)
         Button(action: {}, label: { Text("Button").frame(height: 20) })
            .buttonStyle(.plain)
            .padding(.vertical, 10)
            .padding(.horizontal, 50)
            .background(
               RoundedRectangle(cornerSize: .init(width: 10, height: 10))
                  .fill(.blue.opacity(0.8))
            )
//         Spacer()
      }
      .padding(size.inset)
      GridView(size: size, style: style)
   }
   .frame(
      width: GridSize.defaultSize.size.width,
      height: GridSize.defaultSize.size.height
   )
}
