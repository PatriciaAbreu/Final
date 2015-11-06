//
//  Tecla.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 06/11/15.
//  Copyright © 2015 Patricia de Abreu. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Tecla: SKSpriteNode {
    
    
    var teclado: Teclado?
    var character:Character = " "
    var type:String = ""
    
    init(character:Character) {
        let imageNamed = "btn_keyboard\(random(1, hi: 3)).png"
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        
        self.character = character
        let label = SKLabelNode(fontNamed: "Arial-Bold")
        label.text = String(character)
        label.position = CGPoint(x: 0, y: label.frame.height * -0.5)
        label.fontColor = UIColor.blackColor()
        label.zPosition = 9999
        self.addChild(label)
        
        self.userInteractionEnabled = true
    }
    
    init(imageNamed:String) {
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        
        self.userInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.colorBlendFactor = 0.5
        self.color = UIColor.darkGrayColor()
        self.teclado?.touchesBegan(self)
    }
    
    func touchesCancelled() {
        self.colorBlendFactor = 0
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //analisar qual botao foi pressionado
        
        
        print("Touches Ended: \(self.character)")
        self.teclado?.touchesEnded(touches, withEvent: event)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.teclado?.touchesMoved(touches, withEvent: event)
    }
}
