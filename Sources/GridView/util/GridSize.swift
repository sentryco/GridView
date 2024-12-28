import SwiftUI
/**
 * - Fixme: ⚠️️ add doc
 */
struct GridSize {
   /**
    * horizontal padding, vertical padding
    */
   let inset: EdgeInsets
   /**
    * number of horizontal blocks
    */
   let horCount: Int
   /**
    * number of vertical blocks
    */
   let verCount: Int
   /**
    * num of vertical inner blocks
    */
   let verDivisionCount: Int
   /**
    * num of horizontal inner blocks
    */
   let horDivisionCount: Int
   /**
    * horizontal blocksize
    */
   let blockWidth: CGFloat
   /**
    * vertical blocksize
    */
   let blockHeight: CGFloat
}
/**
 * Const
 */
extension GridSize {
   /**
    * - Fixme: ⚠️️ add doc
    */
   static let defaultSize: GridSize = {
      .init(
         // totSize: .init(width: 200, height: 300),
         inset: .init(top: 40, leading: 20, bottom: 40, trailing: 20),
         horCount: 6,
         verCount: 4,
         verDivisionCount: 4,
         horDivisionCount: 4,
         blockWidth: 20,
         blockHeight: 20
      )
   }()
}
/**
 * Getter
 */
extension GridSize {
   /**
    * - Fixme: ⚠️️ add doc
    */
   var size: CGSize {
      let w: CGFloat = CGFloat((self.inset.hor) + (self.blockWidth * CGFloat(self.verCount)))
      let h: CGFloat = CGFloat((self.inset.ver) + (self.blockHeight * CGFloat(self.horCount)))
      return .init(width: w, height: h)
   }
   /**
    * - Fixme: ⚠️️ add doc
    */
   var divLength: CGSize {
      .init(
         width: blockHeight / CGFloat(horDivisionCount),
         height: blockWidth / CGFloat(verDivisionCount)
      )
   }
   /**
    * - Fixme: ⚠️️ add doc
    */
   var blockSize: CGSize {
      let width = Self.calcLength(
         length: self.size.width,
         inset: self.inset.hor,
         count: self.verCount
      )
      let height = Self.calcLength(
         length: self.size.height,
         inset: self.inset.ver,
         count: self.horCount
      )
      return .init(width: width, height: height)
   }
   /**
    * block length
    * - Parameters:
    *   - length: - Fixme: ⚠️️ Add doc
    *   - inset: - Fixme: ⚠️️ Add doc
    *   - count: - Fixme: ⚠️️ Add doc
    * - Returns: - Fixme: ⚠️️ Add doc
    */
   static func calcLength(length: CGFloat, inset: CGFloat, count: Int) -> CGFloat {
      let totLength: CGFloat = length - inset
      let length = totLength / CGFloat(count)
      return length
   }
}
