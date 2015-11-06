//
//  Numero.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 27/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit

class Numero: SKSpriteNode {
    
    var numero: Int!
    var exercicio: Int!
    static var verifica: Int?
    static var toque: CGPoint!
    
    
    init(texture: SKTexture!, color: UIColor!, size: CGSize, numero:Int, exercicio: Int) {
        super.init(texture: texture, color: color, size: size)
        self.userInteractionEnabled = true
        
        self.numero = numero
        self.exercicio = exercicio
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self.parent!)
        var location:CGPoint!
        
        location = touch!.locationInNode(self.parent!)
        
        Numero.toque = touchLocation
        
        print("began")
        print(Numero.toque)
        let toque = nodeAtPoint(location)
           
        //faz a analise da soma dos numeros do jogo da piscina de bolinhas
        if toque.name == "exercicio3.1_1" {
            
            Numero.verifica = 1
            (toque.parent as! GameScenePiscina).soma()
            
        }else if toque.name == "exercicio3.1_2" && Numero.verifica == 1{
            
            Numero.verifica = 2
            (toque.parent as! GameScenePiscina).soma()
            
        }else if toque.name == "exercicio3.1_3" || toque.name == "exercicio3.1_4" || toque.name == "exercicio3.1_5" || toque.name == "exercicio3.1_6" || toque.name == "exercicio3.1_7" || toque.name == "exercicio3.1_8" || toque.name == "exercicio3.1_9" || toque.name == "exercicio3.1_0" {
            
            Numero.verifica = 0
            (toque.parent as! GameScenePiscina).soma()
        }
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        var location:CGPoint!
        location = touch!.locationInNode(self.parent!)
        
        self.position = location
        
        let toque = nodeAtPoint(location)
        
        let toc = toque as! Numero
        
        if toc.exercicio == 1 {
            //chama método da classe GameSceneEsconde para posicionar o objeto do tipo Numero tocado na posição correta
            (toque.parent as! GameSceneEsconde).posicionarNumero(toc)
        }
        
        
        
        
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        var location:CGPoint!
        location = touch!.locationInNode(self.parent!)
        
        
        let toque = nodeAtPoint(location)
        
        let toc = toque as! Numero
        
        if toc.exercicio == 1 {
            (toque.parent as! GameSceneEsconde).verificaPosicao(toc)
        }
        if toc.exercicio != 1 {
            self.position = location
            
            
            // faz a analise dos números jogo da cozinha
            if toque.name == "exercicio2_5" {
                
                toque.runAction(SKAction.scaleTo(2, duration: 0.4))
                (toque.parent as! GameSceneCozinha).prontoParaCozinhar()
                
            }else if toque.name == "exercicio2_1" || toque.name == "exercicio2_2" || toque.name == "exercicio2_3" || toque.name == "exercicio2_4" || toque.name == "exercicio2_6" || toque.name == "exercicio2_7" || toque.name == "exercicio2_8" || toque.name == "exercicio2_9" || toque.name == "exercicio2_10" {
                
                (toque as! GameSceneCozinha).contouErrado()
            }
            
            //faz a analise dos números do jogo da piscina de bolinhas
            if toque.name == "exercicio3_4_certo" {
                if toque.position.x >= 830 && toque.position.x <= 870 && toque.position.y >= 230 && toque.position.y <= 270 {
                    
                    toque.name = "exercicio3_4_novo"
                    
                }else {
                    
                    toque.position = Numero.toque
                }
                
            }else if toque.name == "exercicio3_3_certo" {
                if toque.position.x >= 830 && toque.position.x <= 870 && toque.position.y >= 230 && toque.position.y <= 270 {
                    
                    toque.name = "exercicio3_3_novo"
                    
                }else{
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio3_5_certo" {
                if toque.position.x >= 830 && toque.position.x <= 870 && toque.position.y >= 230 && toque.position.y <= 270 {
                    
                    toque.name = "exercicio3_5_novo"
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio3_7_certo" {
                if toque.position.x >= 830 && toque.position.x <= 870 && toque.position.y >= 230 && toque.position.y <= 270 {
                    
                    toque.name = "exercicio3_7_novo"
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio3_2_certo" {
                if toque.position.x >= 830 && toque.position.x <= 870 && toque.position.y >= 230 && toque.position.y <= 270 {
                    
                    toque.name = "exercicio3_2_novo"
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio3_1" || toque.name == "exercicio3_2" || toque.name == "exercicio3_3" || toque.name == "exercicio3_4" || toque.name == "exercicio3_5" || toque.name == "exercicio3_6" || toque.name == "exercicio3_7" || toque.name == "exercicio3_8" || toque.name == "exercicio3_9" || toque.name == "exercicio3_10" {
                
                toque.position = Numero.toque
                
            }
            
        }
    }
}
