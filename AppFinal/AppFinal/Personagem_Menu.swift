//
//  Personagem_Menu.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 16/09/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit

class Personagem_Menu: SKSpriteNode {
    
    var posicao: Int!
    
    init(texture: SKTexture!, color: UIColor!, size: CGSize, posicao: Int) {
        super.init(texture: texture, color: color, size: size)
        self.posicao = posicao
        self.userInteractionEnabled = true
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}