//
//  SliderIntent.swift
//  SparkSlider
//
//  Created by louis.borlee on 23/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// The various intents of sliders.
@frozen
public enum SliderIntent: CaseIterable {
    case basic
    case success
    case error
    case alert
    case accent
    case main
    case neutral
    case support
    case info
}
