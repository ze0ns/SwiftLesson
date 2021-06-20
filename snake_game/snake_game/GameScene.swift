//
//  GameScene.swift
//  snake_game
//
//  Created by zeons on 20.06.2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    //Метод вызывается в момент запуска сцены. Преднанзанчен для создания первоначального состояния  для добовления необходимых объектов на старте
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black //Устанавливаем фон
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0) //Добавляем гравитацию
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame) //Добавляем физику в игру, указывая где она будет работать
        self.physicsBody?.allowsRotation = false //отключаем поворот экрана
        view.showsPhysics = true
        
        //Создаем нашу первую кнопку
        let counterClockWiseButton = SKShapeNode()
        //Задали кнопке форму и размеры
        counterClockWiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        //Разместим нашу кнопку, в левом нижнем углу (30 поинтов от края)
        counterClockWiseButton.position = CGPoint(x: view.scene!.frame.minX+30, y: view.scene!.frame.minY+30)
        //Заполним цветом и сделаем рамку, Зададим толщину линии рамки и обзовем её
        counterClockWiseButton.fillColor = UIColor.gray
        counterClockWiseButton.strokeColor = UIColor.gray
        counterClockWiseButton.lineWidth = 10
        counterClockWiseButton.name = "counterClockWiseButton"
        
        //Создаем нашу вторую кнопку
        let ClockWiseButton = SKShapeNode()
        //Задали кнопке форму и размеры
        ClockWiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        //Разместим нашу кнопку, в левом нижнем углу (30 поинтов от края)
        ClockWiseButton.position = CGPoint(x: view.scene!.frame.maxX - 80, y: view.scene!.frame.minY+30)
        //Заполним цветом и сделаем рамку, Зададим толщину линии рамки и обзовем её
        ClockWiseButton.fillColor = UIColor.gray
        ClockWiseButton.strokeColor = UIColor.gray
        ClockWiseButton.lineWidth = 10
        ClockWiseButton.name = "ClockWiseButton"
        
        self.addChild(counterClockWiseButton)
        self.addChild(ClockWiseButton)
        
    }
    
    
    //Метод отрабатывает нажатия на экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        for touch in touches{
            let touchLocation = touch.location(in: self)
            
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode, touchNode.name == "counterClockWiseButton" || touchNode.name == "ClockWiseButton" else {
                return
            }
            touchNode.fillColor = .green
        }
        
    }
    

    //Метод срабатывает после отпускания пальца от экрана
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let touchLocation = touch.location(in: self)
            
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode, touchNode.name == "counterClockWiseButton" || touchNode.name == "ClockWiseButton" else {
                return
            }
            touchNode.fillColor = .gray
        }
    
    }
    
    //внезапное прекращения нажатие
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
  
    }
    
    //Обновление сцены
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
