//
//  PersonagensMenu.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 16/09/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit

class PersonagensMenu: SKSpriteNode {
    
    var item: Int!
    
    init(texture: SKTexture!, color: UIColor!, size: CGSize, item: Int) {
        super.init(texture: texture, color: color, size: size)
        self.item = item
        self.userInteractionEnabled = true
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //verifica qual menu foi tocado
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocation)
        
        if toque.name == "personagem1_1" || toque.name == "personagem2_1" || toque.name == "personagem3_1" || toque.name == "personagem4_1"{
            
        }else if toque.name == "personagem1_2" || toque.name == "personagem2_2" || toque.name == "personagem3_2" || toque.name == "personagem4_2" {
            
        }
        
//        if toque.position.x == 225 && toque.position.y == 0 {
//            toque.parent?.runAction(SKAction.rotateByAngle(1.57, duration: 0.4))
//            
//        }else if toque.position.x == 0 && toque.position.y == -225 {
//            for (var i = 1; i < 3; i++) {
//                toque.parent?.runAction(SKAction.rotateByAngle(1.57, duration: 0.4))
//            }
//            
//        }else if toque.position.x == -225 && toque.position.y == 0 {
//            for (var i = 1; i < 4; i++) {
//                toque.parent?.runAction(SKAction.rotateByAngle(1.57, duration: 0.6))
//            }
//            
//        }
        
        if toque.name == "personagem1"{
            toque.name = "personagem1_novo"
            
        }else if toque.name == "personagem2" {
            toque.name = "personagem2_novo"
            
        }else if toque.name == "personagem3" {
            toque.name = "personagem3_novo"
            
        }else if toque.name == "personagem4" {
            toque.name = "personagem4_novo"
        }
        
        let pontoEmRelacaoATela = self.convertPoint(touchLocation, toNode: self.parent!.parent!)
        let cenaOndeEstaOMenu = (toque.parent?.parent as! GameScene)
        cenaOndeEstaOMenu.girarMenu(pontoEmRelacaoATela)
    }
}