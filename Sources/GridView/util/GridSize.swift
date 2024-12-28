import SwiftUI
/**
 * `GridSize` is a structure that defines the dimensions and spacing of the grid in the GridView.
 */
public struct GridSize {
   /**
    * horizontal padding, vertical padding
    */
   public let inset: EdgeInsets
   /**
    * number of horizontal blocks
    */
   public let horCount: Int
   /**
    * number of vertical blocks
    */
   public let verCount: Int
   /**
    * num of vertical inner blocks
    */
   public let verDivisionCount: Int
   /**
    * num of horizontal inner blocks
    */
   public let horDivisionCount: Int
   /**
    * horizontal blocksize
    */
   public let blockWidth: CGFloat
   /**
    * vertical blocksize
    */
   public let blockHeight: CGFloat
   /**
    * Public init
    */
   public init(inset: EdgeInsets, horCount: Int, verCount: Int, verDivisionCount: Int, horDivisionCount: Int, blockWidth: CGFloat, blockHeight: CGFloat) {
      self.inset = inset
      self.horCount = horCount
      self.verCount = verCount
      self.verDivisionCount = verDivisionCount
      self.horDivisionCount = horDivisionCount
      self.blockWidth = blockWidth
      self.blockHeight = blockHeight
   }
}
/**
 * Const
 */
extension GridSize {
   /**
    * The default size for the grid.
    * This size is used when no custom size is specified.
    * It includes default insets, block counts, division counts, and block dimensions.
    */
   public static let defaultSize: GridSize = {
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
    * The total size of the grid, including insets and block dimensions.
    */
   public var size: CGSize {
      let w: CGFloat = CGFloat((self.inset.hor) + (self.blockWidth * CGFloat(self.verCount)))
      let h: CGFloat = CGFloat((self.inset.ver) + (self.blockHeight * CGFloat(self.horCount)))
      return .init(width: w, height: h)
   }
   /**
    * The size of the divisions within the grid.
    */
   public var divLength: CGSize {
      .init(
         width: blockHeight / CGFloat(horDivisionCount),
         height: blockWidth / CGFloat(verDivisionCount)
      )
   }
   /**
    * The size of each block in the grid.
    */
   public var blockSize: CGSize {
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
    * Calculates the length of a block in the grid.
    * - Parameters:
    *   - length: The total length of the grid.
    *   - inset: The inset of the grid.
    *   - count: The number of blocks in the grid.
    * - Returns: The length of each block.
    */
   public static func calcLength(length: CGFloat, inset: CGFloat, count: Int) -> CGFloat {
      let totLength: CGFloat = length - inset
      let length = totLength / CGFloat(count)
      return length
   }
}
