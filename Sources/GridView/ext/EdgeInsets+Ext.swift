import SwiftUI

extension EdgeInsets {
   var ver: CGFloat { self.vertical }
   var vertical: CGFloat { self.top + self.bottom }
   var hor: CGFloat { self.horizontal }
   var horizontal: CGFloat { self.leading + self.trailing }
   /**
    * Initializes an EdgeInsets with horizontal and vertical padding.
    * - Parameters:
    *   - hor: The horizontal padding. (not total)
    *   - ver: The vertical padding. (not total)
    */
   init(hor: CGFloat, ver: CGFloat) {
      self = .init(
         top: ver,
         leading: hor,
         bottom: ver,
         trailing: hor
      )
   }
}
