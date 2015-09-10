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
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        var touche = touches.first as! UITouch
        var touchLocation = touche.locationInNode(self.parent)
        
        Numero.toque = touchLocation
//
//        var toque = nodeAtPoint(touchLocation)
//        
//        //quando apertar os numeros eles devem ir para seus lugares
//        if toque.name == "exercicio1_0" {
//            
//            toque.runAction(SKAction.moveToX(100, duration: 0.3))
//            toque.name = "fim0"
//            Numero.verifica = 0
//            
//        }else if toque.name == "exercicio1_1" && Numero.verifica == 0{
//         
//            toque.runAction(SKAction.moveToX(180, duration: 0.3))
//            toque.runAction(SKAction.moveToY(700, duration: 0.3))
//            toque.name = "fim1"
//            Numero.verifica = 1
//            
//        }else if toque.name == "exercicio1_2" && Numero.verifica == 1{
//            
//            toque.runAction(SKAction.moveToX(260, duration: 0.3))
//            toque.runAction(SKAction.moveToY(700, duration: 0.3))
//            toque.name = "fim2"
//            Numero.verifica = 2
//            
//        }else if toque.name == "exercicio1_3" && Numero.verifica == 2{
//            
//            toque.runAction(SKAction.moveToX(340, duration: 0.3))
//            toque.runAction(SKAction.moveToY(700, duration: 0.3))
//            toque.name = "fim3"
//            Numero.verifica = 3
//
//        }else if toque.name == "exercicio1_4" && Numero.verifica == 3{
//            
//            toque.runAction(SKAction.moveToX(420, duration: 0.3))
//            toque.runAction(SKAction.moveToY(700, duration: 0.3))
//            toque.name = "fim4"
//            Numero.verifica = 4
//            
//        }else if toque.name == "exercicio1_5" && Numero.verifica == 4{
//            
//            toque.runAction(SKAction.moveToX(500, duration: 0.3))
//            toque.runAction(SKAction.moveToY(700, duration: 0.3))
//            toque.name = "fim5"
//            Numero.verifica = 5
//            
//        }else if toque.name == "exercicio1_6" && Numero.verifica == 5{
//            
//            toque.runAction(SKAction.moveToX(580, duration: 0.3))
//            toque.runAction(SKAction.moveToY(700, duration: 0.3))
//            toque.name = "fim6"
//            Numero.verifica = 6
//            
//        }else if toque.name == "exercicio1_7" && Numero.verifica == 6{
//            
//            toque.runAction(SKAction.moveToX(660, duration: 0.3))
//            toque.runAction(SKAction.moveToY(700, duration: 0.3))
//            toque.name = "fim7"
//            Numero.verifica = 7
//            
//        }else if toque.name == "exercicio1_8" && Numero.verifica == 7 {
//            
//            toque.runAction(SKAction.moveToX(740, duration: 0.3))
//            toque.runAction(SKAction.moveToY(700, duration: 0.3))
//            toque.name = "fim8"
//            Numero.verifica = 8
//            
//        }else if toque.name == "exercicio1_9" && Numero.verifica == 8{
//            
//            toque.runAction(SKAction.moveToX(820, duration: 0.3))
//            toque.runAction(SKAction.moveToY(700, duration: 0.3))
//            toque.name = "fim9"
//            Numero.verifica = 9
//            
//        }else if toque.name == "exercicio1_10" && Numero.verifica == 9{
//            
//            toque.runAction(SKAction.moveToX(900, duration: 0.3))
//            toque.runAction(SKAction.moveToY(700, duration: 0.3))
//            toque.name = "fim10"
//            Numero.verifica = 10
//            
//            // chama o método procuraJulia() da classe GameScene_Numeros
//            (toque.parent as! GameScene_Numeros).procurarJulia()
//        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        var touch = touches.first as! UITouch
        var location:CGPoint!
        location = touch.locationInNode(self.parent)
    
        self.position = location
        
        println(location)
        println(self.position)

    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        var touch = touches.first as! UITouch
        var location:CGPoint!
        location = touch.locationInNode(self.parent)
        
        self.position = location
        
        println("ended")
        println(location)
        println(self.position)
        
        var toque = nodeAtPoint(location)
        
        if toque.position.y >= 670 && toque.position.y <= 700 {
            
            if toque.name == "exercicio1_0" {
                if toque.position.x >= 90 && toque.position.x <= 115 && Numero.verifica == nil{
                    
                    println("ENTROUUU")
                    Numero.verifica = 0
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio1_1" {
                if toque.position.x >= 170 && toque.position.x <= 200 && Numero.verifica == nil{
                    
                    println("ENTROU1")
                    Numero.verifica = 1
                    
                }else {
                    
                    toque.position = Numero.toque
                }
            }else if toque.name == "exercicio1_2" {
                if toque.position.x >= 250 && toque.position.x <= 270 && Numero.verifica == 1{
                    
                    println("ENTROU2")
                    Numero.verifica = 2
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio1_3" {
                if toque.position.x >= 320 && toque.position.x <= 360 && Numero.verifica == 2{
                    
                    println("ENTROU3")
                    Numero.verifica = 3
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio1_4" {
                if toque.position.x >= 400 && toque.position.x <= 450 && Numero.verifica == 3{
                    
                    println("ENTROU4")
                    Numero.verifica = 4
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio1_5" {
                if toque.position.x >= 490 && toque.position.x <= 520 && Numero.verifica == 4{
                    
                    println("ENTROU5")
                    Numero.verifica = 5
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio1_6" {
                if toque.position.x >= 560 && toque.position.x <= 600 && Numero.verifica == 5{
                    
                    println("ENTROU6")
                    Numero.verifica = 6
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio1_7" {
                if toque.position.x >= 630 && toque.position.x <= 680 && Numero.verifica == 6{
                    
                    println("ENTROU7")
                    Numero.verifica = 7
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio1_8" {
                if toque.position.x >= 710 && toque.position.x <= 760 && Numero.verifica == 7{
                    
                    println("ENTROU8")
                    Numero.verifica = 8
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio1_9" {
                if toque.position.x >= 790 && toque.position.x <= 830 && Numero.verifica == 8{
                    
                    println("ENTROU9")
                    Numero.verifica = 9
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }else if toque.name == "exercicio1_10" {
                if toque.position.x >= 870 && toque.position.x <= 910 && Numero.verifica == 9{
                    
                    println("ENTROU10")
                    Numero.verifica = 10
                    
//                     chama o método procuraJulia() da classe GameScene_Numeros
                    (toque.parent as! GameScene_Numeros).procurarJulia()
                    
                }else {
                    
                    toque.position = Numero.toque
                    
                }
            }
        }
        
    }
}
