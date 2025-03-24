//
//  SliderGetColorsUseCasableGeneratedMock+ExtensionTests.swift
//  SparkSliderUnitTests
//
//  Created by louis.borlee on 06/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkSlider

extension SliderGetColorsUseCasableGeneratedMock {
    static func mocked(returnedColors colors: SliderColors) -> SliderGetColorsUseCasableGeneratedMock {
        let mock = SliderGetColorsUseCasableGeneratedMock()
        mock._executeWithThemeAndIntent = { _, _ in
            return colors
        }
        return mock
    }
}
