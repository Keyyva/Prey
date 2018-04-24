//
//  MainMenu.swift
//  Prey
//
//  Created by Benoit Neriah R. on 4/24/18.
//  Copyright © 2018 Keyyva Studio. All rights reserved.
//
// The main menu/title thatis displayed and the movement functionality

import Foundation
import SpriteKit

class MainMenu : GameObject {
    var velocity: [CGFloat]     // velocity[0] is xVelocity and velocity[1] is yVelocity
    
    // Initialize and set the sprite image
    //
    // - Paramter imageNamed: the name of the image for the sprite
    required init(imageNamed: String) {
        velocity = [0, 0]
        super.init(imageNamed: imageNamed)
        position = GlobalValues.mainMenuStartPos
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been found")
    }
    
    // Update - runs once every frame
    //
    // - Parameter deltaTime: the amount of time between each frame
    override func update(_ deltaTime: TimeInterval) {
        // Stop moving when reaches the left edge of the screen
        if(position.x < -size.width/2){
            velocity = [0, 0]
            return
        }
        // Physics to make the title move according to the  velocity
        position = CGPoint(x: position.x + (velocity[0] * CGFloat(deltaTime)),
                           y: position.y + (velocity[1] * CGFloat(deltaTime)))
    }
    
    // Start moving the menu
    //
    func startMoving(){
        velocity = GlobalValues.midgroundStartVelocity
    }
    
    // Reset the menu's position
    func resetPosition(){
        position = GlobalValues.mainMenuStartPos
    }
}
