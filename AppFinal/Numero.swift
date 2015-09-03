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
        var touchLocation = touche.locationInNode(self)
        
        var toque = nodeAtPoint(touchLocation)
        
        //quando apertar os numeros eles devem ir para seus lugares
        if toque.name == "exercicio1_0" {
            
            toque.runAction(SKAction.moveToX(100, duration: 0.3))
            toque.name = "fim0"
            Numero.verifica = 0
            
        }else if toque.name == "exercicio1_1" && Numero.verifica == 0{
         
            toque.runAction(SKAction.moveToX(180, duration: 0.3))
            toque.runAction(SKAction.moveToY(700, duration: 0.3))
            toque.name = "fim1"
            Numero.verifica = 1
            
        }else if toque.name == "exercicio1_2" && Numero.verifica == 1{
            
            toque.runAction(SKAction.moveToX(260, duration: 0.3))
            toque.runAction(SKAction.moveToY(700, duration: 0.3))
            toque.name = "fim2"
            Numero.verifica = 2
            
        }else if toque.name == "exercicio1_3" && Numero.verifica == 2{
            
            toque.runAction(SKAction.moveToX(340, duration: 0.3))
            toque.runAction(SKAction.moveToY(700, duration: 0.3))
            toque.name = "fim3"
            Numero.verifica = 3

        }else if toque.name == "exercicio1_4" && Numero.verifica == 3{
            
            toque.runAction(SKAction.moveToX(420, duration: 0.3))
            toque.runAction(SKAction.moveToY(700, duration: 0.3))
            toque.name = "fim4"
            Numero.verifica = 4
            
        }else if toque.name == "exercicio1_5" && Numero.verifica == 4{
            
            toque.runAction(SKAction.moveToX(500, duration: 0.3))
            toque.runAction(SKAction.moveToY(700, duration: 0.3))
            toque.name = "fim5"
            Numero.verifica = 5
            
        }else if toque.name == "exercicio1_6" && Numero.verifica == 5{
            
            toque.runAction(SKAction.moveToX(580, duration: 0.3))
            toque.runAction(SKAction.moveToY(700, duration: 0.3))
            toque.name = "fim6"
            Numero.verifica = 6
            
        }else if toque.name == "exercicio1_7" && Numero.verifica == 6{
            
            toque.runAction(SKAction.moveToX(660, duration: 0.3))
            toque.runAction(SKAction.moveToY(700, duration: 0.3))
            toque.name = "fim7"
            Numero.verifica = 7
            
        }else if toque.name == "exercicio1_8" && Numero.verifica == 7 {
            
            toque.runAction(SKAction.moveToX(740, duration: 0.3))
            toque.runAction(SKAction.moveToY(700, duration: 0.3))
            toque.name = "fim8"
            Numero.verifica = 8
            
        }else if toque.name == "exercicio1_9" && Numero.verifica == 8{
            
            toque.runAction(SKAction.moveToX(820, duration: 0.3))
            toque.runAction(SKAction.moveToY(700, duration: 0.3))
            toque.name = "fim9"
            Numero.verifica = 9
            
        }else if toque.name == "exercicio1_10" && Numero.verifica == 9{
            
            toque.runAction(SKAction.moveToX(900, duration: 0.3))
            toque.runAction(SKAction.moveToY(700, duration: 0.3))
            toque.name = "fim10"
            Numero.verifica = 10
            
            // chama o método procuraJulia() da classe GameScene_Numeros
            (toque.parent as! GameScene_Numeros).procurarJulia()
        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        var touch = touches.first as! UITouch
        var location:CGPoint!
        location = touch.locationInNode(self)
    
        self.position = location
        
        println("Moved")
        println(location)
        println(self.position)

    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        var touch = touches.first as! UITouch
        var location:CGPoint!
        location = touch.locationInNode(self)
        
        self.position = location
        
        println("Ended")
        println(location)
        println(self.position)
    }
}
