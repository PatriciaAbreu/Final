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
    static var verifica: Int?
    static var toque: CGPoint!
    
    
    init(texture: SKTexture!, color: UIColor!, size: CGSize, numero:Int) {
        super.init(texture: texture, color: color, size: size)
        self.userInteractionEnabled = true
        
        self.numero = numero
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self.parent!)
        var location:CGPoint!
        
        location = touch!.locationInNode(self.parent!)
        
        let toque = nodeAtPoint(location)
        
        Numero.toque = touchLocation
        
        //faz a analise da soma dos numeros do jogo da piscina de bolinhas
        if toque.name == "exercicio3.1_1" {
            
            Numero.verifica = 1
            (toque.parent as! GameScene_Piscina).soma()
            
        }else if toque.name == "exercicio3.1_2" && Numero.verifica == 1{
            
            Numero.verifica = 2
            (toque.parent as! GameScene_Piscina).soma()
            
        }else if toque.name == "exercicio3.1_3" || toque.name == "exercicio3.1_4" || toque.name == "exercicio3.1_5" || toque.name == "exercicio3.1_6" || toque.name == "exercicio3.1_7" || toque.name == "exercicio3.1_8" || toque.name == "exercicio3.1_9" || toque.name == "exercicio3.1_0" {
            
            Numero.verifica = 0
            (toque.parent as! GameScene_Piscina).soma()
        }

    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        var location:CGPoint!
        location = touch!.locationInNode(self.parent!)
    
        self.position = location
        
        print(location)
        print(self.position)

    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        var location:CGPoint!
        location = touch!.locationInNode(self.parent!)
        
        self.position = location
        
        print("ended")
        print(location)
        print(self.position)
        
        let toque = nodeAtPoint(location)
        
        if toque.position.y >= 670 && toque.position.y <= 700 {
            
            if toque.name == "exercicio1_0" {
                if toque.position.x >= 90 && toque.position.x <= 115 && Numero.verifica == nil{
                    
                    print("ENTROUUU")
                    Numero.verifica = 0
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio1_1" {
                if toque.position.x >= 170 && toque.position.x <= 200 && Numero.verifica == nil{
                    
                    print("ENTROU1")
                    Numero.verifica = 1
                    
                }else {
                    
                    toque.position = Numero.toque
                }
            }else if toque.name == "exercicio1_2" {
                if toque.position.x >= 250 && toque.position.x <= 270 && Numero.verifica == 1{
                    
                    print("ENTROU2")
                    Numero.verifica = 2
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio1_3" {
                if toque.position.x >= 320 && toque.position.x <= 360 && Numero.verifica == 2{
                    
                    print("ENTROU3")
                    Numero.verifica = 3
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio1_4" {
                if toque.position.x >= 400 && toque.position.x <= 450 && Numero.verifica == 3{
                    
                    print("ENTROU4")
                    Numero.verifica = 4
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio1_5" {
                if toque.position.x >= 490 && toque.position.x <= 520 && Numero.verifica == 4{
                    
                    print("ENTROU5")
                    Numero.verifica = 5
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio1_6" {
                if toque.position.x >= 560 && toque.position.x <= 600 && Numero.verifica == 5{
                    
                    print("ENTROU6")
                    Numero.verifica = 6
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio1_7" {
                if toque.position.x >= 630 && toque.position.x <= 680 && Numero.verifica == 6{
                    
                    print("ENTROU7")
                    Numero.verifica = 7
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio1_8" {
                if toque.position.x >= 710 && toque.position.x <= 760 && Numero.verifica == 7{
                    
                    print("ENTROU8")
                    Numero.verifica = 8
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio1_9" {
                if toque.position.x >= 790 && toque.position.x <= 830 && Numero.verifica == 8{
                    
                    print("ENTROU9")
                    Numero.verifica = 9
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio1_10" {
                if toque.position.x >= 870 && toque.position.x <= 910 && Numero.verifica == 9{
                    
                    print("ENTROU10")
                    Numero.verifica = 10
                    
//                     chama o método procuraJulia() da classe GameScene_Numeros
                    (toque.parent as! GameScene_Esconde).procurarJulia()
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }
        }
        
        // faz a analise dos números jogo da cozinha
        if toque.name == "exercicio2_5" {
            
            toque.runAction(SKAction.scaleTo(2, duration: 0.4))
            (toque.parent as! GameScene_Cozinha).prontoParaCozinhar()
            
        }else if toque.name == "exercicio2_1" || toque.name == "exercicio2_2" || toque.name == "exercicio2_3" || toque.name == "exercicio2_4" || toque.name == "exercicio2_6" || toque.name == "exercicio2_7" || toque.name == "exercicio2_8" || toque.name == "exercicio2_9" || toque.name == "exercicio2_10" {
            
            (toque as! GameScene_Cozinha).contouErrado()
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
