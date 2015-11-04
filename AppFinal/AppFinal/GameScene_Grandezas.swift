//
//  GameScene_Grandezas.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 17/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit

class GameScene_Grandezas: SKScene {
    
    var background_patinhos: SKSpriteNode!
    var patinho: SKSpriteNode!
    var patinhos: [SKSpriteNode] = []
    
    override func didMoveToView(view: SKView) {
        montaScene()
        montaExercicio()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func montaScene(){
        
        //posiciona e adiciona o plano de fundo
        background_patinhos = SKSpriteNode(imageNamed: "backgroundGrass")
        background_patinhos.zPosition = 1
        background_patinhos.name = "background_patinhos"
        background_patinhos.size = CGSize(width: 1050, height: 800)
        background_patinhos.position = CGPoint(x: 510, y: 400)
        
        addChild(background_patinhos)
        
    }
    
    func montaExercicio(){
        let quantidade = random(1, hi: 7)
        
        for i in 1...quantidade{
            
            patinho = SKSpriteNode(imageNamed: "julia")
            patinho.zPosition = 1
            patinho.name = "patinho\(i)"
            patinho.size = CGSize(width: 150, height: 200)
            patinho.position = CGPoint(x: 1100, y: 200)
            
            patinhos.append(patinho)
            
            addChild(patinho)
            
            let duracao:Int = 2 * Int(i)
            let espera: SKAction = SKAction.waitForDuration(NSTimeInterval(duracao))
            let anda: SKAction = SKAction.moveToX(0, duration: 1)
            let sequencia: SKAction = SKAction.sequence([espera,anda])
            let repete: SKAction = SKAction.repeatActionForever(sequencia)
            
            patinho.runAction(repete)
        }
    }
}
