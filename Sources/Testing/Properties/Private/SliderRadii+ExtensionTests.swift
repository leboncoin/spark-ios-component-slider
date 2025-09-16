//
//  SliderRadii+ExtensionTests.swift
//  SparkComponentSliderUnitTests
//
//  Created by louis.borlee on 08/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentSlider

extension SliderRadii {
    static func mocked() -> SliderRadii {
        return .init(
            trackRadius: 0.123,
            indicatorRadius: 49.3
        )
    }
}
