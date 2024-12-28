import SwiftUI
import HybridColor
/**
 * Grid styling
 */
struct GridStyle {
   let horGridColor: Color
   let verGridColor: Color
   let horDivisionColor: Color
   let verDivisionColor: Color
   let insetColor: Color
   let strokeWidth: CGFloat
}
/**
 * Const
 */
extension GridStyle {
   /**
    * Default style
    */
   static let defaultStyle: GridStyle = .init(
      horGridColor: Color.blue.opacity(0.6),
      verGridColor: Color.red.opacity(0.2),
      horDivisionColor: Color.whiteOrBlack.opacity(0.0),
      verDivisionColor: Color.whiteOrBlack.opacity(0.0),
      insetColor: Color.green.opacity(0.4), // whiteOrBlack
      strokeWidth: 0.5
   )
}
