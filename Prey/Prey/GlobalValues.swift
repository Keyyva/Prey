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

public struct GlobalValues {
    static let numOfObstacles = 5               // Total number of obstacles
    static let avgSpaceBetweenObstacles = 50    // The average space between the obstacles on the x axis
    static let obstacleMaxPosRandomize = 30     // The maximum amount allowed for randomizing obstacles - obstacles wont move more than obstacleMaxPosRandomize away from avgSpaceBetweenObstacles
}
