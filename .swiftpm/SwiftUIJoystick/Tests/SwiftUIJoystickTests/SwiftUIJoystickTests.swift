import XCTest
@testable import SwiftUIJoystick

final class SwiftUIJoystickTests: XCTestCase {
    
    func testPolarPoint() {
        let point = PolarPoint(degrees: 10, distance: 10)
        XCTAssert(point.degrees == 10)
        XCTAssert(point.distance == 10)
    }
    
    func testRectRecognizer() {
        let testWidth: CGFloat = 100
        let monitor = JoystickMonitor(width: testWidth)
        let recognizer = JoystickGestureRecognizer(monitor: monitor, width: testWidth, type: .rect, locksInPlace: false)
        
        var validPoint = CGPoint(x: 22, y: 22)
        var invalidHighPoint = CGPoint(x: 222, y: 222)
        var invalidLowPoint = CGPoint(x: -222, y: -222)
        
        recognizer.getValidAxisCoordinate(for: &validPoint.x)
        recognizer.getValidAxisCoordinate(for: &validPoint.y)
        XCTAssert(validPoint.x == 22)
        XCTAssert(validPoint.y == 22)
        
        recognizer.getValidAxisCoordinate(for: &invalidHighPoint.x)
        recognizer.getValidAxisCoordinate(for: &invalidHighPoint.y)
        XCTAssert(invalidHighPoint.x != 222)
        XCTAssert(invalidHighPoint.y != 222)
        XCTAssert(invalidHighPoint.x == testWidth)
        XCTAssert(invalidHighPoint.y == testWidth)
        
        recognizer.getValidAxisCoordinate(for: &invalidLowPoint.x)
        recognizer.getValidAxisCoordinate(for: &invalidLowPoint.y)
        XCTAssert(invalidLowPoint.x != 222)
        XCTAssert(invalidLowPoint.y != 222)
        XCTAssert(invalidLowPoint.x == 0)
        XCTAssert(invalidLowPoint.y == 0)
    }
}
