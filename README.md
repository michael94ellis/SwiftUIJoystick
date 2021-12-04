# SwiftUIJoystick
## A customizable Joystick made with SwiftUI
## Create your own Base and Thumb/Handle view using SwiftUI
 

### Normal Joystick Example <a href="https://github.com/michael94ellis/SwiftUIJoystick/blob/main/SwiftUIJoystickApp/ExampleJoystick.swift">(View Code Example)</a>
#### View this example to see how to make a Joystick Control View Object for your app!
<p align="center">
  <img src="./Readme_Assets/NormalJoystick.gif" width="150" />
</p>
 
### Locking Joystick Example <a href="https://github.com/michael94ellis/SwiftUIJoystick/blob/main/SwiftUIJoystickApp/TestingView.swift#L30-L40">(View Code Example)</a>
<p align="center">
  <img src="./Readme_Assets/LockingJoystick.gif" width="150" />
</p>
  
### Multiple Joystick Examples <a href="https://github.com/michael94ellis/SwiftUIJoystick/blob/main/SwiftUIJoystickApp/TestingView.swift">(View Code Example)</a>
<p align="center">
  <img src="./Readme_Assets/LongMultiUse.gif" width="150" />
</p>

# How to Install

### Swift Package Manager SPM
Add this repository's URL
`https://github.com/michael94ellis/SwiftUIJoystick`

### Cocoapods
Add this line to your podfile
`pod SwiftUIJoystick`


# How to use
### Example Code: 
### Ready to Copy, Paste, and Use (after install with SPM or Pods)

```Swift
// An example Joystick
// Copy this example and modify it

import SwiftUI
import SwiftUIJoystick

public struct Joystick: View {
    
    /// The monitor object to observe the user input on the Joystick in XY or Polar coordinates
    @ObservedObject public var joystickMonitor: JoystickMonitor
    /// The width or diameter in which the Joystick will report values
    ///  For example: 100 will provide 0-100, with (50,50) being the origin
    private let dragDiameter: CGFloat
    /// Can be `.rect` or `.circle`
    /// Rect will allow the user to access the four corners
    /// Circle will limit Joystick it's radius determined by `dragDiameter / 2`
    private let shape: JoystickShape
    
    public init(monitor: JoystickMonitor, width: CGFloat, shape: JoystickShape = .rect) {
        self.joystickMonitor = monitor
        self.dragDiameter = width
        self.shape = shape
    }
    
    public var body: some View {
        VStack{
            JoystickBuilder(
                monitor: self.joystickMonitor,
                width: self.dragDiameter,
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
        }
    }
}
```
