//
//  GameScene_Operacoes.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 17/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit

class GameScene_Operacoes: SKScene {
    
    var menu_operacoes: SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        montarMenu()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func montarMenu() {
        //posicionando os menus na tela
        menu_operacoes = SKSpriteNode(imageNamed: "menuVerde_Operacoes.png")
        menu_operacoes.zPosition = 1
        menu_operacoes.position = CGPoint(x: 300, y: 230)
        menu_operacoes.name = "menu_operacoes"
        
        self.backgroundColor = UIColor.whiteColor()
        
        addChild(menu_operacoes)
        
        let animacao = SKAction.rotateToAngle(90, duration: 0.3)
        menu_operacoes.runAction(animacao)
    }
    
}

