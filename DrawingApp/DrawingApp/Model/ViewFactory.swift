//
//  ViewFactory.swift
//  DrawingApp
//
//  Created by 김한솔 on 2022/03/03.
//

import Foundation
import UIKit

class ViewFactory {
    static func makeRectangleView(of rectangle: AnyRectangularable & BackgroundColorChangable) -> UIView & RectangleViewable {
        let point = rectangle.point
        let size = rectangle.size
        let frame = CGRect(x: point.x, y: point.y, width: size.width, height: size.height)
        let backgroundColor = rectangle.backgroundColor
        let convertedColor = backgroundColor.convertToUIColor()
        let alpha = CGFloat(rectangle.alpha.value)
        
        let newView = RectangleView(frame: frame, backgroundColor: convertedColor, alpha: alpha)
        
        return newView
    }
    
    static func makePhotoView(of photo: AnyRectangularable & imageDataHavable) -> UIView & RectangleViewable {
        let point = photo.point
        let size = photo.size
        let frame = CGRect(x: point.x, y: point.y, width: size.width, height: size.height)
        let alpha = CGFloat(photo.alpha.value)
        let image = photo.image
        
        let newView = PhotoView(frame: frame, alpha: alpha, image: UIImage(data: image) ?? UIImage())
        newView.clipsToBounds = true
        newView.contentMode = .scaleAspectFill
        
        return newView
    }
    
}

extension BackgroundColor {
    fileprivate func convertToUIColor(with alphaValue: Float = 1.0) -> UIColor {
        let convertedRed = Double(self.r) / 255.0
        let convertedGreen = Double(self.g) / 255.0
        let convertedBlue = Double(self.b) / 255.0
        
        return UIColor(red: convertedRed, green: convertedGreen, blue: convertedBlue, alpha: CGFloat(alphaValue))
    }
}
