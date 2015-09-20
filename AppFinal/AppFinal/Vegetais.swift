//
//  File.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 20/09/15.
//  Copyright © 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit

class Vegetais: SKSpriteNode {
    
    
    static var verifica: Int?
    static var toque: CGPoint!
    var tipo: String!
    
    init(texture: SKTexture!, color: UIColor, size: CGSize, tipo: String) {
        super.init(texture: texture, color: color, size: size)
        self.userInteractionEnabled = true
        
        self.tipo = tipo
       
        
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
        
        if toque.position.x >= 405 && toque.position.x <= 619 && toque.position.y >= 210 && toque.position.y <= 440 {
            
            print("ENTROU")
            
            if toque.name == "abacaxi" || toque.name == "banana" || toque.name == "kiwi" {
                
                toque.position = Vegetais.toque
            }
        }

    }
}