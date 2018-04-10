//
//  ObstacleBase.swift
//  Prey
//
//  Created by Benoit Neriah R. on 4/7/18.
//  Copyright © 2018 Keyyva Studio. All rights reserved.
//
// ObstacleBase is the protocol for any Obstacle classes.
//      Type is an enum which describes the type of obstacle it is.

import Foundation
import SpriteKit

enum Type: Int {
    case rock
    case stick
    
    case log  // Always leave last
    static var count: Int {return Type.log.hashValue + 1}
}


protocol ObstacleBase {
    var velocity: [CGFloat] {get set} // x and y velocities
    var type: Type {get}
}
