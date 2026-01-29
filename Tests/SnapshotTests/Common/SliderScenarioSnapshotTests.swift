//
//  SliderScenarioSnapshotTests.swift
//  SparkComponentSliderSnapshotTests
//
//  Created by robin.lemaire on 27/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSlider
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum SliderScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Configurations

    func configuration() -> [SliderConfigurationSnapshotTests] {
        switch self {
        case .test1:
            return self.test1()
        case .test2:
            return self.test2()
        case .test3:
            return self.test3()
        case .test4:
            return self.test4()
        case .documentation:
            return self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: To test all intents
    ///
    /// Content:
    ///  - intents: all
    ///  - content: default
    ///  - step: default
    ///  - mode: all
    ///  - size: default
    private func test1() -> [SliderConfigurationSnapshotTests] {
        let intents = SliderIntent.allCases

        return intents.map { intent in
            .init(
                scenario: self,
                intent: intent,
                modes: Constants.Modes.all
            )
        }
    }

    /// Test 2
    ///
    /// Description: To test all contents and step
    ///
    /// Content:
    ///  - intents: default
    ///  - content: all
    ///  - step: all (true and false)
    ///  - mode: default
    ///  - size: default
    private func test2() -> [SliderConfigurationSnapshotTests] {
        let contents = SliderContent.allCases
        let steps = Bool.allCases

        return contents.flatMap { content in
            steps.map { step in
                .init(
                    scenario: self,
                    content: content,
                    step: step
                )
            }
        }
    }

    /// Test 3
    ///
    /// Description: To test a11y sizes
    ///
    /// Content:
    ///  - intents: default
    ///  - content: allValues
    ///  - step: default
    ///  - mode: default
    ///  - size: all
    private func test3() -> [SliderConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                content: .allValues,
                sizes: Constants.Sizes.all
            )
        ]
    }

    /// Test 4
    ///
    /// Description: To test modes
    ///
    /// Content:
    ///  - intents: default
    ///  - content: allValues
    ///  - step: default
    ///  - mode: all
    ///  - size: default
    private func test4() -> [SliderConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                content: .allValues,
                modes: Constants.Modes.all
            )
        ]
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [SliderConfigurationSnapshotTests] {
        var items: [SliderConfigurationSnapshotTests] = []

        // Default
        items.append(.init(
            scenario: self,
            documentationName: "default"
        ))

        // All contents with documentationName
        let contents = SliderContent.allCases.filter { $0.documentationName != nil }
        items.append(contentsOf: contents.map { content in
            SliderConfigurationSnapshotTests(
                scenario: self,
                content: content,
                documentationName: content.documentationName
            )
        })

        return items
    }
}
