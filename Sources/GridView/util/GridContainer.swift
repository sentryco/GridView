import SwiftUI
/**
 * - Fixme: ⚠️️ add doc
 */
public struct GridContainer<Content: View>: View {
   public let style: GridStyle
   public let size: GridSize
   public let content: () -> Content
   /**
    * - Fixme: ⚠️️ add doc
    * - Parameters:
    *   - style: - Fixme: ⚠️️ add doc
    *   - size: - Fixme: ⚠️️ add doc
    *   - content: - Fixme: ⚠️️ add doc
    */
   public init(style: GridStyle, size: GridSize, content: @escaping () -> Content) {
      self.style = style
      self.size = size
      self.content = content
   }
   /**
    * - Fixme: ⚠️️ add doc
    */
   public var body: some View {
      ZStack {
         content()
         GridView(size: size, style: style)
      }
   }
}
