//
//  Player.swift
//  Prey
//
//  Created by Benoit Neriah R. on 4/7/18.
//  Copyright © 2018 Keyyva Studio. All rights reserved.
//
// Holds the main functionality of the player.

import Foundation
import SpriteKit

// TODO: Add animation to the character

// Possible player states
enum State {
    case run
    case jump
}

class Player: GameObject {
    // The current state the player is in
    var state: State
    
    // Initialize
    //
    // - Parameter imageNamed: the name of the image for the sprite
    required init(imageNamed: String) {
        state = State.run
        super.init(imageNamed: imageNamed)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been found")
    }
    
    
    // Update - runs once every frame
    //
    // - Parameter deltaTime: the amount of time between each frame
    override func update(_ deltaTime: TimeInterval) {
        // Physics to make the position change
        // TODO: add functionality
        
        // Calls the func that corresponds with the current state
        switch state {
        case State.run:
            run()
        case State.jump:
            jump()
        default:
            print("Invalid state")
            state = State.run
        }
    }
    
    // Makes the player run
    //
    func run(){
        // TODO: Add functionality
    }
    
    
    // Makes the player jump
    func jump(){
        // TODO: Add functionality
    }
}
