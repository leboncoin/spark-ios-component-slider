//
//  SliderConfigurationSnapshotTests.swift
//  SparkComponentSliderSnapshotTests
//
//  Created by robin.lemaire on 27/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentSlider
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct SliderConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: SliderScenarioSnapshotTests

    var intent: SliderIntent = .default
    var content: SliderContent = .default
    var step: Bool = false

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        return [
            "\(self.intent)" + "Intent",
            "\(self.content)" + "Content",
            self.step ? "withStep" : nil
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "slider_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}

// MARK: - Enum

enum SliderContent: String, CaseIterable {
    case withoutValues
    case value
    case otherValue
    case rangeValues
    case otherRangeValues
    case allValues
    case otherAllValues

    static var `default` = Self.withoutValues

    var documentationName: String? {
        switch self {
        case .value: "value"
        case .rangeValues: "range_values"
        case .allValues: "all_values"
        default: nil
        }
    }
}
