//
//  GameManager.swift
//  Prey
//
//  Created by Benoit Neriah R. on 4/24/18.
//  Copyright © 2018 Keyyva Studio. All rights reserved.
//
// Handles the transitions from main menu, playing and game over

import Foundation
import SpriteKit

class GameManager {
    var gameState = GameState.mainMenu
    
    let parallaxController = ParallaxController()
    let mainMenu = MainMenu(imageNamed: GlobalValues.mainMenuImageName)
    let collisionDetector = CollisionDetector()
    let gameOver = GameObject(imageNamed: GlobalValues.gameOverImageName)
    
    init() {
        gameOver.position = GlobalValues.gameOverStartPos
        gameOver.isHidden = true
    }
    
    // Update - runs once every frame
    //
    // - Parameter deltaTime: the amount of time between each frame
    func update(_ deltaTime: TimeInterval){
        // State machine for different scenes of the game
        switch gameState {
        case GameState.mainMenu:
            parallaxController.update(deltaTime)
            collisionDetector.player.update(deltaTime)
            
        case GameState.playing:
            mainMenu.update(deltaTime)
            parallaxController.update(deltaTime)
            collisionDetector.update(deltaTime) // Updates both obstacles and player
            // Check for collision
            if(collisionDetector.detectCollision()){
                gameState = GameState.gameOver
                gameOver.isHidden = false
            }
            
        case GameState.gameOver:
            collisionDetector.player.setDead()
            collisionDetector.player.update(deltaTime)
            
        default:
            print("Invalid game state! Setting gameState to main menu.")
            gameState = GameState.mainMenu
        }
    }
    
    // Handles which function is called when the screen is tapped
    //
    func touch(){
        switch gameState {
        case GameState.mainMenu:
            gameState = GameState.playing
            gameOver.isHidden = true
            mainMenu.startMoving()
            
        case GameState.playing:
            collisionDetector.playerJump()
            
        case GameState.gameOver:
            gameState = GameState.mainMenu
            collisionDetector.player.setRun()
            collisionDetector.player.position = GlobalValues.bunnyStartPosition
            gameOver.isHidden = true
            mainMenu.resetPosition()
            collisionDetector.obstacleFactory.resetObstacles()
            GlobalValues.score = 0
            
        default:
            print("Invalid game state! Setting the gameState to main menu.")
            gameState = GameState.mainMenu
        }
    }
    
    // Returns all objects as an array
    //
    public func getAllObjects()->Array<GameObject>{
        var objects = collisionDetector.getAllObjects()
        for sprite in parallaxController.getAllSprites() {
            objects.append(sprite)
        }
        objects.append(mainMenu)
        objects.append(gameOver)
        
        return objects
    }
}
