//
//  Personagem_Menu.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 16/09/15.
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
}