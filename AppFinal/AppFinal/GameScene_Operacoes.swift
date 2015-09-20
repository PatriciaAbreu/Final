//
//  GameScene_Operacoes.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 17/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit

class GameScene_Operacoes: SKScene {
    var gameController: GameViewController!

    var background_cozinha: SKSpriteNode!
    var background: SKSpriteNode!
    
    var personagem_Ro: SKSpriteNode!
    
    var chat: SKSpriteNode!
    var chat2: SKSpriteNode!
    var chat3: SKSpriteNode!
    
    var seta_play: SKSpriteNode!
    var seta_play2: SKSpriteNode!
    var seta_play3: SKSpriteNode!
    
    var leg1: SKSpriteNode!
    var leg2: SKSpriteNode!
    var leg3: SKSpriteNode!
    var leg4: SKSpriteNode!
    var leg5: SKSpriteNode!
    var leg6: SKSpriteNode!
    var leg7: SKSpriteNode!
    var leg8: SKSpriteNode!
    
    override func didMoveToView(view: SKView) {

        montarScene()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocation)
        
        if toque.name == "seta_play" {
            chat.removeFromParent()
            seta_play.removeFromParent()
            
            //posiciona e adiciona a conversa
            chat2 = SKSpriteNode(imageNamed: "chat_roxo_texto_2")
            chat2.zPosition = 1
            chat2.name = "chat2"
            chat2.size = CGSize(width: 200, height: 200)
            chat2.position = CGPoint(x: 730, y: 300)
            
            //posiciona e adiciona a seta de próximo
            seta_play2 = SKSpriteNode(imageNamed: "seta_roxa")
            seta_play2.zPosition = 1
            seta_play2.name = "seta_play2"
            seta_play2.size = CGSize(width: 50, height: 50)
            seta_play2.position = CGPoint(x: 740, y: 270)
            
            addChild(chat2)
            addChild(seta_play2)
            
        }else if toque.name == "seta_play2" {
            
            chat2.removeFromParent()
            seta_play2.removeFromParent()
            
            //posiciona e adiciona a conversa
            chat3 = SKSpriteNode(imageNamed: "chat_roxo_texto_3")
            chat3.zPosition = 1
            chat3.name = "chat3"
            chat3.size = CGSize(width: 200, height: 200)
            chat3.position = CGPoint(x: 730, y: 300)
            
            //posiciona e adiciona a seta de próximo
            seta_play3 = SKSpriteNode(imageNamed: "seta_roxa")
            seta_play3.zPosition = 1
            seta_play3.name = "seta_play3"
            seta_play3.size = CGSize(width: 50, height: 50)
            seta_play3.position = CGPoint(x: 740, y: 270)

            addChild(chat3)
            addChild(seta_play3)
            
        }else if toque.name == "seta_play3" {
            
            chat3.removeFromParent()
            seta_play3.removeFromParent()
            
            personagem_Ro.runAction(SKAction.moveToX(1500, duration: 0.6))
            
            montarExercicio()
        }  
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func montarScene(){
        
        scene?.view?.backgroundColor = UIColor.whiteColor()
        
        //posiciona e adiciona o plano de fundo
        background = SKSpriteNode(imageNamed: "fundo")
        background.zPosition = 1
        background.name = "background_numeros"
        background.size = CGSize(width: 1050, height: 800)
        background.position = CGPoint(x: 510, y: 400)
    
        background_cozinha = SKSpriteNode(imageNamed: "fundo_cozinha")
        background_cozinha.zPosition = 1
        background_cozinha.name = "background_numeros"
        background_cozinha.size = CGSize(width: 471, height: 490)
        background_cozinha.position = CGPoint(x: 510, y: 400)
        
        //posiciona e adiciona o personagem
        personagem_Ro = SKSpriteNode(imageNamed: "Ro")
        personagem_Ro.zPosition = 1
        personagem_Ro.name = "ro"
        personagem_Ro.size = CGSize(width: 142, height: 337)
        personagem_Ro.position = CGPoint(x: 850, y: 150)
        
        //posiciona e adiciona a conversa
        chat = SKSpriteNode(imageNamed: "chat_roxo_texto_1")
        chat.zPosition = 1
        chat.name = "chat1"
        chat.size = CGSize(width: 200, height: 200)
        chat.position = CGPoint(x: 730, y: 300)
        
        //posiciona e adiciona a seta de próximo
        seta_play = SKSpriteNode(imageNamed: "seta_roxa")
        seta_play.zPosition = 1
        seta_play.name = "seta_play"
        seta_play.size = CGSize(width: 50, height: 50)
        seta_play.position = CGPoint(x: 740, y: 280)
        
        addChild(background)
        addChild(background_cozinha)
        addChild(personagem_Ro)
        addChild(chat)
        addChild(seta_play)
        
    }
    
    func montarExercicio(){
        
        leg1 = Vegetais(texture: SKTexture(imageNamed: "abobora"), color: UIColor.clearColor(), size: CGSize(width: 80, height: 80), tipo: "legume")
        leg1.zPosition = 1
        leg1.name = "abobora"
        leg1.position = CGPoint(x: 100, y: 100)
        
        leg2 = Vegetais(texture: SKTexture(imageNamed: "abacaxi"), color: UIColor.clearColor(), size: CGSize(width: 80, height: 100), tipo: "fruta")
        leg2.zPosition = 1
        leg2.name = "abacaxi"
        leg2.position = CGPoint(x: 200, y: 250)
        
        leg3 = Vegetais(texture: SKTexture(imageNamed: "beterraba"), color: UIColor.clearColor(), size: CGSize(width: 80, height: 100), tipo: "legume")
        leg3.zPosition = 1
        leg3.name = "beterraba"
        leg3.position = CGPoint(x: 150, y: 450)
        
        leg4 = Vegetais(texture: SKTexture(imageNamed: "couve_flor"), color: UIColor.clearColor(), size: CGSize(width: 80, height: 80), tipo: "legume")
        leg4.zPosition = 1
        leg4.name = "couve_flor"
        leg4.position = CGPoint(x: 450, y: 700)
        
        leg5 = Vegetais(texture: SKTexture(imageNamed: "kiwi"), color: UIColor.clearColor(), size: CGSize(width: 80, height: 80), tipo: "fruta")
        leg5.zPosition = 1
        leg5.name = "kiwi"
        leg5.position = CGPoint(x: 850, y: 650)
        
        leg6 = Vegetais(texture: SKTexture(imageNamed: "pimentao"), color: UIColor.clearColor(), size: CGSize(width: 80, height: 80), tipo: "legume")
        leg6.zPosition = 1
        leg6.name = "pimentao"
        leg6.position = CGPoint(x: 800, y: 450)
        
        leg7 = Vegetais(texture: SKTexture(imageNamed: "tomate"), color: UIColor.clearColor(), size: CGSize(width: 80, height: 80), tipo: "legume")
        leg7.zPosition = 1
        leg7.name = "tomate"
        leg7.position = CGPoint(x: 900, y: 250)
        
        leg8 = Vegetais(texture: SKTexture(imageNamed: "banana"), color: UIColor.clearColor(), size: CGSize(width: 80, height: 80), tipo: "fruta")
        leg8.zPosition = 1
        leg8.name = "banana"
        leg8.position = CGPoint(x: 750, y: 100)
        
        addChild(leg1)
        addChild(leg2)
        addChild(leg3)
        addChild(leg4)
        addChild(leg5)
        addChild(leg6)
        addChild(leg7)
        addChild(leg8)
    }
}

