//
//  JoystickMonitor.swift
//  SwiftUIJoystick
//
//  Created by Michael Ellis on 12/4/21.
//

import SwiftUI

public class JoystickMonitor: ObservableObject {
    @Published public var xyPoint: CGPoint = .zero
    @Published public var polarPoint: PolarPoint = .zero
    
    public init() { }
}
