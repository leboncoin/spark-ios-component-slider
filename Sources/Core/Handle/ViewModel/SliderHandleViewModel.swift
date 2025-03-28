//
//  SliderHandleViewModel.swift
//  SparkSlider
//
//  Created by louis.borlee on 23/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming
import Combine

final class SliderHandleViewModel: ObservableObject {

    @Published var color: any ColorToken
    @Published var activeIndicatorColor: any ColorToken

    init(color: some ColorToken,
         activeIndicatorColor: some ColorToken) {
        self.color = color
        self.activeIndicatorColor = activeIndicatorColor
    }
}
