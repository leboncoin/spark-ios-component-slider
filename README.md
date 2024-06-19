# Slider
A slider is an interactive component that allows users to set values by moving a handle within a defined range.

## Specifications
The slider specifications on Zeroheight are [here](https://zeroheight.com/1186e1705/v/latest/p/25cceb-slider/b/03f6fc).

![Figma anatomy](https://github.com/adevinta/spark-ios-component-slider/blob/main/.github/assets/anatomy.png)

## Usage
Both UIKit and SwiftUI sliders are generic and can be created with any type that conforms to: 
* V: [BinaryFloatingPoint](https://developer.apple.com/documentation/swift/binaryfloatingpoint)
* V.Stride: BinaryFloatingPoint

Quick list of examples: `Float`, `CGFloat`, `Double`

### Properties
* `theme`: The slider's current theme
* `shape`: The slider's current shape (`square` or `rounded`)
* `intent`: The slider's current intent
* `value`: The slider’s current value
* `range` (UIKit) / `bounds` (SwiftUI): The bounds of the slider
* `step`: The distance between each valid value

### UIKit: SliderUIControl
```swift
let slider: SliderUIControl<Float> = SliderUIControl(
    theme: theme,
    shape: .rounded,
    intent: .basic
)
```

### SwiftUI: Slider
```swift
@State let value: Float
...
let slider = Slider(
    theme: theme,
    shape: .rounded,
    intent: .support,
    value: $value,
    in: 0...0.4, // Default value `0...1`
    onEditingChanged: { isEditing in // Default value `{ _ in }`
        // TODO
    })
)
```
or
```swift
@State let value: Float
...
let slider = Slider(
    theme: theme,
    shape: .square,
    intent: .main,
    value: $value,
    in: 0...10, // Default value `0...1`
    step: 2.5, // Default value `1`
    onEditingChanged: { isEditing in // Default value `{ _ in }`
        // TODO
    })
)
```

## License

```
MIT License

Copyright (c) 2024 Adevinta

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```