[![Tests](https://github.com/sentryco/GridView/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/GridView/actions/workflows/Tests.yml)

# GridView

> Gridify your UI

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
