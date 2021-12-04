//
//  SwiftUIJoystickApp.swift
//  JoystickApp
//
//  Created by Michael Ellis on 12/4/21.
//

import SwiftUI


@main
struct SwiftUIJoystickApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                TestingView()
                    .tabItem {
                        Image(systemName: "l.joystick")
                        Text("Joystick Tests")
                    }
                ExampleUse()
                    .tabItem {
                        Image(systemName: "r.joystick")
                        Text("Example")
                    }
            }
            .font(.headline)
        }
    }
}
