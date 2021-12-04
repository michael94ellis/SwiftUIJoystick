//
//  JoystickBuilder.swift
//  SwiftUIJoystick
//
//  Created by Michael Ellis on 12/4/21.
//

import SwiftUI

/// A convenience SwiftUI struct to make a Joystick control
public struct JoystickBuilder<background: View, foreground: View>: View {
    
    /// The width of the joystick control area, for a circular Joystick this is the diameter
    private(set) public var width: CGFloat
    /// The shape of the hitbox for the position output of the Joystick Thumb position
    private(set) public var controlShape: JoystickShape
    
    @ObservedObject private(set) public var joystickMonitor: JoystickMonitor
    /// The view displayed as the Joystick background, which also holds a Joystick DragGesture recognizer
    @ViewBuilder public var controlBackground: () -> background
    /// The view displayed as the Joystick Thumb Control, which also holds a Joystick DragGesture recognizer
    @ViewBuilder public var controlThumb: () -> foreground
    /// Determines whether or not the Joystick Thumb control goes back to the center point when released
    private let locksInPlace: Bool
    
    /// Creates a custom joystick with two views that are passed to it
    ///
    ///     parameter position: Will output the valid position of the thumb on the Joystick, from 0 to width
    ///     parameter width: Width of the joystick control area, for a circular Joystick this is the diameter
    ///     parameter shape: Shape of the hitbox for the position output of the Joystick Thumb position
    ///     parameter background: The view displayed as the Joystick background
    ///     parameter foreground: The view displayed as the Joystick Thumb Control
    ///     parameter locksInPlace: Determines if the thumb control returns to the center point when released
    public init(monitor: JoystickMonitor, width: CGFloat, shape: JoystickShape, @ViewBuilder background: @escaping () -> background, @ViewBuilder foreground: @escaping () -> foreground, locksInPlace locks: Bool) {
        self.joystickMonitor = monitor
        self.width = width
        self.controlShape = shape
        self.controlBackground = background
        self.controlThumb = foreground
        self.locksInPlace = locks
    }
    
    public var body: some View {
        controlBackground()
            .frame(width: self.width, height: self.width)
            .joystickGestureRecognizer(monitor: self.joystickMonitor, width: self.width, shape: self.controlShape, locksInPlace: self.locksInPlace)
            .overlay(
                controlThumb()
                    .frame(width: self.width / 4, height: self.width / 4)
                    .position(x: self.joystickMonitor.xyPoint.x, y: self.joystickMonitor.xyPoint.y)
                    .joystickGestureRecognizer(monitor: self.joystickMonitor, width: self.width, shape: self.controlShape, locksInPlace: self.locksInPlace)
            )
    }
}
