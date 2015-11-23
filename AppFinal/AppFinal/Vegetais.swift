//
//  File.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 20/09/15.
//  Copyright © 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit

class Vegetais: SKSpriteNode {
    
    
    static var verifica: Int = 0
    static var toque: CGPoint!
    static var dentro: Int = 0
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
        var location:CGPoint!
        location = touche!.locationInNode(self.parent!)
        let toque = nodeAtPoint(location)
        
        Vegetais.toque = touchLocation
        
        if toque.position.x >= 390 && toque.position.x <= 630 && toque.position.y >= 190 && toque.position.y <= 470 {
            toque.position = Vegetais.toque
            Vegetais.dentro = 1
        }else{
            Vegetais.dentro = 0
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
        
        let toque = nodeAtPoint(location)
        
        if toque.position.x >= 390 && toque.position.x <= 630 && toque.position.y >= 190 && toque.position.y <= 470 {
            
            print("ENTROU")
            
            if toque.name == "abacaxi" || toque.name == "banana" || toque.name == "kiwi" {
                
                toque.position = Vegetais.toque
            }else if Vegetais.dentro == 0{
                Vegetais.verifica++
                print(Vegetais.verifica)
                if Vegetais.verifica == 5 {
//                    (toque.parent as! GameSceneCozinha).vamosContar()
                }
            }
        }

    }
}