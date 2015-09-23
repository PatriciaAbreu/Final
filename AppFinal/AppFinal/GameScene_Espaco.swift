//
//  GameScene_Espaco.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 17/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit

class GameScene_Espaco: SKScene {
    
    var background_bolas: SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        montarScene()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func montarScene() {
        //posicionando os menus na tela
        background_bolas = SKSpriteNode(imageNamed: "fundo_bolas")
        background_bolas.zPosition = 1
        background_bolas.size = CGSize(width: 1050, height: 800)
        background_bolas.position = CGPoint(x: 510, y: 400)
        background_bolas.name = "menu_espaco_forma"
        
        background_bolas.alpha = 0.9
        addChild(background_bolas)
        
        
    }
    
}
