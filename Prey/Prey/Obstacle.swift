//
//  Obstacle.swift
//  Prey
//
//  Created by Benoit Neriah R. on 4/7/18.
//  Copyright © 2018 Keyyva Studio. All rights reserved.
//
// Obstacle is all obstacles in the game which the player must avoid. When using
//      this class, it is best to initialize with "init(obstacleType: Type, pos: CGPoint, velX: CGFloat, velY: CGFloat)".

import Foundation
import SpriteKit

class Obstacle : GameObject, ObstacleBase {
    var velocity: [CGFloat]     // velocity[0] is xVelocity and velocity[1] is yVelocity
    var type: Type
    
    // Required initialize
    //
    // - Parameter imageNamed: the name of the image for the sprite
    required init(imageNamed: String) {
        velocity = [0, 0]
        type = Type.rock
        super.init(imageNamed: imageNamed)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been found")
    }
    
    
    // Recommended init to be used. Automatically sets the imageNamed according to the obstacleType given
    //
    // - Parameters:
    //      obstacleType: what kind of obstacle it is
    //      velX: starting X velocity of the obstacle (should be the same as the forground's velocity)
    //      velY: starting Y velocity of the obstacle (should be the same as the forground's velocity)
    convenience init(obstacleType: Type, pos: CGPoint, velX: CGFloat, velY: CGFloat){
        switch obstacleType {
        case Type.rock:
            self.init(imageNamed: GlobalValues.rockImageName)
        case Type.stick:
            self.init(imageNamed: GlobalValues.stickImageName)
        case Type.log:
            self.init(imageNamed: GlobalValues.logImageName)
        default:
            print("Invalid obstacleType OR type not in switch in Obstacle.swift, automatically set the obstacle as rock")
            self.init(imageNamed: "Rock")
        }
        position = pos
        velocity = [velX, velY]
        type = obstacleType
    }
    
    
    // Update - runs once every frame
    //
    // - Parameter deltaTime: the amount of time between each frame
    override func update(_ deltaTime: TimeInterval) {
        // Physics to make the obstacle move according to the velocity
        position = CGPoint(x: position.x + (velocity[0] * CGFloat(deltaTime)),
                           y: position.y + (velocity[1] * CGFloat(deltaTime)))
    }
}
