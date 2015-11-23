//
//  GameScene_Operacoes.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 17/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit
import MediaPlayer
import AVFoundation

class MenuJogo1: SKScene {
    var gameController: GameViewController!

    var background: SKSpriteNode!
    
    var jogo1: SKSpriteNode!
    
    override func didMoveToView(view: SKView) {

        montarScene()
       
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocation)
        
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func montarScene(){
        
        scene?.view?.backgroundColor = UIColor.whiteColor()
        
        //posiciona e adiciona o plano de fundo
        background = SKSpriteNode(imageNamed: "fundo_bolas")
        background.zPosition = 1
        background.name = "backgroundMenuJogos"
        background.size = CGSize(width: 1050, height: 800)
        background.position = CGPoint(x: 510, y: 400)
        
        addChild(background)
        
    }
    
    
    
}