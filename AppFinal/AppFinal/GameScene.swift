//
//  GameScene.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 17/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var gameController: GameViewController!
    
    //background
    var backgroundPrincipal: SKSpriteNode!
    
    //icones do menu
    var menu_numeros: SKSpriteNode!
    var menu_espaco_forma: SKSpriteNode!
    var menu_operacoes: SKSpriteNode!
    var menu_grandeza_medidas:SKSpriteNode!
    
    var menu: SKSpriteNode!
    
    var circulo_menu: SKSpriteNode!
    var personagem1_menu: SKSpriteNode!
    var personagem2_menu: SKSpriteNode!
    var personagem3_menu: SKSpriteNode!
    var personagem4_menu: SKSpriteNode!
    
    var menuTocado: SKSpriteNode!
    
    
    override func didMoveToView(view: SKView) {

        //chamada para montar tela inicial
        montarScene()
        montarMenu()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        //verifica qual menu foi tocado
        let touch = touches.first
        let touchLocatio = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocatio)
        var novaScene = SKScene()
        
        if toque.name == "personagem1" {
            print("personagem1")
            if toque.position.x == 295 {
                toque.runAction(SKAction.moveTo(CGPoint(x: 525, y: 620), duration: 0.4))
                toque.runAction(SKAction.rotateToAngle(0, duration: 0.4))
                
                personagem2_menu.runAction(SKAction.moveTo(CGPoint(x: 755, y: 400), duration: 0.4))
                personagem2_menu.runAction(SKAction.rotateToAngle(0, duration: 0.4))
                
                personagem3_menu.runAction(SKAction.moveTo(CGPoint(x: 525, y: 180), duration: 0.4))
                personagem3_menu.runAction(SKAction.rotateToAngle(0, duration: 0.4))
                
                personagem4_menu.runAction(SKAction.moveTo(CGPoint(x: 295, y: 400), duration: 0.4))
                personagem4_menu.runAction(SKAction.rotateToAngle(0, duration: 0.4))
                
            }
//            toque.runAction(SKAction.moveTo(CGPoint(x: 525, y: 620), duration: 0.4))
//            toque.runAction(SKAction.rotateToAngle(1.5, duration: 0.4))
//            
//            personagem2_menu.runAction(SKAction.moveTo(CGPoint(x: 525, y: 400), duration: 0.4))
//            personagem2_menu.runAction(SKAction.rotateToAngle(1.5, duration: 0.4))
//            
//            personagem3_menu.runAction(SKAction.moveTo(CGPoint(x: 525, y: 180), duration: 0.4))
//            personagem3_menu.runAction(SKAction.rotateToAngle(1.5, duration: 0.4))
//            
//            personagem4_menu.runAction(SKAction.moveTo(CGPoint(x: 295, y: 400), duration: 0.4))
//            personagem4_menu.runAction(SKAction.rotateToAngle(1.5, duration: 0.4))
            
            novaScene = GameScene_Numeros(size: size)
            
        }else if toque.name == "personagem2" {
            print("personagem2")
            
            toque.runAction(SKAction.moveTo(CGPoint(x: 525, y: 620), duration: 0.4))
            toque.runAction(SKAction.rotateToAngle(1.5, duration: 0.4))
            
            personagem1_menu.runAction(SKAction.moveTo(CGPoint(x: 295, y: 400), duration: 0.4))
            personagem1_menu.runAction(SKAction.rotateToAngle(1.5, duration: 0.4))
            
            personagem4_menu.runAction(SKAction.moveTo(CGPoint(x: 525, y: 180), duration: 0.4))
            personagem4_menu.runAction(SKAction.rotateToAngle(1.5, duration: 0.4))
            
            personagem3_menu.runAction(SKAction.moveTo(CGPoint(x: 755, y: 400), duration: 0.4))
            personagem3_menu.runAction(SKAction.rotateToAngle(1.5, duration: 0.4))
            
            novaScene = GameScene_Numeros(size: size)
            
        }else if toque.name == "personagem3" {
            print("personagem3")
            
//            toque.runAction(SKAction.moveTo(CGPoint(x: <#CGFloat#>, y: <#CGFloat#>), duration: <#NSTimeInterval#>))
            novaScene = GameScene_Numeros(size: size)
            
        }else if toque.name == "personagem4" {
            print("personagem4")
            
            novaScene = GameScene_Numeros(size: size)
        }
        

