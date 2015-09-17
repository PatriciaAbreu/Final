//
//  GameScene_Grandezas.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 17/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit

class GameScene_Grandezas: SKScene {
    
    var menu_grandeza_medidas: SKSpriteNode!
    
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
        menu_grandeza_medidas = SKSpriteNode(imageNamed: "menuLaranja_Grandezas.png")
        menu_grandeza_medidas.zPosition = 1
        menu_grandeza_medidas.position = CGPoint(x: 750, y: 200)
        menu_grandeza_medidas.name = "menu_grandeza_medidas"
        
        self.backgroundColor = UIColor.whiteColor()
        
        addChild(menu_grandeza_medidas)
        
        let animacao = SKAction.rotateToAngle(90, duration: 0.3)
        menu_grandeza_medidas.runAction(animacao)
    }
    
}
