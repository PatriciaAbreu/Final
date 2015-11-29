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
    var exercicio: Int!
    static var verifica: Int?
    static var toque: CGPoint!
    
    
    init(texture: SKTexture!, color: UIColor!, size: CGSize, numero:Int, exercicio: Int) {
        super.init(texture: texture, color: color, size: size)
        self.userInteractionEnabled = true
        
        self.numero = numero
        self.exercicio = exercicio
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self.parent!)
        var location:CGPoint!
        
        location = touch!.locationInNode(self.parent!)
        
        Numero.toque = touchLocation
        
        print("began")
        print(Numero.toque)
        let toque = nodeAtPoint(location)
           
        
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        var location:CGPoint!
        location = touch!.locationInNode(self.parent!)
        
        self.position = location
        
        let toque = nodeAtPoint(location)
        
        let toc = toque as! Numero
        
        if toc.exercicio == 1 {
            //chama método da classe GameSceneEsconde para posicionar o objeto do tipo Numero tocado na posição correta
            (toque.parent as! GameSceneEsconde).posicionarNumero(toc)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        var location:CGPoint!
        location = touch!.locationInNode(self.parent!)
        
        
        let toque = nodeAtPoint(location)
        
        let toc = toque as! Numero
        
        if toc.exercicio == 1 {
            (toque.parent as! GameSceneEsconde).verificaPosicao(toc)
        }
        
        if toc.exercicio != 1 {
            self.position = location
            
            
        }
    }
}
