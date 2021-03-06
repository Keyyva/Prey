//
//  GlobalValues.swift
//  Prey
//
//  Created by Benoit Neriah R. on 4/5/18.
//  Copyright © 2018 Keyyva Studio. All rights reserved.
//
// Global values that are used throughout the game's code. All values
//      must be static.

import Foundation
import SpriteKit

// The current state the game is in - show main menu or play game
enum GameState: String {
    case mainMenu
    case playing
    case gameOver
}

public struct GlobalValues {
    static var centreOfScreen = CGPoint(x: 1024, y: 768)
    static var score = 0
    
    // OBSTACLES
    static let numOfObstacles = 20               // Total number of obstacles
    static let avgSpaceBetweenObstacles = 1600    // The average space between the obstacles on the x axis
    static let obstacleMaxPosRandomize = 1000     // The maximum amount allowed for randomizing obstacles - obstacles wont move more than obstacleMaxPosRandomize away from avgSpaceBetweenObstacles
    static let obstaclePositionY = 380         // The y position of the obstacles - should be where the foreground's ground is
    
    static let rockImageName = "Rock"
    static let stickImageName = "Stick"
    static let logImageName = "Log"
    
    
    // PARALLAX
    static let backgroundImageName = "Background"
    static let midgroundImageName = "Midground"
    static let foregroundImageName = "Foreground"
    
    static let backgroundStartPos = centreOfScreen     // Starting position value
    static let midgroundStartPos = centreOfScreen
    static let foregroundStartPos = centreOfScreen
    
    static let backgroundStartVelocity: [CGFloat] = [-150.0, 0.0]  // Starting velocity value
    static let midgroundStartVelocity: [CGFloat] = [-350.0, 0.0]   // [xVelocity, yVelocity]
    static let foregroundStartVelocity: [CGFloat] = [-650.0, 0.0]  // [xVelocity, yVelocity]
    
    
    // BUNNY
    static let bunnyStartPosition = CGPoint(x: 200, y: 480)
    static let bunnyJump1_ImageName = "Bunny_Jump1"
    static let bunnyJump2_ImageName = "Bunny_Jump2"
    static let bunnyRun1_ImageName = "Bunny_Run1"
    static let bunnyRun2_ImageName = "Bunny_Run2"
    static let bunnyRun3_ImageName = "Bunny_Run3"
    static let bunnyRun4_ImageName = "Bunny_Run4"
    static let bunnyRun5_ImageName = "Bunny_Run5"
    static let bunnyRun6_ImageName = "Bunny_Run6"
    
    static let bunnyTimePerFrame = 0.1
    static let bunnyDefaultTexture = GlobalValues.bunnyRun1_ImageName
    
    // MENUS
    static let mainMenuImageName = "MainMenu"
    static let gameOverImageName = "GameOver"
    static let mainMenuStartPos = CGPoint(x: 1500, y: 1000)
    static let gameOverStartPos = CGPoint(x: 1000, y: 800 )
    
    // AUDIO
    static let gameMusicName = "PreyMusic"
    static let gameOverSoundName = "GameOverSoundEffect"
    static let gameMusicExt = ".wav"
    static let gameOverSoundExt = ".wav"
}
