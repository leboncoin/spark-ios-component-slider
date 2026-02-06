//
//  SliderGetColorsUseCase.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// TODO: Test

// sourcery: AutoMockable, AutoMockTest
protocol SliderGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, intent: SliderIntent) -> SliderColors
}

struct SliderGetColorsUseCase: SliderGetColorsUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, intent: SliderIntent) -> SliderColors {
        let colors = theme.colors
        let dims = theme.dims

        let tintColorToken: any ColorToken = switch intent {
        case .basic: colors.basic.basic
        case .accent: colors.accent.accent
        case .main: colors.main.main
        case .neutral: colors.feedback.neutral
        case .support: colors.support.support
        case .info: colors.feedback.info

            // Deprecated cases
        case .success: colors.feedback.success
        case .error: colors.feedback.error
        case .alert: colors.feedback.alert
        }

        let textColorToken = colors.base.onSurface

        return SliderColors(
            tintColorToken: tintColorToken,
            titleColorToken: textColorToken,
            valueColorToken: textColorToken,
            rangeValuesColorToken: textColorToken.opacity(dims.dim1)
        )
    }
}
