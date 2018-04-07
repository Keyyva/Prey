//
//  ObstacleFactory.swift
//  Prey
//
//  Created by Benoit Neriah R. on 4/7/18.
//  Copyright © 2018 Keyyva Studio. All rights reserved.
//
// Handles the creation and managment of obstacles.

import Foundation
import SpriteKit

class ObstacleFactory {
    var obstacles: [GameObject] = []
    
    // Populates the obstacles array
    //
    init() {
        var i = 0
        while(i < GlobalValues.numOfObstacles){
            let temp = Type(rawValue: Int(arc4random_uniform(UInt32(Type.count))))
            let obstaclePosRand = Int(arc4random_uniform(UInt32(GlobalValues.obstacleMaxPosRandomize * 2)) - UInt32(GlobalValues.obstacleMaxPosRandomize))  // Random position between -GlobalValues.obstacleMaxPosRandomize and GlobalValues.obstacleMaxPosRandomize
            obstacles.append(Obstacle.init(obstacleType: temp!, pos: CGPoint(x: 100 + ((GlobalValues.avgSpaceBetweenObstacles * i) + obstaclePosRand), y: 0), velX: 2, velY: 0))
            i += 1
        }
    }
    
    // Returns the obstacle that is closest ahead of the player
    //
    // - Parameter
    public func getObstacle(player: GameObject) -> GameObject {
        var result = obstacles[0]
        
        for obstacle in obstacles {
            if(obstacle.position.x < result.position.x){        // Checks if position.x is lower than the current result
                if(obstacle.position.x > player.position.x){    // Ensures obstacle is not behind the player
                    result = obstacle
                }
            }
        }
        return result
    }
    
    // Update - runs once every frame. Calls the update function in each Obstacle
    //
    // - Parameter deltaTime: the amount of time between each frame
    func update(_ deltaTime: TimeInterval){
        // Update all obstacles
        for obstacle in obstacles{
            obstacle.update(deltaTime)
        }
    }
}
