//
//  GameScene.swift
//  Prey
//
//  Created by Benoit Neriah R. on 4/4/18.
//  Copyright © 2018 Keyyva Studio. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    fileprivate var lastUpdateTime: TimeInterval?
    
    let parallaxController = ParallaxController()
    let collisionDetector = CollisionDetector()
    
    override func didMove(to view: SKView){
        backgroundColor = SKColor.black
        
        for parallaxSprite in parallaxController.getAllSprites() {
            addChild(parallaxSprite)
        }
        for object in collisionDetector.getAllObjects(){
            addChild(object)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        guard let lastUpdateTime = lastUpdateTime else {
            self.lastUpdateTime = currentTime
            return
        }
        // Calculate deltaTime
        let deltaTime = currentTime - lastUpdateTime
        self.lastUpdateTime = currentTime
        
        parallaxController.update(deltaTime)
        collisionDetector.update(deltaTime)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        collisionDetector.playerJump()
    }
}
