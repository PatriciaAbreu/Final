//
//  GameScene_Espaco.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 17/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit

class GameScene_Espaco: SKScene {
    
    var menu_espaco_forma: SKSpriteNode!
    
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
        menu_espaco_forma = SKSpriteNode(imageNamed: "menuRosaClaro_Espaco.png")
        menu_espaco_forma.zPosition = 1
        menu_espaco_forma.position = CGPoint(x: 750, y: 530)
        menu_espaco_forma.name = "menu_espaco_forma"
        
        self.backgroundColor = UIColor.whiteColor()
        
        addChild(menu_espaco_forma)
        
        let animacao = SKAction.rotateToAngle(90, duration: 0.3)
        menu_espaco_forma.runAction(animacao)
    }
    
}
