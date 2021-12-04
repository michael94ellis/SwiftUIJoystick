//
//  JoystickMonitor.swift
//  SwiftUIJoystick
//
//  Created by Michael Ellis on 12/4/21.
//

import SwiftUI

public class JoystickMonitor: ObservableObject {
    @Published public var xyPoint: CGPoint
    @Published public var polarPoint: PolarPoint = .zero
    
    public init(width: CGFloat) {
        let radius = width / 2
        self.xyPoint = CGPoint(x: radius, y: radius)
    }
    
    public init(diameter: CGFloat) {
        let radius = diameter / 2
        self.xyPoint = CGPoint(x: radius, y: radius)
    }
}
