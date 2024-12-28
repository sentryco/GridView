import SwiftUI
/**
 * - Fixme: ⚠️️ add doc to each var
 */
struct GrdSize {
    var rowGutter: CGFloat = 10 // - Fixme: ⚠️️ rename to horGutter
    var columnGutter: CGFloat = 10 // - Fixme: ⚠️️ rename to verGutter
    var rowWidth: CGFloat = 1
    var columnHeight: CGFloat = 1
    var rowCount: Int = 10
    var columnCount: Int = 10
    var colGroupCount: Int = 2 // - Fixme: ⚠️️ calculate calc based on view width,
    var rowGroupCount: Int = 2 // - Fixme: ⚠️️ calc based on view
}
