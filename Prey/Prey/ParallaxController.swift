//
//  ParallaxController.swift
//  Prey
//
//  Created by Benoit Neriah R. on 4/7/18.
//  Copyright © 2018 Keyyva Studio. All rights reserved.
//
// Handles the creation and management of multiple ParallaxSprite.
//      Moving the background, midground and foreground at different speeds
//      gives the illusion of depth.

import Foundation
import SpriteKit

class ParallaxController {
    var parallaxSprites: [GameObject] = []  // [0] is background, [1] is midground, [2] is foreground. Repeats - [3] is background, [4] is midground...
    
    // Populates the parallaxSprites array
    //
    init() {
        // First set of background
        parallaxSprites.append(ParallaxSprite(imageNamed: GlobalValues.backgroundImageName, pos: GlobalValues.backgroundStartPos, velX: GlobalValues.backgroundStartVelocity[0], velY: GlobalValues.backgroundStartVelocity[1]))
        parallaxSprites.append(ParallaxSprite(imageNamed: GlobalValues.backgroundImageName, pos: CGPoint(x: parallaxSprites[0].position.x + parallaxSprites[0].size.width, y: parallaxSprites[0].position.y), velX: GlobalValues.backgroundStartVelocity[0], velY: GlobalValues.backgroundStartVelocity[1]))
        
        parallaxSprites.append(ParallaxSprite(imageNamed: GlobalValues.midgroundImageName, pos: GlobalValues.midgroundStartPos, velX: GlobalValues.midgroundStartVelocity[0], velY: GlobalValues.midgroundStartVelocity[1]))
        parallaxSprites.append(ParallaxSprite(imageNamed: GlobalValues.midgroundImageName, pos: CGPoint(x: parallaxSprites[2].position.x + parallaxSprites[2].size.width, y: parallaxSprites[2].position.y), velX: GlobalValues.midgroundStartVelocity[0], velY: GlobalValues.midgroundStartVelocity[1]))
        
        parallaxSprites.append(ParallaxSprite(imageNamed: GlobalValues.foregroundImageName, pos: GlobalValues.foregroundStartPos, velX: GlobalValues.foregroundStartVelocity[0], velY: GlobalValues.foregroundStartVelocity[1]))
        parallaxSprites.append(ParallaxSprite(imageNamed: GlobalValues.foregroundImageName, pos: CGPoint(x: parallaxSprites[4].position.x + parallaxSprites[4].size.width, y: parallaxSprites[4].position.y), velX: GlobalValues.foregroundStartVelocity[0], velY: GlobalValues.foregroundStartVelocity[1]))
    }
    
    
    // Update - runs once every frame. Calls the update function in each ParallaxSprite
    //
    // - Parameter deltaTime: the amount of time between each frame
    func update(_ deltaTime: TimeInterval){
        // Update all sprites
        var i = 0
        while(i < parallaxSprites.count){
            // Loop sprite when needed
            if(parallaxSprites[i].position.x + (parallaxSprites[i].size.width/2) < 0){
                if(i % 2 == 0){ // Even number
                    parallaxSprites[i].position.x = parallaxSprites[i+1].position.x + (parallaxSprites[i+1].size.width)
                }
                else{   // Odd number
                    parallaxSprites[i].position.x = parallaxSprites[i-1].position.x + (parallaxSprites[i-1].size.width)
                }
            }
            
            // Run the update function for the sprite
            parallaxSprites[i].update(deltaTime)
            i += 1
        }
        
        
        /*for sprite in parallaxSprites {
            if(sprite.position.x + (sprite.size.width/2) < 0){
                if(i % 2 == 0){ // Even number
                    
                }
                else{   // Odd number
                    
                }
                //sprite.position.x = sprite.size.width + (sprite.size.width/2)
            }
            sprite.update(deltaTime)
            i += 1
        }*/
    }
    
    // Returns all of the sprites in this ParallaxController
    //
    public func getAllSprites()->Array<GameObject> {
        return parallaxSprites
    }
}
