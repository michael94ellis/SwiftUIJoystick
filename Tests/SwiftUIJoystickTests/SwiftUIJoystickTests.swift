import XCTest
@testable import SwiftUIJoystick
import SwiftUI

final class SwiftUIJoystickTests: XCTestCase {
    
    @State var thumb: CGPoint = .zero
    
    func testPolarPointZero() throws {
        // Ensure the .zero var is correct
        XCTAssert(PolarPoint.zero.degrees == 0)
        XCTAssert(PolarPoint.zero.distance == 0)
    }
    func testPolarPointConstructor() throws {
        // Test the constructor for an arbitrary value
        let testPoint = PolarPoint(degrees: 9, distance: 9)
        XCTAssert(testPoint.degrees == 9)
        XCTAssert(testPoint.distance == 9)
    }
    
    func testCGPointGetPolarPoint() throws {
        let testCGPoint = CGPoint(x: 1, y: 0)
        let testPoint = testCGPoint.getPolarPoint()
        XCTAssert(testPoint.degrees == 0)
        XCTAssert(testPoint.distance == 1)
    }
}
