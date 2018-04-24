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
    
    let scoreLabel = SKLabelNode(fontNamed: "ArialMT")
    
    let gameManager = GameManager()
    
    override func didMove(to view: SKView){
        backgroundColor = SKColor.black
        
        // Setting the score label attributes
        scoreLabel.text = String(GlobalValues.score)
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        scoreLabel.fontSize = 70
        scoreLabel.fontColor = UIColor.white
        scoreLabel.position = CGPoint(x: 2000, y: 1250)
        scoreLabel.zPosition = 1000
        
        // Add all objects as children
        for object in gameManager.getAllObjects(){
            addChild(object)
        }
        
        addChild(scoreLabel)
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
        scoreLabel.text = String(GlobalValues.score)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        gameManager.touch()
    }
}
