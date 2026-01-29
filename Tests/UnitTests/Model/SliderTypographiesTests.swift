//
//  SliderTypographiesTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentSlider
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class SliderTypographiesTests: XCTestCase {

    // MARK: - Tests

    func test_default_initialization() {
        // GIVEN / WHEN
        let typographies = SliderTypographies()

        // THEN
        XCTAssertTrue(typographies.valueFontToken.equals(TypographyFontTokenClear()))
        XCTAssertTrue(typographies.rangeValuesFontToken.equals(TypographyFontTokenClear()))
    }

    func test_equality_when_same_typographies() {
        // GIVEN / WHEN
        let valueFontToken = TypographyFontTokenGeneratedMock.body()
        let rangeValuesFontToken = TypographyFontTokenGeneratedMock.title()

        let typographies1 = SliderTypographies(
            valueFontToken: valueFontToken,
            rangeValuesFontToken: rangeValuesFontToken
        )

        let typographies2 = SliderTypographies(
            valueFontToken: valueFontToken,
            rangeValuesFontToken: rangeValuesFontToken
        )

        // THEN
        XCTAssertEqual(typographies1, typographies2)
    }

    func test_inequality_when_different_value_font() {
        // GIVEN / WHEN
        let valueFontToken1 = TypographyFontTokenGeneratedMock.body()
        let valueFontToken2 = TypographyFontTokenGeneratedMock.footnote()
        let rangeValuesFontToken = TypographyFontTokenGeneratedMock.title()

        let typographies1 = SliderTypographies(
            valueFontToken: valueFontToken1,
            rangeValuesFontToken: rangeValuesFontToken
        )

        let typographies2 = SliderTypographies(
            valueFontToken: valueFontToken2,
            rangeValuesFontToken: rangeValuesFontToken
        )

        // THEN
        XCTAssertNotEqual(typographies1, typographies2)
    }

    func test_inequality_when_different_rangeValues_font() {
        // GIVEN / WHEN
        let valueFontToken = TypographyFontTokenGeneratedMock.body()
        let rangeValuesFontToken1 = TypographyFontTokenGeneratedMock.footnote()
        let rangeValuesFontToken2 = TypographyFontTokenGeneratedMock.callout()

        let typographies1 = SliderTypographies(
            valueFontToken: valueFontToken,
            rangeValuesFontToken: rangeValuesFontToken1
        )

        let typographies2 = SliderTypographies(
            valueFontToken: valueFontToken,
            rangeValuesFontToken: rangeValuesFontToken2
        )

        // THEN
        XCTAssertNotEqual(typographies1, typographies2)
    }
}
