//
//  GameScenePatinho.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 17/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit

class GameScenePatinho: SKScene, UITextFieldDelegate {
    
    var background_patinhos: SKSpriteNode!
    var patinho: SKSpriteNode!
    var patinhos: [SKSpriteNode] = []
    var texto: UITextField!
    
    override func didMoveToView(view: SKView) {
        montaScene()
        montaExercicio()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocation)
        
        if toque.intersectsNode(self){
            self.view?.endEditing(true)
        }
            
        
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
//            let repete: SKAction = SKAction.repeatActionForever(sequencia)
            
            
            
            
            if i == quantidade {
                patinho.runAction(sequencia, completion: { () -> Void in
                    self.montaResposta(quantidade)
                })
            }else{
                patinho.runAction(sequencia)
            }
        }
        
//        montaResposta(quantidade)
    }
    
    func montaResposta(resposta: Int){
        
        texto = UITextField(frame: CGRect(x: 450, y: 200, width: 200, height: 40))
        texto.backgroundColor = UIColor.blueColor()
        
        
        
        let teclado = Teclado()
        addChild(teclado)
        
        teclado.position = CGPoint(x: CGRectGetMidX((self.view?.bounds)!), y: CGRectGetMinY((self.view?.bounds)!
            ) + teclado.frame.height/2)
        self.view?.addSubview(texto)
        
//        print(texto.text)
    }
    
    
}
