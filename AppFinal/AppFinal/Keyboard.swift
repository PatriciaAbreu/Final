
//
//  Puzzle.swift
//  Crypto
//
//  Created by Rafael Moris on 05/11/15.
//  Copyright © 2015 Fanatee. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Keyboard:SKSpriteNode {
    private var touchedKeys = [KeyboardKey]()
    
    var numeric = ["1", "2", "3", "\n", 0, "4", "5", "6", "\n", 0, "7", "8", "9", "\n", 0, "DELETE", "0","DELETE"]
    
    var pt_BR = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "\n", 0.5, "A", "S", "D", "F", "G", "H", "J", "K", "L", "\n", 0.6, "Z", "X", "C", "V", "B", "N", "M", "DELETE"]
    
    var es_ES = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "\n", 0.15, "A", "S", "D", "F", "G", "H", "J", "K", "L", "Ñ", "\n", 0.6, "Z", "X", "C", "V", "B", "N", "M", "DELETE"]
    
    init() {
        let texture = SKTexture(imageNamed: "bg_keyboard.png")
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        
        self.zPosition = 9999
        
        var lastKey:KeyboardKey?
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
                var key:KeyboardKey!
                
                if character == "DELETE" {
                    key = KeyboardKey(imageNamed: "btn_keyboard_backspace.png")
                }else {
                    key = KeyboardKey(character: Character(character as! String))
                }
                key.keyboard = self
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
    
    func touchesBegan(touched: KeyboardKey) {
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