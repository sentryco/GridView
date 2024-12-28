import SwiftUI

struct GridSizing {
//   let totSize: CGSize
   let inset: EdgeInsets
   let verCount: Int
   let horCount: Int
   let verDivisionCount: Int
   let horDivisionCount: Int
}
extension GridSizing {
   static let defaultSize: GridSizing = {
      .init(
//         totSize: .init(width: 200, height: 300),
         inset: .init(top: 40, leading: 20, bottom: 40, trailing: 20),
         verCount: 4,
         horCount: 6,
         verDivisionCount: 4,
         horDivisionCount: 4
      )
   }()
}
