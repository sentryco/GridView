### Grid Configuration

### Description:
`GridView` provides a flexible way to create grid layouts in SwiftUI. Customize it to fit your application's needs and enhance your UI with structured layouts.

### Problem: 
- 🖼️ Keeping up with consistent spacing across UI components in your app in various platforms is hard
- 🫣 Spacing can be subtle to notice, but adds a lot to the over all aesthetics
- 🥵 Keeping grids aligned can be cumbersome with custom and dynamic sized UI

### Solution: 
- 📐 Add GridView to your component preview and app preview
- ♻️ Reuse constants in GridSizing across your previews. 
- 🤖 Auto-adjust the grid with your own multipliers that are tied to Apples dynamic resize classes

### Benefits of using a grid: 
- GridView doesn't add to your app code. Just your previews. 
- Reduces complexity by making things more consistent across your UI code. 
- When you know your core-grid is in alignment, it's easier to break from the grid as well. 
- Reusing components in different parts of your app and in different contexts can often break the core grid that was intended for a component. 
- Griddifying your smaller components, can your composite components more aesthetically pleasing.  easier discovering subtle but subconsciously noticeable UI inconsistencies.
- Knowing where to place things is often a challenge. And grid can make it easier to choose. 
- Typography, Colors and layout-spacing. Each adds to the impression users gets of your app. 
- One small Ui size change can matestesize into the rest of the UI, and no matter how many corrections that are made, it all starts to look increasingly out of place 

### Basic grid configuration: 
- **Row Count**: Number of rows in the grid.
- **Column Count**: Number of columns in the grid.
- **Row and Column Colors**: Customize the colors of rows and columns.
- **Gutter and Group Colors**: Customize the gutter and group colors.

## Examples
```swift
// Input: fixedSize (view size doesnt change)
// totHeight / totWidth
// verGutterHeight / horGutterWidth
// verHeight / horWidth
// inset (x/y)

// Input: dynamicSize (view size can change)
// ?
```


## Customization

You can customize the grid by adjusting the properties in `GridSize` and `GridStyle`:

- `rowGutter`, `columnGutter`: Adjust the spacing between rows and columns.
- `rowWidth`, `columnHeight`: Set the dimensions of rows and columns.
- `colGroupCount`, `rowGroupCount`: Define the grouping of rows and columns.
