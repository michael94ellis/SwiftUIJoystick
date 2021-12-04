//
//  ExampleUse.swift
//  SwiftUIJoystick
//
//  Created by Michael Ellis on 12/4/21.
//

import SwiftUI
import SwiftUIJoystick

struct ExampleUse: View {
    
    /// For the Custom Joystick example
    @StateObject private var monitor = JoystickMonitor(width: 100)
    
    
    var body: some View {
        VStack {
            Text("Example easy to customize Joystick")
            Joystick(monitor: monitor, width: 100)
            Text("XY Point = (x: \(monitor.xyPoint.x.formattedString), y: \(monitor.xyPoint.y.formattedString))")
                .fixedSize()
            Text("Polar Point = (radians: \(monitor.polarPoint.degrees.formattedString), y: \(monitor.polarPoint.distance.formattedString)")
                .fixedSize()
        }
    }
}

public extension CGFloat {
    var formattedString: String {
        String(format: "%.2f", self)
    }
}