//      self.scene!.view?.presentScene(novaScene)

    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func montarScene(){
        
        //imagem de plano de fundo
        backgroundPrincipal = SKSpriteNode(imageNamed: "backgroundGrass")
        backgroundPrincipal.zPosition = 1
        backgroundPrincipal.name = "backGroundPrincipal"
        backgroundPrincipal.size = CGSize(width: 1050, height: 800)
        backgroundPrincipal.position = CGPoint(x: 510, y: 400)
        
        addChild(backgroundPrincipal)
    }
    
    func montarMenu() {
        
        circulo_menu = SKSpriteNode(imageNamed: "circulo")
        circulo_menu.zPosition = 1
        circulo_menu.position = CGPoint(x: 525, y: 400)
        circulo_menu.name = "circulo_menu"
        
        personagem1_menu = SKSpriteNode(imageNamed: "personagem1")
        personagem1_menu.zPosition = 1
        personagem1_menu.position = CGPoint(x: 525, y: 620)
        personagem1_menu.name = "personagem1"
        
        personagem2_menu = SKSpriteNode(imageNamed: "personagem2")
        personagem2_menu.zPosition = 1
        personagem2_menu.position = CGPoint(x: 755, y: 400)
        personagem2_menu.name = "personagem2"
        
        personagem3_menu = SKSpriteNode(imageNamed: "personagem3")
        personagem3_menu.zPosition = 1
        personagem3_menu.position = CGPoint(x: 525, y: 180)
        personagem3_menu.name = "personagem3"
        
        personagem4_menu = SKSpriteNode(imageNamed: "personagem4")
        personagem4_menu.zPosition = 1
        personagem4_menu.position = CGPoint(x: 295, y: 400)
        personagem4_menu.name = "personagem4"
        
        addChild(circulo_menu)
        addChild(personagem1_menu)
        addChild(personagem2_menu)
        addChild(personagem3_menu)
        addChild(personagem4_menu)
        
    }
    
//    func montarMenu() {
//        
//        //posicionando os menus na tela
//        menu_numeros = SKSpriteNode(imageNamed: "menuAzul_Numeros.png")
//        menu_numeros.zPosition = 1
//        menu_numeros.position = CGPoint(x: 300, y: 530)
//        menu_numeros.name = "menu_numeros"
//        
//        menu_operacoes = SKSpriteNode(imageNamed: "menuVerde_Operacoes.png")
//        menu_operacoes.zPosition = 1
//        menu_operacoes.position = CGPoint(x: 300, y: 230)
//        menu_operacoes.name = "menu_operacoes"
//        
//        menu_espaco_forma = SKSpriteNode(imageNamed: "menuRosaClaro_Espaco.png")
//        menu_espaco_forma.zPosition = 1
//        menu_espaco_forma.position = CGPoint(x: 750, y: 530)
//        menu_espaco_forma.name = "menu_espaco_forma"
//        
//        menu_grandeza_medidas = SKSpriteNode(imageNamed: "menuLaranja_Grandezas.png")
//        menu_grandeza_medidas.zPosition = 1
//        menu_grandeza_medidas.position = CGPoint(x: 750, y: 200)
//        menu_grandeza_medidas.name = "menu_grandeza_medidas"
//        
//        //fazer o menu aparecer
////        addChild(menu_numeros)
////        addChild(menu_operacoes)
////        addChild(menu_espaco_forma)
////        addChild(menu_grandeza_medidas)
//    }
}
