//
//  SnakeHead.swift
//  snake_game
//
//  Created by zeons on 21.06.2021.
//

import UIKit

class SnakeHead: SnakeBodyPart {
    override init (atPoint point:CGPoint){
        super.init(atPoint: point)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
