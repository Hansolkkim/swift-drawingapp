//
//  AnyRectangularable.swift
//  DrawingApp
//
//  Created by 김한솔 on 2022/03/15.
//

import Foundation

protocol Rectangularable {
    var id: ID {get}
    var size: Size {get}
    var point: Point {get}
    var alpha: Alpha {get}
    func isPointInArea(_ point: Point) -> Bool
    func changeAlphaValue(to newAlpha: Alpha)
    func move(to newPoint: Point)
    func resize(to newSize: Size)
}

class AnyRectangularable: Rectangularable {
    private(set) var id: ID
    private(set) var size: Size
    private(set) var point: Point
    private(set) var alpha: Alpha
    
    init(size: Size, point: Point, alpha: Alpha) {
        self.id = ID()
        self.size = size
        self.point = point
        self.alpha = alpha
    }
    
    func isPointInArea(_ point: Point) -> Bool {
        return point.x >= self.point.x && point.x <= self.point.x + self.size.width &&
            point.y >= self.point.y && point.y <= self.point.y + self.size.height
    }
    
    func changeAlphaValue(to newAlpha: Alpha) {
        self.alpha = newAlpha
    }
    
    func move(to newPoint: Point) {
        self.point = newPoint
    }
    
    func resize(to newSize: Size) {
        self.size = newSize
    }
}

extension AnyRectangularable: CustomStringConvertible {
    var description: String {
        return "\(id) Rectangle, \(point), \(size), \(alpha)"
    }
}

extension AnyRectangularable: Equatable {
    static func == (lhs: AnyRectangularable, rhs: AnyRectangularable) -> Bool {
        return lhs === rhs
    }
}

extension AnyRectangularable: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
