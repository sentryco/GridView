import SwiftUI
/**
 * A container view that overlays a custom content view on top of a grid view.
 *
 * This structure is generic over `Content` which must conform to `View`. It uses a specified `GridStyle` and `GridSize` to configure the underlying `GridView`.
 */
public struct GridContainer<Content: View>: View {
   /**
    * The style configuration for the grid.
    */
   public let style: GridStyle
   /**
    * The size configuration for the grid.
    */
   public let size: GridSize
   /**
    * A closure that returns the content to be displayed on top of the grid.
    */
   public let content: () -> Content
   /**
    * Initializes a new grid container with the specified style, size, and content.
    * - Parameters:
    *   - style: The style configuration for the grid.
    *   - size: The size configuration for the grid.
    *   - content: A closure that returns the content to be displayed on top of the grid.
    */
   public init(style: GridStyle, size: GridSize, content: @escaping () -> Content) {
      self.style = style
      self.size = size
      self.content = content
   }
   /**
    * The body of the `GridContainer`. It layers the provided content view on top of a `GridView`.
    */
   public var body: some View {
      ZStack {
         content()
         GridView(size: size, style: style)
      }
   }
}
