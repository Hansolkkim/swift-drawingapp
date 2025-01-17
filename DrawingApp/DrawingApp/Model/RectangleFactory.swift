//
//  RectangleFactory.swift
//  DrawingApp
//
//  Created by 김한솔 on 2022/02/28.
//

import Foundation

class RectangleFactory {
    
    public static func makeRandomRectangle(in frame: (width: Double, height: Double)) -> BasicShape {
        let size = Size(width: 150, height: 120)
        let point = Point.random(in: frame)
        let backgroundColor = BackgroundColor.random()
        let alpha = Alpha.random()
        
        let newRectangle = Rectangle(size: size, point: point, backgroundColor: backgroundColor, alpha: alpha)
        return newRectangle
    }
    
    public static func makePhoto(in frame: (width: Double, height: Double), image: Data) -> BasicShape {
        let size = Size(width: 150, height: 120)
        let point = Point.random(in: frame)
        let alpha = Alpha.random()
        
        let newPhoto = Photo(size: size, point: point, image: image, alpha: alpha)
        return newPhoto
    }
    
    public static func makeText(in frame: (width: Double, height: Double), text: String, size: Size) -> BasicShape {
        let text = text
        let size = size
        let point = Point.random(in: frame)
        let alpha = Alpha.random()
        
        let newText = Text(size: size, point: point, text: text, alpha: alpha)
        return newText
    }

}
