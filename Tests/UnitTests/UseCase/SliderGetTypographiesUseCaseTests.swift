//
//  SliderGetTypographiesUseCaseTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSlider
@_spi(SI_SPI) import SparkThemingTesting
import XCTest

final class SliderGetTypographiesUseCaseTests: XCTestCase {

    // MARK: - Private properties

    private var sut: SliderGetTypographiesUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = SliderGetTypographiesUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func test_execute_returns_correct_typographies() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme)

        // THEN
        XCTAssertTrue(result.valueFontToken.equals(self.theme.typography.body2Highlight))
        XCTAssertTrue(result.rangeValuesFontToken.equals(self.theme.typography.body2))
    }
}
