import SwiftUI
import HybridColor
/**
 * `GridView` is a SwiftUI view that provides a flexible way to create grid layouts.
 * It takes two parameters: `size` and `style`.
 * - `size`: An instance of `GridSize` that defines the dimensions and spacing of the grid.
 * - `style`: An instance of `GridStyle` that defines the visual appearance of the grid.
 */
public struct GridView: View {
   public let size: GridSize
   public let style: GridStyle
}
