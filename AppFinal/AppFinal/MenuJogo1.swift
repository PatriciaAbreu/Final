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

class MenuJogo1: SKScene {
    var gameController: GameViewController!

    var background: SKSpriteNode!
    var raioSol: SKSpriteNode!
    var sol: SKSpriteNode!
    var placaMenu1: SKSpriteNode!
    var placaMenu2: SKSpriteNode!
    var jogoPatinho: SKSpriteNode!
    var jogoEsconde: SKSpriteNode!
    var personagemJulia: SKSpriteNode!
    var dialogo: SKSpriteNode!
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
        video = exercicio.getVideo(1, video: "video1")
        audioS = exercicio.getAudio(1, audio: "audio1")
        
        playVideo(video, tipo: "m4v")
        playAudio(audioS, tipo: "m4a")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocation)
        
        if toque.name == "jogoPato" || toque.name == "menuPlaca1"{
           
            novaScene = GameScenePatinho(size: size)
            
        }else if toque.name == "jogoEsconde" || toque.name == "menuPlaca2"{
            
            novaScene = GameSceneEsconde(size: size)
            
        }else if toque.name == "voltar" {
            
            novaScene = GameScene(size: size)
            
        }
        
        if novaScene != nil {
            background.removeFromParent()
            raioSol.removeFromParent()
            sol.removeFromParent()
            placaMenu1.removeFromParent()
            placaMenu2.removeFromParent()
            jogoPatinho.removeFromParent()
            jogoEsconde.removeFromParent()
            personagemJulia.removeFromParent()
            dialogo.removeFromParent()
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
        
        placaMenu1 = SKSpriteNode(imageNamed: "placa")
        placaMenu1.zPosition = 2
        placaMenu1.name = "menuPlaca1"
        placaMenu1.size = CGSize(width: 200, height: 100)
        placaMenu1.position = CGPoint(x: 200, y: 200)
        
        placaMenu2 = SKSpriteNode(imageNamed: "placa")
        placaMenu2.zPosition = 2
        placaMenu2.name = "menuPlaca2"
        placaMenu2.size = CGSize(width: 200, height: 100)
        placaMenu2.position = CGPoint(x: 500, y: 200)
        
        // posiciona e adiciona os jogos
        jogoPatinho = SKSpriteNode(imageNamed: "pato")
        jogoPatinho.zPosition = 2
        jogoPatinho.name = "jogoPato"
        jogoPatinho.position = CGPoint(x: 190, y: 200)
        jogoPatinho.size = CGSize(width: 90, height: 70)
        
        jogoEsconde = SKSpriteNode(imageNamed: "num10")
        jogoEsconde.zPosition = 2
        jogoEsconde.name = "jogoEsconde"
        jogoEsconde.position = CGPoint(x: 490, y: 200)
        jogoEsconde.size = CGSize(width: 90, height: 70)
        
        
        //posiciona e adiciona personagem
        personagemJulia = SKSpriteNode(imageNamed: "Julia")
        personagemJulia.zPosition = 2
        personagemJulia.name = "Julia"
        personagemJulia.size = CGSize(width: 250, height: 400)
        personagemJulia.position = CGPoint(x: 800, y: 250)
        
        // posiciona e adiciona dialogo
        dialogo = SKSpriteNode(imageNamed: "chat_amarelo_texto_1")
        dialogo.zPosition = 2
        dialogo.name = "dialogo1"
        dialogo.size = CGSize(width: 200, height: 200)
        dialogo.position = CGPoint(x: 700, y: 500)
        
        voltar = SKSpriteNode(imageNamed: "seta_amarelo_voltar")
        voltar.zPosition = 2
        voltar.name = "voltar"
        voltar.size = CGSize(width: 50, height: 50)
        voltar.position = CGPoint(x: 80, y: 50)
        
        addChild(background)
        addChild(raioSol)
        addChild(sol)
        addChild(placaMenu1)
        addChild(placaMenu2)
        addChild(jogoPatinho)
        addChild(jogoEsconde)
        addChild(personagemJulia)
        addChild(dialogo)
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