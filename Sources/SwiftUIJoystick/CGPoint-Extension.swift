//
//  CGPoint-Extension.swift
//  SwiftUIJoystick
//
//  Created by Michael Ellis on 12/4/21.
//

import SwiftUI

public extension CGPoint {
    
    func distance(to point: CGPoint) -> CGFloat {
        return sqrt(pow((point.x - x), 2) + pow((point.y - y), 2))
    }
    
    func getPointOnCircle(radius: CGFloat, radian: CGFloat) -> CGPoint {
        let x = self.x + radius * cos(radian)
        let y = self.y + radius * sin(radian)
        
        return CGPoint(x: x, y: y)
    }
    
    func getRadian(pointOnCircle: CGPoint) -> CGFloat {
        let originX = pointOnCircle.x - self.x
        let originY = pointOnCircle.y - self.y
        var radian = atan2(originY, originX)
        while radian < 0 {
            radian += CGFloat(2 * Double.pi)
        }
        return radian
    }
    
    func getPolarPoint(from origin: CGPoint = CGPoint.zero) -> PolarPoint {
        let deltaX = self.x - origin.x
        let deltaY = self.y - origin.y
        let radians = -1 * atan2(deltaY, deltaX)
        let degrees = radians * (180.0 / CGFloat.pi)
        let distance = self.distance(to: origin)
        
        guard degrees < 0 else {
            return PolarPoint(degrees: degrees, distance: distance)
        }
        return PolarPoint(degrees: degrees + 360.0, distance: distance)
    }
}
