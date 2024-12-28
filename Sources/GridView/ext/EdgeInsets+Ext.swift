import SwiftUI

extension EdgeInsets {
   var ver: CGFloat { self.vertical }
   var vertical: CGFloat { self.top + self.bottom }
   var hor: CGFloat { self.horizontal }
   var horizontal: CGFloat { self.leading + self.trailing }
   /**
    *  - Fixme: ⚠️️ add doc
    * - Parameters:
    *   - hor: Not total
    *   - ver: Not total
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
