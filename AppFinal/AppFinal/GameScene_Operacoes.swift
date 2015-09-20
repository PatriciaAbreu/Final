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
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func montarScene(){
        
        scene?.view?.backgroundColor = UIColor.whiteColor()
        
        //posiciona e adiciona o plano de fundo
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
        
        personagem_Ro = SKSpriteNode(imageNamed: "Ro")
        personagem_Ro.zPosition = 1
        personagem_Ro.name = "ro"
        personagem_Ro.size = CGSize(width: 142, height: 337)
        personagem_Ro.position = CGPoint(x: 850, y: 150)
        
        addChild(background)
        addChild(background_cozinha)
        addChild(personagem_Ro)
        
    }
    
    func montarExercicio(){
        
        leg1 = SKSpriteNode(imageNamed: "abobora")
        leg1.zPosition = 1
        leg1.name = "abobora"
        leg1.size = CGSize(width: 80, height: 80)
        leg1.position = CGPoint(x: 100, y: 100)
        
        leg2 = SKSpriteNode(imageNamed: "abacaxi")
        leg2.zPosition = 1
        leg2.name = "abacaxi"
        leg2.size = CGSize(width: 80, height: 100)
        leg2.position = CGPoint(x: 200, y: 250)
        
        leg3 = SKSpriteNode(imageNamed: "beterraba")
        leg3.zPosition = 1
        leg3.name = "beterraba"
        leg3.size = CGSize(width: 80, height: 100)
        leg3.position = CGPoint(x: 150, y: 450)
        
        leg4 = SKSpriteNode(imageNamed: "couve_flor")
        leg4.zPosition = 1
        leg4.name = "couve_flor"
        leg4.size = CGSize(width: 80, height: 80)
        leg4.position = CGPoint(x: 450, y: 700)
        
        leg5 = SKSpriteNode(imageNamed: "kiwi")
        leg5.zPosition = 1
        leg5.name = "kiwi"
        leg5.size = CGSize(width: 80, height: 80)
        leg5.position = CGPoint(x: 850, y: 650)
        
        leg6 = SKSpriteNode(imageNamed: "pimentao")
        leg6.zPosition = 1
        leg6.name = "pimentao"
        leg6.size = CGSize(width: 80, height: 80)
        leg6.position = CGPoint(x: 800, y: 450)
        
        leg7 = SKSpriteNode(imageNamed: "tomate")
        leg7.zPosition = 1
        leg7.name = "tomate"
        leg7.size = CGSize(width: 80, height: 80)
        leg7.position = CGPoint(x: 900, y: 250)
        
        leg8 = SKSpriteNode(imageNamed: "banana")
        leg8.zPosition = 1
        leg8.name = "banana"
        leg8.size = CGSize(width: 80, height: 80)
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

