import SwiftUI

struct GridStyling {
   let gridColor: Color
   let divisionColor: Color
   let insetColor: Color
   let strokeWidth: CGFloat
}
extension GridStyling {
   static let defaultStyle: GridStyling = .init(
      gridColor: Color.gray.opacity(0.6),
      divisionColor: Color.gray.opacity(0.2),
      insetColor: Color.gray.opacity(0.8),
      strokeWidth: 0.5
   )
}
