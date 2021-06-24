import UIKit
import SpriteKit

class GameOverLabel: SKLabelNode{
    
    //Вспомогательный инициализатор который добавляет новый функционал. Он должен вызывать внутри себя инициализатор родителя
    convenience init(position: CGPoint) {
        self.init() //супер инициализатор нашего родительского класса SKShapeNode
        text = "GAME OVER"
        fontSize = 35
        fontColor = UIColor.white
        self.position = position
        
        
    }
}
