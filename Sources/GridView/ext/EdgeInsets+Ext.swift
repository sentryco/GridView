import SwiftUI

extension EdgeInsets {
   var ver: CGFloat { self.vertical }
   var vertical: CGFloat { self.top + self.bottom }
   var hor: CGFloat { self.horizontal }
   var horizontal: CGFloat { self.leading + self.trailing }
}
