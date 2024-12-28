import SwiftUI
import HybridColor
/**
 * `GridView` is a SwiftUI view that provides a flexible way to create grid layouts.
 * - Note: It takes two parameters: `size` and `style`
 * - `size`: An instance of `GridSize` that defines the dimensions and spacing of the grid.
 * - `style`: An instance of `GridStyle` that defines the visual appearance of the grid.
 */
public struct GridView: View {
   /**
    * The `GridSize` struct that defines the dimensions and spacing of the grid.
    * - Note: It includes information such as the number of horizontal and vertical blocks, the size of each block, and the padding around the grid.
    */
   public let size: GridSize
   /**
    * The `GridStyle` struct that defines the visual appearance of the grid.
    * - Note: It includes properties for the colors of the grid lines, division lines, and the inset area, as well as the stroke width for the lines.
    */
   public let style: GridStyle
   /**
    * Public init
    */
   public init(size: GridSize, style: GridStyle) {
      self.size = size
      self.style = style
   }
}
