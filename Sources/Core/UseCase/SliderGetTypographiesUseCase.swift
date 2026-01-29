//
//  SliderGetTypographiesUseCase.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol SliderGetTypographiesUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> SliderTypographies
}

struct SliderGetTypographiesUseCase: SliderGetTypographiesUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> SliderTypographies {
        let typography = theme.typography

        return SliderTypographies(
            valueFontToken: typography.body2Highlight,
            rangeValuesFontToken: typography.body2
        )
    }
}
