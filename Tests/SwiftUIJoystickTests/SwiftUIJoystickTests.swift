import XCTest
@testable import SwiftUIJoystick

final class SwiftUIJoystickTests: XCTestCase {
    
    func testPolarPoint() throws {
        XCTAssert(PolarPoint.zero.degrees == 0)
        XCTAssert(PolarPoint.zero.distance == 0)
        var testPoint = PolarPoint(degrees: 9, distance: 9)
        XCTAssert(testPoint.degrees == 9)
        XCTAssert(testPoint.distance == 9)
        
        let testCGPoint = CGPoint(x: 1, y: 0)
        testPoint = testCGPoint.getPolarPoint()
        XCTAssert(testPoint.degrees == 0)
        XCTAssert(testPoint.distance == 1)
    }
    
    func testRectGesture() throws {
        let testWidth: CGFloat = 100
        let validTestValue: CGFloat = 10
        let invalidTestValueHigh: CGFloat = 300
        let invalidTestValueLow: CGFloat = -300
        
        let monitor = JoystickMonitor(width: testWidth)
        let recognizer = JoystickGestureRecognizer(monitor: monitor, width: testWidth, type: .rect, locksInPlace: false)
        
        // valid
        var testPoint = CGPoint(x: validTestValue,y: validTestValue)
        recognizer.getValidAxisCoordinate(for: &testPoint.x)
        XCTAssert(testPoint.x == validTestValue)
        recognizer.getValidAxisCoordinate(for: &testPoint.y)
        XCTAssert(testPoint.y == validTestValue)
        
        // too Low
        testPoint = CGPoint(x: invalidTestValueLow, y: invalidTestValueLow)
        recognizer.getValidAxisCoordinate(for: &testPoint.x)
        XCTAssert(testPoint.x != invalidTestValueLow)
        XCTAssert(testPoint.x == 0)

        recognizer.getValidAxisCoordinate(for: &testPoint.y)
        XCTAssert(testPoint.y != invalidTestValueLow)
        XCTAssert(testPoint.y == 0)
        // too high
        testPoint = CGPoint(x: invalidTestValueHigh, y: invalidTestValueHigh)
        recognizer.getValidAxisCoordinate(for: &testPoint.x)
        XCTAssert(testPoint.x != invalidTestValueHigh)
        XCTAssert(testPoint.x == testWidth)
        recognizer.getValidAxisCoordinate(for: &testPoint.y)
        XCTAssert(testPoint.y != invalidTestValueHigh)
        XCTAssert(testPoint.y == testWidth)
        
    }
}
