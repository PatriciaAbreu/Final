//
//  Teclado.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 06/11/15.
//  Copyright © 2015 Patricia de Abreu. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Teclado: SKSpriteNode {
    
    private var touchedKeys = [Tecla]()
    
    var numeric = ["1", "2", "3", "\n", 0, "4", "5", "6", "\n", 0, "7", "8", "9", "\n", 0, "DELETE", "0","DELETE"]
    
    init() {
        let texture = SKTexture(imageNamed: "bg_keyboard.png")
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        
        self.zPosition = 9999
        
        var lastKey:Tecla?
        var initialPosX:CGFloat!
        var posX:CGFloat = 0
        var posY:CGFloat = 0
        
        let characters = self.numeric
        
        let numberOfCharacters = characters.count
        for i in 0 ..< numberOfCharacters {
            
            let character = characters[i]
            
            if let number = character as? CGFloat {
                initialPosX = initialPosX! - lastKey!.size.width * number
                lastKey = nil
            }else if character == "\n" {
                posY--
                posX = 0
            }else {
                var key:Tecla!
                
                if character == "DELETE" {
                    key = Tecla(imageNamed: "btn_keyboard_backspace.png")
                }else {
                    key = Tecla(character: Character(character as! String))
                }
                key.teclado = self
                key.zPosition = 9999
                if lastKey == nil {
                    lastKey = key
                    
                    if initialPosX == nil {
                        initialPosX = (self.size.width * 0.5) - lastKey!.size.width * 0.5 - EstiloTeclado.left
                    }
                    
                    key.position = CGPoint(x: (posX * lastKey!.size.width) - initialPosX + posX * EstiloTeclado.space, y: posY * lastKey!.size.height + posY * EstiloTeclado.space + EstiloTeclado.top)
                }else {
                    key.position = CGPoint(x: lastKey!.position.x + lastKey!.size.width * 0.5 + key.size.width * 0.5 + EstiloTeclado.space, y: posY * lastKey!.size.height + posY * EstiloTeclado.space + EstiloTeclado.top)
                    
                    lastKey = key
                }
                
                
                self.addChild(key)
                posX++
            }
        }
        
        self.userInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchesBegan(touched: Tecla) {
        self.cleanTouch()
        self.touchedKeys.append(touched)
    }
    
    func cleanTouch() {
        let count = self.touchedKeys.count
        for _ in 0 ..< count {
            self.touchedKeys.removeLast().touchesCancelled()
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.cleanTouch()
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let location = touches.first?.locationInNode(self) {
            let point = self.convertPoint(location, fromNode: self)
            for touched in self.touchedKeys {
                if !touched.containsPoint(point) {
                    touched.touchesCancelled()
                    self.touchedKeys.removeAtIndex(self.touchedKeys.indexOf(touched)!)
                }
            }
        }
    }
}