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
    var gameState = GameState.mainMenu
    
    let gameManager = GameManager()
    
    override func didMove(to view: SKView){
        backgroundColor = SKColor.black
        
        // Add all objects as children
        for object in gameManager.getAllObjects(){
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
        
        gameManager.update(deltaTime)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        gameManager.touch()
    }
}
