[![Tests](https://github.com/sentryco/GridView/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/GridView/actions/workflows/Tests.yml)

# GridView

> Gridify your UI

### Description:
`GridView` provides a flexible way to create grid layouts in SwiftUI. Customize it to fit your application's needs and enhance your UI with structured layouts.

### Problem: 
- 🖼️ Safe-areas, sheets, platform differences, etc. all adds to the complexity of keeping margins consistent
- 🫣 The human eye can't tell the difference between a 12px margin and a 16px margin. 
- 🥵 Maintaining alignment in grids can be challenging with custom and dynamically sized user interfaces.

### Solution: 
- 📐 Add GridView to your component-preview and app-preview
- 🎯 Visual margin guides help maintain consistent spacing and alignment throughout your UI
- 🤖 Automatically adapt the grid using custom multipliers linked to Apple's dynamic resizing classes


### Examples:

You can customize the grid by adjusting the properties in `GridSize` and `GridStyle`:

```swift
GridContainer(size: .defaultSize, style: .defaultStyle) {
   VStack {
        Text("Hello, World!")
        Text("More text")
   }.padding()
}
// ⚠️️ If this is not set, the grid will be calculated based on the preexisting frame
.frame(size: GridView.defaultSize.size) 
```

### Benefits of using a grid: 
- GridView is designed for use in previews, ensuring no additional code is introduced into your app's production codebase.
- Simplifies your UI codebase by promoting consistency in design elements.
- Achieving alignment with your core grid simplifies the process of intentionally deviating from it when needed for creative layouts.
- Reusing components across various parts of your app and in different contexts may disrupt the intended core grid alignment of a component.
- Implementing a grid structure for your smaller components enhances the visual harmony of your composite components, making it simpler to identify and rectify subtle UI inconsistencies that may not be consciously noticeable but can affect the overall user experience.
- Deciding on the placement of elements can be daunting; utilizing a grid simplifies these decisions.
- Typography, color schemes, and layout spacing collectively shape the user's perception of your application.
- A single minor adjustment in UI dimensions can cascade throughout the interface, and despite numerous tweaks, the overall layout may begin to appear disjointed.

### Todo: 
- Add GH action ✅
- Add badge to org readme ✅
- Add notch-marks that represents begining of margins ✅
- Draw grid from innerInset ✅
- Add GridContainer ✅
