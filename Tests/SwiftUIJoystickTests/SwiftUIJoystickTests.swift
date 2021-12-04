import XCTest
@testable import SwiftUIJoystick

final class SwiftUIJoystickTests: XCTestCase {
    
    func testPolarPoint() throws {
        XCTAssert(PolarPoint.zero.degrees == 0)
        XCTAssert(PolarPoint.zero.distance == 0)
        var testPoint = PolarPoint(degrees: 9, distance: 9)
        XCTAssert(testPoint.degrees == 9)
        XCTAssert(testPoint.distance == 9)
        
        var testCGPoint = CGPoint(x: 1, y: 0)
        testPoint = testCGPoint.getPolarPoint()
        XCTAssert(testPoint.degrees == 0)
        XCTAssert(testPoint.distance == 1)
    }
}
