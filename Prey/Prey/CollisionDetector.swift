//
//  CollisionDetector.swift
//  Prey
//
//  Created by Benoit Neriah R. on 4/22/18.
//  Copyright © 2018 Keyyva Studio. All rights reserved.
//
// Detects the collision between the player and obstacles

import Foundation
import SpriteKit

class CollisionDetector{
    let obstacleFactory: ObstacleFactory
    let player: Player
    
    // Initialize
    //
    required init(){
        obstacleFactory = ObstacleFactory()
        player = Player(imageNamed: GlobalValues.bunnyDefaultTexture)
        player.position = GlobalValues.bunnyStartPosition
    }
    
    // Update - runs once every frame
    //
    // - Parameter deltaTime: the amount of time between each frame
    func update(_ deltaTime: TimeInterval){
        obstacleFactory.update(deltaTime)
        player.update(deltaTime)
        detectCollision()
    }
    
    // Checks for collision between the player and obstacles
    //
    func detectCollision()->Bool{        
        // Loop through all obstacles to test if player is touching one
        for obstacle in obstacleFactory.getAllObstacles() {
            if(sqrt((obstacle.position.x - player.position.x) * (obstacle.position.x - player.position.x) + (obstacle.position.y - obstacle.size.height/2 - player.position.y - obstacle.size.height/2) * (obstacle.position.y - obstacle.size.height/2 - player.position.y - player.size.height/2)) < (player.size.width/2 + obstacle.size.width/2)){
                print("Collision")
            }
        }
        return false
    }
    
    // Returns all objects (obstacles and player) as an array - is used for addChild() in GameScene
    //
    public func getAllObjects()->Array<GameObject> {
        var objects = obstacleFactory.getAllObstacles()
        objects.append(player)
        return objects
    }
    
    // Makes the player jump
    //
    public func playerJump(){
        player.state = State.jump
    }
}
