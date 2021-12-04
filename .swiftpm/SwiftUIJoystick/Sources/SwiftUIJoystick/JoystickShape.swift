//
//  JoystickShape.swift
//  SwiftUIJoystick
//
//  Created by Michael Ellis on 12/4/21.
//

/// The type of background shape used for the touch/click hitbox
///
/// Rect will allow every coordinate to be used by the joystick's thumb position
/// Circle will limit the position output to the circular area defined by the midpoint and diameter/width
public enum JoystickShape {
    /// Will allow the cursor to go from 0,0 to 0, width, and width, 0
    case rect
    /// Will limit the curser to a circular area surrounding the center of the joystick
    /// This cannot reach the corners but can reach min and max for both the x and y axis any edge's midpoint
    case circle
}
