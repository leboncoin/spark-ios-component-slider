//
//  SliderColors+ExtensionTests.swift
//  SparkSlider
//
//  Created by louis.borlee on 08/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkSlider
import SparkTheming

extension SliderColors {
    static func mocked(colors: Colors) -> SliderColors {
        return .init(
            track: colors.feedback.alert,
            indicator: colors.accent.accentVariant,
            handle: colors.states.neutralPressed,
            handleActiveIndicator: colors.basic.onBasicContainer
        )
    }
}
