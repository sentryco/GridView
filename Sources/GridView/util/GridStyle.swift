import SwiftUI
import HybridColor
/**
 * Grid styling
 */
public struct GridStyle {
   /**
    * The color of the horizontal grid lines.
    */
   public let horGridColor: Color
   /**
    * The color of the vertical grid lines.
    */
   public let verGridColor: Color
   /**
    * The color of the horizontal division lines within grid cells.
    */
   public let horDivisionColor: Color
   /**
    * The color of the vertical division lines within grid cells.
    */
   public let verDivisionColor: Color
   /**
    * The color used for the grid's inset area.
    */
   public let insetColor: Color
   /**
    * - Fixme: ⚠️️ add doc
    */
   public let innerInsetColor: Color
   /**
    * The stroke width for the grid and division lines.
    */
   public let strokeWidth: CGFloat
   /**
    * Notch mark color
    */
   public let notchColor: Color
   /**
    * Public init
    */
   public init(horGridColor: Color, verGridColor: Color, horDivisionColor: Color, verDivisionColor: Color, insetColor: Color, innerInsetColor: Color = .clear, strokeWidth: CGFloat, notchColor: Color = Color.red.opacity(0.5)) {
      self.horGridColor = horGridColor
      self.verGridColor = verGridColor
      self.horDivisionColor = horDivisionColor
      self.verDivisionColor = verDivisionColor
      self.insetColor = insetColor
      self.innerInsetColor = innerInsetColor
      self.strokeWidth = strokeWidth
      self.notchColor = notchColor
   }
}
/**
 * Const
 */
extension GridStyle {
   /**
    * Default style
    */
   public static let defaultStyle: GridStyle = .init(
      horGridColor: Color.blue.opacity(0.6),
      verGridColor: Color.red.opacity(0.2),
      horDivisionColor: Color.whiteOrBlack.opacity(0.0),
      verDivisionColor: Color.whiteOrBlack.opacity(0.0),
      insetColor: Color.green.opacity(0.4),
      innerInsetColor: Color.clear, // whiteOrBlack
      strokeWidth: 0.5
   )
   /**
    * Style for diagnosing frame margins
    */
   public static let frameStyle: GridStyle = .init(
      horGridColor: .clear,
      verGridColor: .clear,
      horDivisionColor: .clear,
      verDivisionColor: .clear,
      insetColor: .green,
      innerInsetColor: .yellow,
      strokeWidth: 1,
      notchColor: .red
   )
}
