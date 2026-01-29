//
//  SparkSliderSnapshotTests.swift
//  SparkComponentSliderSnapshotTests
//
//  Created by robin.lemaire on 27/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentSlider
import SparkTheming
import SparkTheme

final class SparkSliderSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared
    @State var value: Double = 0.5

    // MARK: - Tests

    func test() {
        let scenarios = SliderScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = self.component(configuration: configuration)
                    .sparkTheme(self.theme)
                    .sparkSliderIntent(configuration.intent)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
                    .background(.background)
                    .frame(width: 300)
//                    .fixedSize()

                self.assertSnapshot(
                    matching: view,
                    named: configuration.name,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName,
                    forDocumentation: scenario.isDocumentation
                )
            }
        }
    }

    @ViewBuilder
    private func component(configuration: SliderConfigurationSnapshotTests) -> some View {
        let step: Double? = configuration.step ? 0.25 : nil

        switch configuration.content {
        case .withoutValues:
            if let step {
                SparkSlider(
                    value: self.$value,
                    in: 0...1,
                    step: step
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: 0...1
                )
            }

        case .value:
            if let step {
                SparkSlider(
                    value: self.$value,
                    in: 0...1,
                    step: step,
                    valueText: "Value"
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: 0...1,
                    valueText: "Value"
                )
            }

        case .otherValue:
            if let step {
                SparkSlider(
                    value: self.$value,
                    in: 0...1,
                    step: step,
                    valueLabel: {
                        OtherContentView(value: self.value)
                    }
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: 0...1,
                    valueLabel: {
                        OtherContentView(value: self.value)
                    }
                )
            }

        case .rangeValues:
            if let step {
                SparkSlider(
                    value: self.$value,
                    in: 0...1,
                    step: step,
                    minValueText: "Min",
                    maxValueText: "Max"
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: 0...1,
                    minValueText: "Min",
                    maxValueText: "Max"
                )
            }

        case .otherRangeValues:
            if let step {
                SparkSlider(
                    value: self.$value,
                    in: 0...1,
                    step: step,
                    minValueLabel: {
                        OtherContentView(value: 0)
                    },
                    maxValueLabel: {
                        OtherContentView(value: 100)
                    }
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: 0...1,
                    minValueLabel: {
                        OtherContentView(value: 0)
                    },
                    maxValueLabel: {
                        OtherContentView(value: 100)
                    }
                )
            }

        case .allValues:
            if let step {
                SparkSlider(
                    value: self.$value,
                    in: 0...1,
                    step: step,
                    valueText: "Current",
                    minValueText: "Min",
                    maxValueText: "Max"
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: 0...1,
                    valueText: "Current",
                    minValueText: "Min",
                    maxValueText: "Max"
                )
            }

        case .otherAllValues:
            if let step {
                SparkSlider(
                    value: self.$value,
                    in: 0...1,
                    step: step,
                    valueLabel: {
                        OtherContentView(value: self.value)
                    },
                    minValueLabel: {
                        OtherContentView(value: 0)
                    },
                    maxValueLabel: {
                        OtherContentView(value: 100)
                    }
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: 0...1,
                    valueLabel: {
                        OtherContentView(value: self.value)
                    },
                    minValueLabel: {
                        OtherContentView(value: 0)
                    },
                    maxValueLabel: {
                        OtherContentView(value: 100)
                    }
                )
            }
        }
    }
}

struct OtherContentView: View {
    let value: Double
    var body: some View {
        HStack {
            Text("\(Int(self.value * 100))")
            Text("%")
                .bold()
                .foregroundColor(.blue)
        }
    }
}
