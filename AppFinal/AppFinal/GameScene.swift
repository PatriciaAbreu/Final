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
    
    var menuTocado: SKSpriteNode!
    
    
    override func didMoveToView(view: SKView) {

        //chamada para montar tela inicial
        montarScene()
        montarMenu()
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {

        //verifica qual menu foi tocado
        let touch = touches.first as! UITouch
        let touchLocatio = touch.locationInNode(self)
        
        var toque = self.nodeAtPoint(touchLocatio)
        var novaScene = SKScene()
        
        if toque.name == "menu_numeros" {
            menuTocado = toque as! SKSpriteNode
            println("NUMEROS")
            
            novaScene = GameScene_Numeros(size: size)
            
        }else if toque.name == "menu_operacoes" {
            menuTocado = toque as! SKSpriteNode
            println("OPERACOES")
            
            novaScene = GameScene_Operacoes(size: size)
            
        }else if toque.name == "menu_espaco_forma" {
            menuTocado = toque as! SKSpriteNode
            println("ESPACO")
            
            novaScene = GameScene_Espaco(size: size)
            
        }else if toque.name == "menu_grandeza_medidas" {
            menuTocado = toque as! SKSpriteNode
            println("GRANDEZA")
            
            novaScene = GameScene_Grandezas(size: size)
        }
        
        self.scene!.view?.presentScene(novaScene)

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
    
        //posicionando os menus na tela
        menu_numeros = SKSpriteNode(imageNamed: "menuAzul_Numeros.png")
        menu_numeros.zPosition = 1
        menu_numeros.position = CGPoint(x: 300, y: 530)
        menu_numeros.name = "menu_numeros"
        
        menu_operacoes = SKSpriteNode(imageNamed: "menuVerde_Operacoes.png")
        menu_operacoes.zPosition = 1
        menu_operacoes.position = CGPoint(x: 300, y: 230)
        menu_operacoes.name = "menu_operacoes"
        
        menu_espaco_forma = SKSpriteNode(imageNamed: "menuRosaClaro_Espaco.png")
        menu_espaco_forma.zPosition = 1
        menu_espaco_forma.position = CGPoint(x: 750, y: 530)
        menu_espaco_forma.name = "menu_espaco_forma"
        
        menu_grandeza_medidas = SKSpriteNode(imageNamed: "menuLaranja_Grandezas.png")
        menu_grandeza_medidas.zPosition = 1
        menu_grandeza_medidas.position = CGPoint(x: 750, y: 200)
        menu_grandeza_medidas.name = "menu_grandeza_medidas"
        
        //fazer o menu aparecer
        addChild(menu_numeros)
        addChild(menu_operacoes)
        addChild(menu_espaco_forma)
        addChild(menu_grandeza_medidas)
    }
}
