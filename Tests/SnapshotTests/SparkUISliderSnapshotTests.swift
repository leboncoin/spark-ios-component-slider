//
//  SparkUISliderSnapshotTests.swift
//  SparkComponentSliderSnapshotTests
//
//  Created by robin.lemaire on 29/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import UIKit
import SnapshotTesting
import Combine
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentSlider
import SparkTheming
import SparkTheme

final class SparkUISliderSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = SliderScenarioSnapshotTests.allCases.filter {
            $0 != .documentation
        }

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = self.component(configuration: configuration)

                let backgroundView = UIView()
                backgroundView.backgroundColor = .systemBackground
                backgroundView.translatesAutoresizingMaskIntoConstraints = false
                backgroundView.addSubview(view)
                backgroundView.widthAnchor.constraint(equalToConstant: 300).isActive = true
                NSLayoutConstraint.stickEdges(
                    from: view,
                    to: backgroundView,
                    insets: .init(all: 4)
                )

                self.assertSnapshot(
                    matching: backgroundView,
                    named: configuration.name,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName
                )
            }
        }
    }

    // MARK: - Component

    private func component(configuration: SliderConfigurationSnapshotTests) -> UIView {
        let slider = SparkUISlider(theme: self.theme)
        slider.intent = configuration.intent
        slider.value = 0.5
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.step = configuration.step ? 0.25 : nil

        // Configure content based on configuration
        switch configuration.content {
        case .withoutValues:
            break

        case .value:
            slider.valueText = "Value"

        case .otherValue:
            slider.attributedValueText = self.createAttributedText(value: 50)

        case .rangeValues:
            slider.minimumRangeValueText = "Min"
            slider.maximumRangeValueText = "Max"

        case .otherRangeValues:
            slider.attributedMinimumRangeValueText = self.createAttributedText(value: 0)
            slider.attributedMaximumRangeValueText = self.createAttributedText(value: 100)

        case .allValues:
            slider.valueText = "Current"
            slider.minimumRangeValueText = "Min"
            slider.maximumRangeValueText = "Max"

        case .otherAllValues:
            slider.attributedValueText = self.createAttributedText(value: 50)
            slider.attributedMinimumRangeValueText = self.createAttributedText(value: 0)
            slider.attributedMaximumRangeValueText = self.createAttributedText(value: 100)
        }

        return slider
    }

    // MARK: - Helper

    private func createAttributedText(value: Int) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()

        // Add value text
        let valueString = NSAttributedString(
            string: "\(value)",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14)
            ]
        )
        attributedString.append(valueString)

        // Add percent symbol in bold and blue
        let percentString = NSAttributedString(
            string: "%",
            attributes: [
                .font: UIFont.boldSystemFont(ofSize: 14),
                .foregroundColor: UIColor.systemBlue
            ]
        )
        attributedString.append(percentString)

        return attributedString
    }
}
