//
//  Numero.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 27/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit

class Numero: SKSpriteNode {
    
    override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.userInteractionEnabled = true
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
            
            toque.runAction(SKAction.moveToX(500, duration: 0.3))

        }else if toque.name == "exercicio1_1" {
         
            toque.runAction(SKAction.moveToX(580, duration: 0.3))
            toque.runAction(SKAction.moveToY(700, duration: 0.3))
            
        }else if toque.name == "exercicio1_2" {
            
            toque.runAction(SKAction.moveToX(660, duration: 0.3))
            toque.runAction(SKAction.moveToY(700, duration: 0.3))
            
        }else if toque.name == "exercicio1_3" {
            
            toque.runAction(SKAction.moveToX(740, duration: 0.3))
            toque.runAction(SKAction.moveToY(700, duration: 0.3))
            toque.name = "fim"
        }
    }
}
