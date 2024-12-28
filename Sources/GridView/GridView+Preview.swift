import SwiftUI
import HybridColor
/**
 * Preview
 * width: (32*2) + (12*16) = 256
 * height: (48*2*) + (24*12) = 384
 * hor-div: 12/3 = 4
 * ver-div_ 24/6 = 4
 */
#Preview {
   struct ContentView: View {
      let gridSize: GridSize = .init(
         inset: .init(hor: 16, ver: 48), // horizontal padding, vertical padding
         horCount: 16, // number of vertical blocks
         verCount: 12, // number of horizontal blocks
         verDivisionCount: 4, // num of vertical inner blocks
         horDivisionCount: 2, // num of horizontal inner blocks
         blockWidth: 24, // double horizontal blocksize
         blockHeight: 24 // half of vertical blocksize
      )
      let gridStyle: GridStyle = .init(
         horGridColor: Color.blue.opacity(0.4),
         verGridColor: Color.red.opacity(0.2),
         horDivisionColor: Color.whiteOrBlack.opacity(0.0),
         verDivisionColor: Color.whiteOrBlack.opacity(0.0),
         insetColor: Color.green.opacity(0.2), // whiteOrBlack
         strokeWidth: 0.5
      )
      init() {
         Swift.print("📐 gridSize.size: \(gridSize.size)") // ⚠️️ Debug
         Swift.print("📏 gridSize.divLength: \(gridSize.divLength)") // ⚠️️ Debug
         Swift.print("🧱 gridSize.blockSize: \(gridSize.blockSize)")
      }
      var body: some View {
         ZStack(alignment: .topLeading) {
            VStack(alignment: .leading, spacing: .zero) {
               headerText
               Spacer()
                  .frame(width: 24, height: 24)
                  // Rectangle()
                  //    .fill(.red.opacity(0.4))
                  //    .frame(width: 24, height: 24, alignment: .topLeading)
               subHeaderText
               Spacer()
                  .frame(width: 24, height: 24)
                  // Rectangle()
                  //    .fill(.red.opacity(0.4))
                  //    .frame(width: 24, height: 24, alignment: .topLeading)
               descriptionText
               // Rectangle()
               //    .fill(.red.opacity(0.4))
               //    .frame(width: 24, height: 24, alignment: .topLeading)
               Spacer()
                  .frame(width: 24, height: 24)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(.yellow.opacity(0.1))
            .padding(gridSize.inset)
            GridView(
               size: gridSize,
               style: gridStyle
            )
         }
      }
      var headerText: some View {
         Group {
            Text("This is the title that expands to fill the entire screen. It continues down the screen to fill out the space.")
               .font(.system(size: 24).bold())
               .lineSpacing(6)
               .foregroundStyle(Color.whiteOrBlack.opacity(0.8))
               .multilineTextAlignment(.leading)
               .frame(maxWidth: .infinity,/* maxHeight: 24, */alignment: .topLeading)
//               .background(.orange)
//               .getHeight { height in
//                  print("headerText height: \(height)")
//               }
         }
//         Rectangle()
//            .fill(.indigo.opacity(0.2))
//            .overlay(
//               VStack {
//
//                  Spacer()
//               }
//            )
         .frame(/*width: .infinity, */height: 24*7, alignment: .topLeading)
//         .background(.green)
         .background(.indigo.opacity(0.2))
//            .frame(maxWidth: .infinity, alignment: .topLeading)
      }
      var subHeaderText: some View {
         Group {
            Text("SubheaderText")
               .font(.system(size: 24).bold())
               .foregroundStyle(Color.whiteOrBlack.opacity(0.6))
               .frame(maxWidth: .infinity,/* maxHeight: 24, */alignment: .topLeading)
//               .background(.green.opacity(0.2))
            //            .padding(.vertical, 8)
//               .getHeight { height in
//                  print("subHeaderText height: \(height)")
//               }
         }
         .frame(width: .infinity, height: 24*1, alignment: .topLeading)
         .background(.green.opacity(0.2))
//       .frame(maxWidth: .infinity, alignment: .leading)
      }
      var descriptionText: some View {
         Group {
            Text("This is the description that spans multiple lines in the user interface")
               .font(.system(size: 12))
               .lineSpacing(.zero)
               .foregroundStyle(Color.whiteOrBlack.opacity(0.4))
               .frame(maxWidth: .infinity, /*maxHeight: 48, */alignment: .topLeading)
//               .background(.pink.opacity(0.2))
//               .getHeight { height in
//                  print("subHeaderText height: \(height)")
//               }
         }
         .frame(width: .infinity, height: 24*2, alignment: .topLeading)
         .background(.orange.opacity(0.2))
         
//            .frame(maxWidth: .infinity, alignment: .leading)
      }
   }
   let view = ContentView()
   return view
   .background(Color.blackOrWhite)
//   .environment(\.colorScheme, .dark)
   #if os(macOS)
   .frame( // Set size of preview for macOS
      width: view.gridSize.size.width,
      height: view.gridSize.size.height
   )
   #endif
}
