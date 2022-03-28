//
//  PlaneTests.swift
//  DrawingAppTests
//
//  Created by 김한솔 on 2022/03/07.
//

import XCTest

class PlaneTests: XCTestCase {
    
    var plane: Plane?

    override func setUpWithError() throws {
        self.plane = Plane()
    }

    override func tearDownWithError() throws {
        self.plane = nil
    }

    func testAddRectangle() throws {
        plane?.addNewRectangle(in: (width: 1, height: 1))
        
        XCTAssertEqual(plane?.count, 1)
        
        plane?.addNewRectangle(in: (width: 1, height: 1))
        
        XCTAssertNotEqual(plane?.count, 1)
    }
    
    func testSpecifyRectangle() throws {
        plane?.addNewRectangle(in: (width: 1, height: 1))
        let targetPoint1 = Point(x: 1, y: 1)
        let result1 = plane?.specifyRectangle(point: targetPoint1)
        switch result1 {
            case .success(let response):
                XCTAssertTrue(response is AnyRectangularable & BackgroundColorChangable)
            default:
                throw PlaneTestError.specifyingError
        }
        XCTAssertNotNil(targetPoint1)
        
        let targetPoint2 = Point(x: 2000, y: 2000)
        let result2 = plane?.specifyRectangle(point: targetPoint2)
        switch result2 {
            case .failure(let error):
                XCTAssertEqual(error, PlaneError.cannotSpecifyRectangleError)
            default:
                throw PlaneTestError.specifyingError
        }
    }
    
    func testChangeBackgroundColorOfRectangle() throws {
        
//        let newID = ID()
//        guard let previousColor = BackgroundColor(r: 0, g: 0, b: 0),
//              let changingColor = BackgroundColor(r: 10, g: 10, b: 100) else {
//            throw PlaneError.backgroundColorError
//        }
//        guard let alpha = Alpha(opacityLevel: 10) else {
//            throw PlaneError.alphaError
//        }
//        let newRectangle = Rectangle(id: newID, width: 100, height: 150, x: 0, y: 0, backgroundColor: previousColor, alpha: alpha)
//
//        plane?.addSpecificRectangle(newRectangle)
//
//        guard let backgroundColorChangedRectangle = plane?.changeBackGroundColorOfRectangle(id: newID, to: changingColor) else {
//            throw PlaneError.backgroundColorChangingError
//        }
//
//        XCTAssertEqual(backgroundColorChangedRectangle.backgroundColor, changingColor)
//        XCTAssertNotEqual(backgroundColorChangedRectangle.backgroundColor, previousColor)
    }
    
    func testChangeAlphaOfRectangle() throws {
//        let newID = ID()
//        guard let backgroundColor = BackgroundColor(r: 0, g: 0, b: 0) else {
//            throw PlaneError.backgroundColorError
//        }
//        guard let previousAlpha = Alpha(opacityLevel: 10),
//        let changingAlpha = Alpha(opacityLevel: 1) else {
//            throw PlaneError.alphaError
//        }
//        let newRectangle = Rectangle(id: newID, width: 100, height: 150, x: 0, y: 0, backgroundColor: backgroundColor, alpha: previousAlpha)
//
//        plane?.addSpecificRectangle(newRectangle)
//
//        guard let alphaChangedRectangle = plane?.changeAlphaValueOfRectangle(id: newID, to: changingAlpha) else {
//            throw PlaneError.alphaChangingError
//        }
//
//        XCTAssertEqual(alphaChangedRectangle.alpha, changingAlpha)
//        XCTAssertNotEqual(alphaChangedRectangle.alpha, previousAlpha)
    }


}

enum PlaneTestError: Error {
    case backgroundColorError
    case alphaError
    case specifyingError
    case backgroundColorChangingError
    case alphaChangingError
}
