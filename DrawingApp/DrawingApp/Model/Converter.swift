//
//  Converter.swift
//  DrawingApp
//
//  Created by 김한솔 on 2022/03/07.
//

import Foundation
import UIKit

struct Converter {
    public static func convertToUIColor(backgroundColor: BackgroundColor, alpha: Double = 1.0) -> UIColor {
        let maximumColorValue = 255.0
        let red = backgroundColor.r / maximumColorValue
        let green = backgroundColor.g / maximumColorValue
        let blue = backgroundColor.b / maximumColorValue
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    

}