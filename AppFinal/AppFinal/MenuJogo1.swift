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
    var placaMenu1: SKSpriteNode!
    var placaMenu2: SKSpriteNode!
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
        background = SKSpriteNode(imageNamed: "cenarioPrincipal")
        background.zPosition = 2
        background.name = "backgroundMenuJogos"
        background.size = CGSize(width: 1424, height: 800)
        background.position = CGPoint(x: 670, y: 400)
        
        placaMenu1 = SKSpriteNode(imageNamed: "placa")
        placaMenu1.zPosition = 2
        placaMenu1.name = "menuPlaca1"
        placaMenu1.size = CGSize(width: 200, height: 100)
        placaMenu1.position = CGPoint(x: 200, y: 200)
        
        placaMenu2 = SKSpriteNode(imageNamed: "placa")
        placaMenu2.zPosition = 2
        placaMenu2.name = "menuPlaca2"
        placaMenu2.size = CGSize(width: 200, height: 100)
        placaMenu2.position = CGPoint(x: 500, y: 200)
        
        // posiciona e adiciona os jogos
        jogoPatinho = SKSpriteNode(imageNamed: "pato")
        jogoPatinho.zPosition = 2
        jogoPatinho.name = "jogoPato"
        jogoPatinho.position = CGPoint(x: 190, y: 200)
        jogoPatinho.size = CGSize(width: 90, height: 70)
        
        jogoEsconde = SKSpriteNode(imageNamed: "num10")
        jogoEsconde.zPosition = 2
        jogoEsconde.name = "jogoEsconde"
        jogoEsconde.position = CGPoint(x: 490, y: 200)
        jogoEsconde.size = CGSize(width: 90, height: 70)
        
        addChild(background)
        addChild(placaMenu1)
        addChild(placaMenu2)
        addChild(jogoPatinho)
        addChild(jogoEsconde)
        
    }
    
    
    
}