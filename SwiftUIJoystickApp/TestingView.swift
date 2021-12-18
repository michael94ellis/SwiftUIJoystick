//
//  ContentView.swift
//  TestingView
//
//  Created by Michael Ellis on 12/3/21.
//

import SwiftUI
import SwiftUIJoystick

struct TestingView: View {
    
    /// For the Custom Joystick example
    @StateObject private var monitorLocking = JoystickMonitor()
    let widthLocking: CGFloat = 100
    /// For the Custom Joystick example
    @StateObject private var monitorRect = JoystickMonitor()
    let widthRect: CGFloat = 100
    /// For the Custom Joystick example
    @StateObject private var monitorCircle = JoystickMonitor()
    let widthCircle: CGFloat = 130
    
    var body: some View {
        VStack {
            
            // Example 1
            
            VStack {
                Text("Circle with Locking enabled")
                JoystickBuilder(
                    monitor: self.monitorLocking,
                    width: self.widthLocking,
                    shape: .circle,
                    background: {
                        Circle().fill(Color.blue.opacity(0.9))
                    },
                    foreground: {
                        Circle().fill(Color.black)
                    },
                    locksInPlace: true)
                Text("Diameter: \(widthLocking)")
                Text("XY Point = (x: \(self.monitorLocking.xyPoint.x.formattedString), y: \(self.monitorLocking.xyPoint.y.formattedString))")
                Text("Polar Point = (radians: \(self.monitorLocking.polarPoint.degrees.formattedString), y: \(self.monitorLocking.polarPoint.distance.formattedString)")
                
            }
            // Example 2
            Divider()
            VStack{
                Text("RoundedRectangle with Circle Thumb")
                JoystickBuilder(
                    monitor: self.monitorRect,
                    width: self.widthRect,
                    shape: .rect,
                    background: {
                        // Example Background
                        RoundedRectangle(cornerRadius: 8).fill(Color.red.opacity(0.5))
                    },
                    foreground: {
                        // Example Thumb
                        Circle().fill(Color.black)
                    },
                    locksInPlace: false)
                Text("Diameter: \(widthRect)")
                Text("XY Point = (x: \(self.monitorRect.xyPoint.x.formattedString), y: \(self.monitorRect.xyPoint.y.formattedString))")
                Text("Pola Point = (radians: \(self.monitorRect.polarPoint.degrees.formattedString), y: \(self.monitorRect.polarPoint.distance.formattedString)")
            }
            // Example 3
            Divider()
            VStack{
                Text("Circle with Rectangle Thumb")
                JoystickBuilder(
                    monitor: self.monitorCircle,
                    width: self.widthCircle,
                    shape: .circle,
                    background: {
                        // Example Background
                        Circle().fill(Color.green.opacity(0.5))
                    },
                    foreground: {
                        // Example Thumb
                        Text("TEXT").background(RoundedRectangle(cornerRadius: 4).fill(Color.gray)
                                                    .frame(width: 65, height: 42))
                            .frame(width: 65, height: 42)
                    },
                    locksInPlace: false)
                Text("Diameter: \(widthCircle)")
                Text("XY Point = (x: \(self.monitorCircle.xyPoint.x.formattedString), y: \(self.monitorCircle.xyPoint.y.formattedString))")
                Text("Polar Point = (radians: \(self.monitorCircle.polarPoint.degrees.formattedString), y: \(self.monitorCircle.polarPoint.distance.formattedString)")
            }
        }
    }
}
