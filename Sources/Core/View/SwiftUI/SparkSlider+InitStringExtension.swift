//
//  SparkSlider+InitStringExtension.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkCommon

public extension SparkSlider {

    // MARK: - Init with String

    /// Creates a slider to select a value from a given range with a text value label.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - valueText: A text that describes the current value and appears above the slider handle.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 0.5
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...1,
    ///             valueText: "Value"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Rating rendering.](slider_value.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        valueText: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where ValueLabel == Text, MinValueLabel == EmptyView, MaxValueLabel == EmptyView {
        self.init(
            value,
            in: bounds,
            valueLabel: { Text(valueText) },
            minValueLabel: { EmptyView() },
            maxValueLabel: { EmptyView() },
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with text range labels.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - minValueText: A text that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueText: A text that describes `bounds.upperBound` and appears below the slider on the right.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 50
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...100,
    ///             minValueText: "Min",
    ///             maxValueText: "Max"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Rating rendering.](slider_range_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        minValueText: String,
        maxValueText: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where ValueLabel == EmptyView, MinValueLabel == Text, MaxValueLabel == Text {
        self.init(
            value,
            in: bounds,
            valueLabel: { EmptyView() },
            minValueLabel: { Text(minValueText) },
            maxValueLabel: { Text(maxValueText) },
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with text labels for the value and range.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - valueText: A text that describes the current value and appears above the slider handle.
    ///   - minValueText: A text that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueText: A text that describes `bounds.upperBound` and appears below the slider on the right.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 50
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...100,
    ///             valueText: "Current",
    ///             minValueText: "0",
    ///             maxValueText: "100"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Rating rendering.](slider_all_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        valueText: String,
        minValueText: String,
        maxValueText: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where ValueLabel == Text, MinValueLabel == Text, MaxValueLabel == Text {
            self.init(
                value,
                in: bounds,
                valueLabel: { Text(valueText) },
                minValueLabel: { Text(minValueText) },
                maxValueLabel: { Text(maxValueText) },
                onEditingChanged: onEditingChanged
            )
    }

    // MARK: - Init with String and Step

    /// Creates a slider to select a value from a given range with a text value label,
    /// subject to a step increment.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - valueText: A text that describes the current value and appears above the slider handle.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 0.5
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...1,
    ///             step: 0.25,
    ///             valueText: "Value"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Rating rendering.](slider_value.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        step: Value.Stride,
        valueText: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where ValueLabel == Text, MinValueLabel == EmptyView, MaxValueLabel == EmptyView {
            self.init(
                value,
                in: bounds,
                step: step,
                valueLabel: { Text(valueText) },
                minValueLabel: { EmptyView() },
                maxValueLabel: { EmptyView() },
                onEditingChanged: onEditingChanged
            )
    }

    /// Creates a slider to select a value from a given range with text range labels,
    /// subject to a step increment.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - minValueText: A text that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueText: A text that describes `bounds.upperBound` and appears below the slider on the right.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 50
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...100,
    ///             step: 10,
    ///             minValueText: "Min",
    ///             maxValueText: "Max"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Rating rendering.](slider_range_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        step: Value.Stride,
        minValueText: String,
        maxValueText: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where ValueLabel == EmptyView, MinValueLabel == Text, MaxValueLabel == Text {
        self.init(
            value,
            in: bounds,
            step: step,
            valueLabel: { EmptyView() },
            minValueLabel: { Text(minValueText) },
            maxValueLabel: { Text(maxValueText) },
            onEditingChanged: onEditingChanged
        )
    }

    /// Creates a slider to select a value from a given range with text labels for the value and range,
    /// subject to a step increment.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - valueText: A text that describes the current value and appears above the slider handle.
    ///   - minValueText: A text that describes `bounds.lowerBound` and appears below the slider on the left.
    ///   - maxValueText: A text that describes `bounds.upperBound` and appears below the slider on the right.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var value: Double = 50
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSlider(
    ///             value: $value,
    ///             in: 0...100,
    ///             step: 10,
    ///             valueText: "Current",
    ///             minValueText: "0",
    ///             maxValueText: "100"
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkSliderIntent(.main)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Rating rendering.](slider_all_values.png)
    ///
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0...1,
        step: Value.Stride,
        valueText: String,
        minValueText: String,
        maxValueText: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where ValueLabel == Text, MinValueLabel == Text, MaxValueLabel == Text {
        self.init(
            value,
            in: bounds,
            step: step,
            valueLabel: { Text(valueText) },
            minValueLabel: { Text(minValueText) },
            maxValueLabel: { Text(maxValueText) },
            onEditingChanged: onEditingChanged
        )
    }
}
