//
//  JoystickRecognizer.swift
//  SwiftUIJoystick
//
//  Created by Michael Ellis on 12/4/21.
//

import SwiftUI

/// A convenience SwiftUI ViewModifier to make a view behave like a Joystick
public struct JoystickGestureRecognizer: ViewModifier {
    
    @ObservedObject public var joystickMonitor: JoystickMonitor
    /// The size of the control area in which the drag gesture is monitored and reported, is diameter for a circular Joystick
    private var width: CGFloat
    /// The shape of the hitbox for the position output of the Joystick Thumb position
    private var shapeType: JoystickShape
    /// The center point of the Joystick where it goes to rest when not being used in `locksInPlace` is false
    private let midPoint: CGPoint
    /// Determines whether or not the Joystick Thumb control goes back to the center point when released
    private let locksInPlace: Bool
    @Binding private(set) public var thumbPosition: CGPoint
    
    /// Creates a custom joystick with the following configuration
    ///
    ///     parameter joystickMonitor: An object used to monitor the valid position of the thumb on the Joystick
    ///     parameter width: Width of the joystick control area, for a circular Joystick this is the diameter
    ///     parameter type: Shape of the hitbox for the position output of the Joystick Thumb position
    ///     parameter background: The view displayed as the Joystick background
    ///     parameter foreground: The view displayed as the Joystick Thumb Control
    ///     parameter locksInPlace: Determines if the thumb control returns to the center point when released
    public init(thumbPosition: Binding<CGPoint>, monitor: JoystickMonitor, width: CGFloat, type: JoystickShape, locksInPlace locks: Bool) {
        self.joystickMonitor = monitor
        self._thumbPosition = thumbPosition
        self.width = width
        self.midPoint = CGPoint(x: width / 2, y: width / 2)
        self.shapeType = type
        self.locksInPlace = locks
    }
    
    /// Produce the correct shape of Joystick
    public func body(content: Content) -> some View {
        switch self.shapeType {
        case .rect:
            rectBody(content)
        case .circle:
            circleBody(content)
        }
    }
    
    internal func getValidThumbCoordinate(for value: inout CGFloat) {
        if value <= 0 {
            value = 0
        } else if value > width {
            value = self.width
        }
    }
    
    internal func validateCoordinate(_ emitPoint: inout CGPoint) {
        if emitPoint.x > width {
            emitPoint.x = width
        } else if emitPoint.x < -width {
            emitPoint.x = -width
        }
        if emitPoint.y > width {
            emitPoint.y = width
        } else if emitPoint.y < -width {
            emitPoint.y = -width
        }
    }
    
    /// Sets the coordinates of the user's thumb to the JoystickMonitor, which emits an object change since it is an observable
    internal func emitPosition(for xyPoint: CGPoint) {
        var emitPoint = xyPoint
        validateCoordinate(&emitPoint)
        self.joystickMonitor.xyPoint = emitPoint
        self.joystickMonitor.polarPoint = emitPoint.getPolarPoint(from: self.midPoint)
    }
    
    /// Provides a Rectangular area in which the Joystick control can move within and report values for
    ///
    /// - parameter content: The view for which to apply the Joystick listener/DragGesture
    public func rectBody(_ content: Content) -> some View {
        content
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged({ value in
                        var thumbX = value.location.x
                        var thumbY = value.location.y
                        self.getValidThumbCoordinate(for: &thumbX)
                        self.getValidThumbCoordinate(for: &thumbY)
                        self.thumbPosition = CGPoint(x: thumbX, y: thumbY)
                        let emitX = value.location.x - self.midPoint.x
                        let emitY = value.location.y - self.midPoint.y
                        self.emitPosition(for: CGPoint(x: emitX, y: emitY))
                    })
                    .onEnded({ value in
                        if !locksInPlace {
                            self.thumbPosition = self.midPoint
                            self.emitPosition(for: .zero)
                        }
                    })
            )
    }
    
    /// Provides a Circular area in which the Joystick control can move within and report values forr
    ///
    /// - parameter content: The view for which to apply the Joystick listener/DragGesture
    public func circleBody(_ content: Content) -> some View {
        content
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged() { value in
                        let distance = self.midPoint.distance(to: value.location)
                        if distance > self.width / 2 {
                            // Limit to radius
                            let k = (self.width / 2) / distance
                            let x = (value.location.x - self.midPoint.x) * k - self.midPoint.x
                            let y = (value.location.y - self.midPoint.y) * k - self.midPoint.y
                            // Order matter
                            self.thumbPosition = CGPoint(x: x, y: y)
                            let xyPoint = CGPoint(x: x, y: y)
                            self.emitPosition(for: xyPoint)
                        } else {
                            self.thumbPosition = value.location
                            let emitX = value.location.x - self.midPoint.x
                            let emitY = value.location.y - self.midPoint.y
                            self.emitPosition(for: CGPoint(x: emitX, y: emitY))
                        }
                    }
                    .onEnded({ value in
                        if !locksInPlace {
                            self.thumbPosition = self.midPoint
                            self.emitPosition(for: .zero)
                        }
                    })
            )
    }
}

