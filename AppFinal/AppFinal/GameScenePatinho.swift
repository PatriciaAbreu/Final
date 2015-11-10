//
//  GameScenePatinho.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 17/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit

class GameScenePatinho: SKScene {
    
    var background_patinhos: SKSpriteNode!
    var patinho: SKSpriteNode!
    var patinhos: [SKSpriteNode] = []
    let texto: SKLabelNode = SKLabelNode(fontNamed: "Arial")
    var quantidadeDePatinhos: Int!
    var numeroDigitado: Int!
    let teclado = Teclado()
    var jogarNovamente: SKSpriteNode!
    var retornarMenu: SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        montaScene()
        montaExercicio(0)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocation)

        var menu: SKScene?
        if toque.name == "jogarNovamente"{
            texto.removeFromParent()
            jogarNovamente.removeFromParent()
            retornarMenu.removeFromParent()
            montaExercicio(0)
            
        }else if toque.name == "retornarMenu"{
            menu = GameScene(size: size)
            self.scene?.view?.presentScene(menu)
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
    
    func montaExercicio(quantidadePatinhos: Int){
        
        if quantidadePatinhos == 0 {
            quantidadeDePatinhos = random(1, hi: 7)
        }else {
            quantidadeDePatinhos = quantidadePatinhos
        }
        
        
        for i in 1...quantidadeDePatinhos{
            
            patinho = SKSpriteNode(imageNamed: "julia")
            patinho.zPosition = 1
            patinho.name = "patinho\(i)"
            patinho.size = CGSize(width: 150, height: 200)
            patinho.position = CGPoint(x: 1100, y: 200)
            
            patinhos.append(patinho)
            
            addChild(patinho)

            let duracao:Int = 2 * Int(i)
            let espera: SKAction = SKAction.waitForDuration(NSTimeInterval(duracao))
            let anda: SKAction = SKAction.moveToX(-70, duration: 1)
            let sequencia: SKAction = SKAction.sequence([espera,anda])
            
            if i == quantidadeDePatinhos {
                patinho.runAction(sequencia, completion: { () -> Void in
                    self.montaResposta(self.quantidadeDePatinhos)
                })
            }else{
                patinho.runAction(sequencia)
            }
        }
    }
    
    func montaResposta(resposta: Int){
        
        for i in 0...patinhos.count-1 {
            patinhos[i].removeFromParent()
        }
        
        teclado.patinho = self
        addChild(teclado)
        
        teclado.position = CGPoint(x: CGRectGetMidX((self.view?.bounds)!), y: CGRectGetMinY((self.view?.bounds)!) + teclado.frame.height/2)

        self.texto.position = CGPoint(x: 450, y: 500)
        self.texto.zPosition = 1
        self.texto.fontSize = 50

        self.texto.text = "RESPOSTA"
        self.texto.fontColor = UIColor.grayColor()
//        self.texto.color = UIColor.grayColor()
        addChild(self.texto)
        
    }
    
    func numeroTocado(numero: String){
        if numero == "DELETE" {
            self.texto.text = "RESPOSTA"
        }else if numero == "ENTER" {
            verificaResposta(numero)
        }else {
            self.texto.text = numero
            numeroDigitado = Int(numero)
        }
        
    }
    
    func verificaResposta(numero: String){
        
        teclado.removeFromParent()
        
        if quantidadeDePatinhos == numeroDigitado {
            texto.text = "PARABENS!!"
            
            jogarNovamente = SKSpriteNode(imageNamed: "seta_rosa")
            jogarNovamente.name = "jogarNovamente"
            jogarNovamente.zPosition = 1
            jogarNovamente.position = CGPoint(x: 600, y: 300)
            
            retornarMenu = SKSpriteNode(imageNamed: "seta_back")
            retornarMenu.name = "retornarMenu"
            retornarMenu.zPosition = 1
            retornarMenu.position = CGPoint(x: 400, y: 300)
            
            addChild(jogarNovamente)
            addChild(retornarMenu)
        }else{
            texto.removeFromParent()
            montaExercicio(quantidadeDePatinhos)
        }
    }
    
}
