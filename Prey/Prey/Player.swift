//
//  Player.swift
//  Prey
//
//  Created by Benoit Neriah R. on 4/7/18.
//  Copyright © 2018 Keyyva Studio. All rights reserved.
//
// Holds the main functionality of the player and animation.

import Foundation
import SpriteKit

// Possible player states
enum State {
    case run
    case jump
    case dead
}

class Player: GameObject {
    // Physics variables
    var forceY = CGFloat(0)
    var jumpAccelerationY = CGFloat(0)
    var velocityY = CGFloat(0)
    var mass = CGFloat(1)
    var gravityY = CGFloat(-9.8)
    
    // Animation variables
    // Textures for the animations
    let runTextures = [SKTexture(imageNamed: GlobalValues.bunnyRun1_ImageName), SKTexture(imageNamed: GlobalValues.bunnyRun2_ImageName),
                       SKTexture(imageNamed: GlobalValues.bunnyRun3_ImageName), SKTexture(imageNamed: GlobalValues.bunnyRun4_ImageName),
                       SKTexture(imageNamed: GlobalValues.bunnyRun5_ImageName), SKTexture(imageNamed: GlobalValues.bunnyRun6_ImageName)]
    let jumpTextures = [SKTexture(imageNamed: GlobalValues.bunnyJump1_ImageName), SKTexture(imageNamed: GlobalValues.bunnyJump2_ImageName)]
    
    // Animation actions
    let runAnimation: SKAction
    let runAnimationLoop: SKAction
    let jumpAnimation: SKAction
    let jumpAnimationLoop: SKAction
    
    // The current state the player is in
    var state: State
    var isJumping: Bool
    var isRunning: Bool
    
    // Initialize
    //
    // - Parameter imageNamed: the name of the image for the sprite
    required init(imageNamed: String) {
        isJumping = false
        isRunning = false   // Must start as false so run function will be called at start time
        
        state = State.run
        // Animation variables
        runAnimation = SKAction.animate(with: runTextures, timePerFrame: GlobalValues.bunnyTimePerFrame)
        runAnimationLoop = SKAction.repeatForever(runAnimation)
        jumpAnimation = SKAction.animate(with: jumpTextures, timePerFrame: GlobalValues.bunnyTimePerFrame)
        jumpAnimationLoop = SKAction.repeatForever(jumpAnimation)
        
        super.init(imageNamed: imageNamed)
    }
    convenience init(){
        self.init(imageNamed: GlobalValues.bunnyDefaultTexture)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been found")
    }
    
    
    // Update - runs once every frame
    //
    // - Parameter deltaTime: the amount of time between each frame
    override func update(_ deltaTime: TimeInterval) {
        // Calls the func that corresponds with the current state
        switch state {
        case State.run:
            isPaused = false // Temp till I have a dead frame
            run()
        case State.jump:
            jump(deltaTime)
        case State.dead:
            // TODO: DEAD FRAME HERE!
            isPaused = true // Temp till I have a dead frame
        default:
            print("Invalid state")
            state = State.run
        }
    }
    
    // Makes the player run
    //
    func run(){
        if(!isRunning){
            // Play animation
            run(runAnimationLoop)
            isRunning = true
            isJumping = false
        }
    }
    
    
    // Makes the player jump
    //
    func jump(_ deltaTime: TimeInterval){
        // Start the jump if this is the first pass
        if(!isJumping){
            // Add force to jump
            velocityY = CGFloat(100)
            
            // Play animation
            run(jumpAnimationLoop)
            isJumping = true
            isRunning = false
        }
        // Check if player touched the ground
        else if(self.position.y <= GlobalValues.bunnyStartPosition.y){
            self.position.y = GlobalValues.bunnyStartPosition.y
            state = State.run
            return
        }
        
        
        // Physics to make the player jump
        //jumpAccelerationY = forceY/mass                     // Find acceleration from force
        //velocityY += jumpAccelerationY * CGFloat(deltaTime) // Find velocity from acceleration
        velocityY += gravityY * 15 * CGFloat(deltaTime)          // Apply gravity
        position.y += velocityY * 15 * CGFloat(deltaTime)        // Find position from velocity
        forceY = 0
    }
    
    // Setters for the state of the player
    //
    func setDead(){
        state = State.dead
    }
    func setRun(){
        state = State.run
    }
}
