//
//  RectangleView.swift
//  DrawingApp
//
//  Created by 김한솔 on 2022/03/04.
//

import UIKit

protocol RectangleViewable: BoundaryExpressable, Movable, Copyable, Resizable{
    var alpha: CGFloat {get}
    var frame: CGRect {get}
    func changeAlphaValue(to newAlphaValue: CGFloat)
}

protocol BoundaryExpressable {
    func hideBoundary()
    func showBoundary()
}

protocol ViewBackgroundColorChangable {
    var backgroundColor: UIColor? {get set}
    func changeBackgroundColor(to newColor: UIColor)
}

protocol Movable {
    func move(distance: CGPoint)
    func move(to newPoint: CGPoint)
}

protocol Copyable {
    func copy() -> RectangleViewable
}

protocol Resizable {
    func resize(to newSize: (width: CGFloat, height: CGFloat))
}

class RectangleView: UIView, RectangleViewable, ViewBackgroundColorChangable {
    
    override var description: String {
        return "Frame = \(frame); alpha = \(alpha); backgroundColor = \(backgroundColor ?? .white)"
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(frame: CGRect, backgroundColor: UIColor, alpha: CGFloat) {
        super.init(frame: frame)
        self.backgroundColor = backgroundColor
        self.alpha = alpha
    }
    
    func hideBoundary() {
        self.layer.borderWidth = 0
    }
    
    func showBoundary() {
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    func changeBackgroundColor(to newColor: UIColor) {
        self.backgroundColor = newColor
    }
    
    func changeAlphaValue(to newAlphaValue: CGFloat) {
        self.alpha = newAlphaValue
    }
    
    func move(distance: CGPoint) {
        self.frame = self.frame.offsetBy(dx: distance.x, dy: distance.y)
    }
    
    func move(to newPoint: CGPoint) {
        self.frame.origin.x = newPoint.x
        self.frame.origin.y = newPoint.y
    }
    
    func copy() -> RectangleViewable {
        let newBackgroundColor = self.backgroundColor?.copy() as? UIColor ?? UIColor.white
        
        return RectangleView.init(frame: self.frame, backgroundColor: newBackgroundColor, alpha: self.alpha)
    }
    
    func resize(to newSize: (width: CGFloat, height: CGFloat)) {
        let newFrame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y,
                              width: newSize.width, height: newSize.height)
        self.frame = newFrame
    }
}
