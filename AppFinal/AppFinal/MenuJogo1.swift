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
    
    var jogoPatinho: SKSpriteNode!
    var jogoEsconde: SKSpriteNode!
    
    var novaScene: SKScene!
    
    override func didMoveToView(view: SKView) {

        montarScene()
       
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocation)
        
        if toque.name == "jogoPato" {
           
            novaScene = GameScenePatinho(size: size)
            
        }else if toque.name == "jogoEsconde" {
            
            novaScene = GameSceneEsconde(size: size)
            
        }
        
        self.scene?.view?.presentScene(novaScene)
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
        
        // posiciona e adiciona os jogos
        jogoPatinho = SKSpriteNode(imageNamed: "pato")
        jogoPatinho.zPosition = 1
        jogoPatinho.name = "jogoPato"
        jogoPatinho.position = CGPoint(x: 300, y: 300)
        jogoPatinho.size = CGSize(width: 90, height: 70)
        
        jogoEsconde = SKSpriteNode(imageNamed: "num10")
        jogoEsconde.zPosition = 1
        jogoEsconde.name = "jogoEsconde"
        jogoEsconde.position = CGPoint(x: 700, y: 300)
        jogoEsconde.size = CGSize(width: 90, height: 70)
        
        addChild(background)
        addChild(jogoPatinho)
        addChild(jogoEsconde)
        
    }
    
    
    
}