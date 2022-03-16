//
//  PhotoView.swift
//  DrawingApp
//
//  Created by 김한솔 on 2022/03/14.
//

import UIKit

class PhotoView: UIImageView, RectangleViewable {
    
    init(frame: CGRect, alpha: CGFloat, image: UIImage) {
        super.init(frame: frame)
        self.alpha = alpha
        self.image = image
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.alpha = 1.0
        self.image = UIImage()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.alpha = 1.0
        self.image = UIImage()
    }
    
    func changeBackgroundColor(to newColor: UIColor) {
        self.backgroundColor = newColor
    }
    
    func changeAlphaValue(to newAlphaValue: CGFloat) {
        self.alpha = newAlphaValue
    }
    
    func copyToNewInstance() -> UIView & RectangleViewable {
        let frame = self.frame
        let alpha = self.alpha
        let image = self.image ?? UIImage()
        
        return PhotoView(frame: frame, alpha: alpha, image: image)
    }
    
    func move(distance: CGPoint) {
        self.frame = self.frame.offsetBy(dx: distance.x, dy: distance.y)
    }
    
    func move(to newPoint: CGPoint) {
        self.center.x = newPoint.x
        self.center.y = newPoint.y
    }
    
}
