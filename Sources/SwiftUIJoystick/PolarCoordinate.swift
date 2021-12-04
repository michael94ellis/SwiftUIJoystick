//
//  PolarCoordinate.swift
//  SwiftUIJoystick
//
//  Created by Michael Ellis on 12/4/21.
//

import SwiftUI

public protocol PolarCoordinate {
    /// The direction the thumb handle is pointing, up is 0° and right is 90°
    var degrees: CGFloat { get set }
    /// The thumb handle's distance from the center/origin
    var distance: CGFloat { get set }
    
}

public struct PolarPoint: PolarCoordinate {
    
    /// The direction from origin, up is 0° and right is 90°
    public var degrees: CGFloat
    /// The distance from center/origin
    public var distance: CGFloat
    
    public static let zero: PolarPoint = PolarPoint(degrees: 0, distance: 0)
    
    public init(degrees: CGFloat, distance: CGFloat) {
        self.degrees = degrees
        self.distance = distance
    }
    
}
