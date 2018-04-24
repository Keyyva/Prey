//
//  ParallaxSprite.swift
//  Prey
//
//  Created by Benoit Neriah R. on 4/7/18.
//  Copyright © 2018 Keyyva Studio. All rights reserved.
//
// ParallaxSprite is used by moving backgrounds in the ParallaxController.
//      These sprites will move according to the velocity given.

import Foundation
import SpriteKit

class ParallaxSprite : GameObject {
    var velocity: [CGFloat]     // velocity[0] is xVelocity and velocity[1] is yVelocity
    
    // Initialize and set the sprite image
    //
    // - Parameter imageNamed: the name of the image for the sprite
    required init(imageNamed: String) {
        velocity = [0, 0]
        super.init(imageNamed: imageNamed)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been found")
    }
    
    // Initialize the sprite image, position and velocity
    //
    // - Parameters;
    //      imageNamed: the name of the image for the sprite
    //      pos: the starting position of the sprite
    //      velX: starting X velocity of the ParallaxSprite
    //      velY: starting y velocity of the ParallaxSprite
    convenience init(imageNamed: String, pos: CGPoint, velX: CGFloat = 0, velY: CGFloat = 0){
        self.init(imageNamed: imageNamed)
        position = pos
        velocity = [velX, velY]
    }
    
    // Update  runs once every frame
    //
    // - Parameter deltaTime: the amount of time between each frame
    override func update(_ deltaTime: TimeInterval) {
        // Physics to make the ParallaxSprite move according to the velocity
        position = CGPoint(x: position.x + (velocity[0] * CGFloat(deltaTime)),
                           y: position.y + (velocity[1] * CGFloat(deltaTime)))
    }
}
