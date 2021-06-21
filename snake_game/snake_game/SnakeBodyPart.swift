//
//  snakeBodyPart.swift
//  snake_game
//
//  Created by zeons on 21.06.2021.
//

import UIKit
import SpriteKit

class SnakeBodyPart: SKShapeNode {
    let diametr = 10
    
    init(atPoint point: CGPoint) {
        super.init()
        
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: diametr, height: diametr)).cgPath
        fillColor = .green
        strokeColor = .green
        lineWidth = 5
        self.position = point
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
