//
//  GameObject.swift
//  Prey
//
//  Created by Benoit Neriah R. on 4/5/18.
//  Copyright © 2018 Keyyva Studio. All rights reserved.
//
// GameObject is the base class for all other objects in the game. GameObject will often be
//      derived, but can also be used for objects with no functionality or added attributes.

import Foundation
import SpriteKit

class GameObject: SKSpriteNode {
    static var zCounter = CGFloat(-3);  // Sets the zPosition - Increments for every new GameObject created
    
    // Initialize
    //
    // - Parameter imageNamed: the name of the image for the sprite
    required init(imageNamed: String){
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: .clear, size: texture.size())
        
        // Set attributes
        zPosition = GameObject.zCounter
        GameObject.zCounter += 1
    }
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been found")
    }
    
    // Update - runs once every frame
    //
    // - Parameter deltaTime: the amount of time between each frame
    func update(_ deltaTime: TimeInterval){
        // Empty
    }
}
