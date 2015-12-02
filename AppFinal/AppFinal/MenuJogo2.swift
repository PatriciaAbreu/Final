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

class MenuJogo2: SKScene {
    var gameController: GameViewController!
    
    var background: SKSpriteNode!
    var raioSol: SKSpriteNode!
    var sol: SKSpriteNode!
    var titulo: SKSpriteNode!
    
    var textoManutenção: SKSpriteNode!
    
    var voltar: SKSpriteNode!
    
    var novaScene: SKScene!
    
    var videoSprite: SKVideoNode!
    var audio: AVAudioPlayer!
    
    var exercicio: ExercicioJSON = ExercicioJSON()
    var video: String = ""
    var audioS: String = ""
    
    override func didMoveToView(view: SKView) {
        
        montarScene()
        
        //chamada do video e audio
        video = exercicio.getVideo(0, video: "video1")
        audioS = exercicio.getAudio(0, audio: "audio1")
        
        playVideo(video, tipo: "mp4")
        playAudio(audioS, tipo: "m4a")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocation)
        
        if toque.name == "voltar" {
            novaScene = GameScene(volume: volumeTotal, size: size)
        }
        
        if novaScene != nil {
            background.removeFromParent()
            raioSol.removeFromParent()
            sol.removeFromParent()
            textoManutenção.removeFromParent()
            voltar.removeFromParent()
            videoSprite.removeFromParent()
            
            self.scene?.view?.presentScene(novaScene)
        }
        
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func montarScene(){
        
        scene?.view?.backgroundColor = UIColor.whiteColor()
        
        //posiciona e adiciona o plano de fundo
        //posiciona e adiciona o plano de fundo
        background = SKSpriteNode(imageNamed: "cenarioPrincipal")
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
        
        textoManutenção = SKSpriteNode(imageNamed: "manutencao")
        textoManutenção.zPosition = 3
        textoManutenção.position = CGPoint(x: 500, y: 400)
        textoManutenção.size = CGSize(width: 700, height: 100)
        
        voltar = SKSpriteNode(imageNamed: "seta_amarelo_voltar")
        voltar.zPosition = 2
        voltar.name = "voltar"
        voltar.size = CGSize(width: 50, height: 50)
        voltar.position = CGPoint(x: 80, y: 50)
        
        addChild(background)
        addChild(raioSol)
        addChild(sol)
        addChild(titulo)
        addChild(textoManutenção)
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
        if volumeTotal == true {
            self.audio.volume = 0
        }
        self.audio.play()
    }
    
    
    
}