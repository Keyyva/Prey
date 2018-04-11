//
//  GlobalValues.swift
//  Prey
//
//  Created by Benoit Neriah R. on 4/5/18.
//  Copyright © 2018 Keyyva Studio. All rights reserved.
//
// Global values that are used throughout the game's code. All values
//      must be static.

import Foundation
import SpriteKit

public struct GlobalValues {
    static var centreOfScreen = CGPoint(x: 1024, y: 768)
    
    // OBSTACLES
    static let numOfObstacles = 7               // Total number of obstacles
    static let avgSpaceBetweenObstacles = 1500    // The average space between the obstacles on the x axis
    static let obstacleMaxPosRandomize = 1500     // The maximum amount allowed for randomizing obstacles - obstacles wont move more than obstacleMaxPosRandomize away from avgSpaceBetweenObstacles
    static let obstaclePositionY = 380         // The y position of the obstacles - should be where the foreground's ground is
    
    static let rockImageName = "Rock"
    static let stickImageName = "Stick"
    static let logImageName = "Log"
    
    
    // PARALLAX
    static let backgroundImageName = "Background"
    static let midgroundImageName = "Midground"
    static let foregroundImageName = "Foreground"
    
    static let backgroundStartPos = centreOfScreen     // Starting position value
    static let midgroundStartPos = centreOfScreen
    static let foregroundStartPos = centreOfScreen
    
    static let backgroundStartVelocity: [CGFloat] = [-100.0, 0.0]  // Starting velocity value
    static let midgroundStartVelocity: [CGFloat] = [-300.0, 0.0]   // [xVelocity, yVelocity]
    static let foregroundStartVelocity: [CGFloat] = [-500.0, 0.0]  // [xVelocity, yVelocity]
}
