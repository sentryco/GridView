import SwiftUI

/**
 * A view modifier that measures the height of the content view and performs a callback with the height value.
 */
struct HeightMeasuringModifier: ViewModifier {
   /**
    * The callback that is triggered with the height of the content view.
    */
   let callback: (CGFloat) -> Void
   /**
    * The body of the `HeightMeasuringModifier`.
    * - Parameter content: The content view that the modifier is applied to.
    * - Returns: A modified view that measures the height of the content and triggers a callback.
    */
   func body(content: Content) -> some View {
      content
         .background(
            GeometryReader { geometry -> Color in
               DispatchQueue.main.async {
                  // Trigger the callback with the height of the content view.
                  callback(geometry.size.height)
               }
               // A clear color is used so that the background is invisible.
               return Color.clear
            }
         )
   }
}

extension View {
   /**
    * A function that applies the `HeightMeasuringModifier` to a view.
    * - Parameter callback: The callback that is triggered with the height of the view.
    * - Returns: A modified view that measures its height.
    */
   func getHeight(_ callback: @escaping (CGFloat) -> Void) -> some View {
      self.modifier(HeightMeasuringModifier(callback: callback))
   }
}

/**
 * Example usage of `getHeight` in a SwiftUI preview.
 */
#Preview {
   Text("Measure my height")
      .padding()
      .background(Color.yellow)
      .getHeight { height in
         // The callback prints the height of the view.
         print("The height of the view is: \(height)")
      }
}
