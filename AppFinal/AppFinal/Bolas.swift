//
//  Bolas.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 04/10/15.
//  Copyright © 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit

class Bolas: SKSpriteNode {
    
    
    static var verifica: Int = 0
    static var toque: CGPoint!
    var tipo: String!
    
    override init(texture: SKTexture!, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.userInteractionEnabled = true  
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touche = touches.first
        let touchLocation = touche!.locationInNode(self.parent!)
        
        Vegetais.toque = touchLocation
        
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
        
        let toque = nodeAtPoint(location)
        
       

        }
        
    }

