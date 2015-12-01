//
//  GameScene_Operacoes.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 17/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit
import MediaPlayer
import AVFoundation

class Credito: SKScene {
    var gameController: GameViewController!
    
    var background: SKSpriteNode!
    
    var voltar: SKSpriteNode!
    
    var novaScene: SKScene!
    
    var videoSprite: SKVideoNode!
    var audio: AVAudioPlayer!
    var raioSol: SKSpriteNode!
    var sol: SKSpriteNode!
    
    var titulo: SKSpriteNode!
    
    var fundoTexto: SKSpriteNode!
    
    var textoDesenvolvido: SKLabelNode!
    var textoDesenvolvidoNome: SKLabelNode!
    var textoDesign: SKLabelNode!
    var textoDesignNome: SKLabelNode!
    var textoInterprete: SKLabelNode!
    var textoInterpreteNome: SKLabelNode!
    
    override func didMoveToView(view: SKView) {
        
        montarScene()

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocation)
        
        if toque.name == "voltar" {
            novaScene = GameScene(size: size)
        }
        
        if novaScene != nil {
            background.removeFromParent()
            voltar.removeFromParent()
//            videoSprite.removeFromParent()
            
            self.scene?.view?.presentScene(novaScene)
        }
        
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func montarScene(){
        
        scene?.view?.backgroundColor = UIColor.whiteColor()
        
        //posiciona e adiciona o plano de fundo
        background = SKSpriteNode(imageNamed: "cenarioPrincipalSol")
        background.zPosition = 2
        background.name = "backgroundMenuJogos"
        background.size = CGSize(width: 1424, height: 800)
        background.position = CGPoint(x: 670, y: 400)
        
        raioSol = SKSpriteNode(imageNamed: "raioSol")
        raioSol.zPosition = 2
        raioSol.name = "raioSol"
        raioSol.size = CGSize(width: 2100, height: 1999)
        raioSol.position = CGPoint(x: 140, y: 630)
        
        sol = SKSpriteNode(imageNamed: "sol")
        sol.zPosition = 3
        sol.name = "sol"
        sol.size = CGSize(width: 290, height: 290)
        sol.position = CGPoint(x: 150, y: 630)

        titulo = SKSpriteNode(imageNamed: "titulo")
        titulo.zPosition = 3
        titulo.name = "titulo"
        titulo.size = CGSize(width: 500, height: 60)
        titulo.position = CGPoint(x: 600, y: 700)

        fundoTexto = SKSpriteNode()
        fundoTexto.color = UIColor.whiteColor()
        fundoTexto.zPosition = 3
        fundoTexto.size = CGSize(width: 600, height: 600)
        fundoTexto.position = CGPoint(x: 600, y: 310)
        fundoTexto.alpha = 0.6
        
        textoDesenvolvido = SKLabelNode(fontNamed: "Arial")
        textoDesenvolvido.text = "Desenvolvedor: "
        textoDesenvolvido.fontColor = UIColor.blackColor()
        textoDesenvolvido.fontSize = 50
        textoDesenvolvido.zPosition = 3
        textoDesenvolvido.position = CGPoint(x: 600, y: 550)
        
        textoDesenvolvidoNome = SKLabelNode(fontNamed: "Arial")
        textoDesenvolvidoNome.text = "Patricia Machado de Abreu"
        textoDesenvolvidoNome.fontColor = UIColor.blackColor()
        textoDesenvolvidoNome.fontSize = 40
        textoDesenvolvidoNome.zPosition = 3
        textoDesenvolvidoNome.position = CGPoint(x: 600, y: 450)
        
        textoDesign = SKLabelNode(fontNamed: "Arial")
        textoDesign.text = "Design: "
        textoDesign.fontColor = UIColor.blackColor()
        textoDesign.fontSize = 50
        textoDesign.zPosition = 3
        textoDesign.position = CGPoint(x: 600, y: 350)
        
        textoDesignNome = SKLabelNode(fontNamed: "Arial")
        textoDesignNome.text = "Elisa Carolina Arizono"
        textoDesignNome.fontColor = UIColor.blackColor()
        textoDesignNome.fontSize = 40
        textoDesignNome.zPosition = 3
        textoDesignNome.position = CGPoint(x: 600, y: 250)
        
        textoInterprete = SKLabelNode(fontNamed: "Arial")
        textoInterprete.text = "Interprete: "
        textoInterprete.fontColor = UIColor.blackColor()
        textoInterprete.fontSize = 50
        textoInterprete.zPosition = 3
        textoInterprete.position = CGPoint(x: 600, y: 150)

        textoInterpreteNome = SKLabelNode(fontNamed: "Arial")
        textoInterpreteNome.text = "Maebi Buosi"
        textoInterpreteNome.fontColor = UIColor.blackColor()
        textoInterpreteNome.fontSize = 40
        textoInterpreteNome.zPosition = 3
        textoInterpreteNome.position = CGPoint(x: 600, y: 50)
        
        voltar = SKSpriteNode(imageNamed: "seta_amarelo_voltar")
        voltar.zPosition = 2
        voltar.name = "voltar"
        voltar.size = CGSize(width: 50, height: 50)
        voltar.position = CGPoint(x: 80, y: 50)
        
        addChild(background)
        addChild(raioSol)
        addChild(sol)
        addChild(titulo)
        addChild(fundoTexto)
        addChild(textoDesenvolvido)
        addChild(textoDesenvolvidoNome)
        addChild(textoDesign)
        addChild(textoDesignNome)
        addChild(textoInterprete)
        addChild(textoInterpreteNome)
        addChild(voltar)
        
    }
    //função para tocar video
    func playVideo( video: String, tipo: String){
        
        let url = NSBundle.mainBundle().URLForResource(video, withExtension: tipo)
        let asset = AVURLAsset(URL: url!)
        let videoPlay = AVPlayerItem(asset: asset)
        let aPlayer = AVPlayer(playerItem: videoPlay)
        
        videoSprite = SKVideoNode(AVPlayer: aPlayer)
        videoSprite.zPosition = 1
        videoSprite.name = "videoSprite"
        videoSprite.position = CGPoint(x: 150, y: 630)
        videoSprite.size = CGSize(width: 350, height: 290)
        
        
        addChild(videoSprite)
        videoSprite.play()
        
    }
    
    //função para tocar audio
    func playAudio(audio: String, tipo: String){
        
        let path = NSBundle.mainBundle().pathForResource(audio, ofType: tipo)
        let url = NSURL(fileURLWithPath: path!)
        self.audio = try? AVAudioPlayer(contentsOfURL: url)
        self.audio.prepareToPlay()
        self.audio.play()
    }
    
    
    
}