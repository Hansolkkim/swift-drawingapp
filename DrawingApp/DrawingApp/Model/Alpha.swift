//
//  Alpha.swift
//  DrawingApp
//
//  Created by 김한솔 on 2022/03/02.
//

import Foundation

struct Alpha: Equatable {
    let value: Double
    static let possibleOpacityLevels = 1...10
    static let possibleAlphaValues = stride(from: 0.1, to: 1.0, by: 0.01)
    
    init?(opacityLevel: Int) {
        let min = Alpha.possibleOpacityLevels.min() ?? 1
        let max = Alpha.possibleOpacityLevels.max() ?? 10
        
        if opacityLevel > max {
            return nil
        } else if opacityLevel < min {
            return nil
        } else {
            self.value = Double(opacityLevel) / Double(10)
        }

    }
}

extension Alpha: CustomStringConvertible {
    var description: String {
        return "Alpha: \(value)"
    }
}
