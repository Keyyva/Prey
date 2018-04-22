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
    let obstacleFactory = ObstacleFactory()
    let player = Player(imageNamed: GlobalValues.bunnyDefaultTexture)
    
    override func didMove(to view: SKView){
        backgroundColor = SKColor.black
        
        for parallaxSprite in parallaxController.getAllSprites() {
            addChild(parallaxSprite)
        }
        for obstacle in obstacleFactory.getAllObstacles() {
            addChild(obstacle)
        }
        addChild(player)
        player.position = GlobalValues.bunnyStartPosition
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
        obstacleFactory.update(deltaTime)
        player.update(deltaTime)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.state = State.jump
    }
}
