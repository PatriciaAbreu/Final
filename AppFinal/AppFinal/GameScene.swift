//
//  GameScene.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 17/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit
import MediaPlayer
import AVFoundation

func random(lo: Int, hi : Int) -> Int {
    return lo + Int(arc4random_uniform(UInt32(hi - lo + 1)))
}

var volumeTotal: Bool!

class GameScene: SKScene {
    
    var gameController: GameViewController!
    
    //background
    var backgroundPrincipal: SKSpriteNode!
    
    var botaoCredito: SKSpriteNode!
    
    var menu: SKSpriteNode!
    
    var titulo: SKSpriteNode!
    var personagemJulia: SKSpriteNode!
    var personagemCarol: SKSpriteNode!
    var personagemPedro: SKSpriteNode!
    var personagemCaio: SKSpriteNode!
    var raioSol: SKSpriteNode!
    var sol: SKSpriteNode!
    
    var videoSprite: SKVideoNode!
    var audio: AVAudioPlayer!
    
    var botaoVolume: SKSpriteNode!
    var caixaPersonagem: SKSpriteNode!
    var caixaPersonagemTexto: SKSpriteNode!
    
    var seta: SKSpriteNode!
    
    var exercicio: ExercicioJSON = ExercicioJSON()
    var video: String = ""
    var audioS: String = ""
    
    init(volume: Bool, size: CGSize) {
        super.init(size: size)
        volumeTotal = volume
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {

        //chamada para montar tela inicial
        montarScene()
        
        //chamada do video e audio
        video = exercicio.getVideo(0, video: "video1")
        audioS = exercicio.getAudio(0, audio: "audio1")
        
        playVideo(video, tipo: "mp4")
        playAudio(audioS, tipo: "m4a")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        //verifica qual menu foi tocado
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocation)
        var novaScene: SKScene?
        
        if toque.name == "Julia" {
            
            if caixaPersonagemTexto != nil {
                caixaPersonagemTexto.removeFromParent()
                caixaPersonagem.removeFromParent()
                seta.removeFromParent()
            }
            
            caixaPersonagem = SKSpriteNode()
            caixaPersonagem.color = UIColor.whiteColor()
            caixaPersonagem.alpha = 0.6
            caixaPersonagem.zPosition = 4
            caixaPersonagem.size = CGSize(width: 300, height: 100)
            caixaPersonagem.position = CGPoint(x: 500, y: 80)
            
            caixaPersonagemTexto = SKSpriteNode(imageNamed: "textoJulia")
            caixaPersonagemTexto.alpha = 0.6
            caixaPersonagemTexto.zPosition = 4
            caixaPersonagemTexto.size = CGSize(width: 200, height: 80)
            caixaPersonagemTexto.position = CGPoint(x: 450, y: 80)
            
            seta = SKSpriteNode(imageNamed: "seta_roxo_escuro")
            seta.zPosition = 4
            seta.size = CGSize(width: 70, height: 70)
            seta.name = "setaJulia"
            seta.position = CGPoint(x: 600, y: 80)
            
            addChild(caixaPersonagem)
            addChild(caixaPersonagemTexto)
            addChild(seta)
            
        }else if toque.name == "Caio" {
            
            if caixaPersonagemTexto != nil {
                caixaPersonagemTexto.removeFromParent()
                caixaPersonagem.removeFromParent()
                seta.removeFromParent()
            }
            
            caixaPersonagem = SKSpriteNode()
            caixaPersonagem.color = UIColor.whiteColor()
            caixaPersonagem.alpha = 0.6
            caixaPersonagem.zPosition = 4
            caixaPersonagem.size = CGSize(width: 300, height: 100)
            caixaPersonagem.position = CGPoint(x: 500, y: 80)
            
            caixaPersonagemTexto = SKSpriteNode(imageNamed: "textoCaio")
            caixaPersonagemTexto.alpha = 0.6
            caixaPersonagemTexto.zPosition = 4
            caixaPersonagemTexto.size = CGSize(width: 200, height: 80)
            caixaPersonagemTexto.position = CGPoint(x: 450, y: 80)
            
            seta = SKSpriteNode(imageNamed: "seta_roxo_escuro")
            seta.zPosition = 4
            seta.size = CGSize(width: 70, height: 70)
            seta.name = "setaCaio"
            seta.position = CGPoint(x: 600, y: 80)
            
            addChild(caixaPersonagem)
            addChild(caixaPersonagemTexto)
            addChild(seta)

            
        }else if toque.name == "Carol"  {
            
            if caixaPersonagemTexto != nil {
                caixaPersonagemTexto.removeFromParent()
                caixaPersonagem.removeFromParent()
                seta.removeFromParent()
            }
            
            caixaPersonagem = SKSpriteNode()
            caixaPersonagem.color = UIColor.whiteColor()
            caixaPersonagem.alpha = 0.6
            caixaPersonagem.zPosition = 4
            caixaPersonagem.size = CGSize(width: 300, height: 100)
            caixaPersonagem.position = CGPoint(x: 500, y: 80)
            
            caixaPersonagemTexto = SKSpriteNode(imageNamed: "textoCarla")
            caixaPersonagemTexto.alpha = 0.6
            caixaPersonagemTexto.zPosition = 4
            caixaPersonagemTexto.size = CGSize(width: 200, height: 80)
            caixaPersonagemTexto.position = CGPoint(x: 450, y: 80)
            
            seta = SKSpriteNode(imageNamed: "seta_roxo_escuro")
            seta.zPosition = 4
            seta.size = CGSize(width: 70, height: 70)
            seta.name = "setaCarla"
            seta.position = CGPoint(x: 600, y: 80)
            
            addChild(caixaPersonagem)
            addChild(caixaPersonagemTexto)
            addChild(seta)

        }else if toque.name == "Pedro"  {
            
            if caixaPersonagemTexto != nil {
                caixaPersonagemTexto.removeFromParent()
                caixaPersonagem.removeFromParent()
                seta.removeFromParent()
            }
            
            caixaPersonagem = SKSpriteNode()
            caixaPersonagem.color = UIColor.whiteColor()
            caixaPersonagem.alpha = 0.6
            caixaPersonagem.zPosition = 4
            caixaPersonagem.size = CGSize(width: 300, height: 100)
            caixaPersonagem.position = CGPoint(x: 500, y: 80)
            
            caixaPersonagemTexto = SKSpriteNode(imageNamed: "textoPedro")
            caixaPersonagemTexto.alpha = 0.6
            caixaPersonagemTexto.zPosition = 4
            caixaPersonagemTexto.size = CGSize(width: 200, height: 80)
            caixaPersonagemTexto.position = CGPoint(x: 450, y: 80)
            
            seta = SKSpriteNode(imageNamed: "seta_roxo_escuro")
            seta.zPosition = 4
            seta.size = CGSize(width: 70, height: 70)
            seta.name = "setaPedro"
            seta.position = CGPoint(x: 600, y: 80)
            
            addChild(caixaPersonagem)
            addChild(caixaPersonagemTexto)
            addChild(seta)

        }else if toque.name == "setaJulia" {
         
            novaScene = MenuJogo1(size: size)
            
        }else if toque.name == "setaCaio" {
            
            novaScene = MenuJogo2(size: size)
            
        }else if toque.name == "setaCarla" {
            
            novaScene = MenuJogo3(size: size)
            
        }else if toque.name == "setaPedro" {
            
            novaScene = MenuJogo4(size: size)
            
        }else if toque.name == "credito" {
            
            novaScene = Credito(size: size);
        }else if toque.name == "volume" && volumeTotal == false {
            audio.volume = 0
            volumeTotal = true
            botaoVolume.texture = SKTexture(imageNamed: "Mute")
        }else if toque.name == "volume" && volumeTotal == true {
            audio.volume = 1
            volumeTotal = false
            botaoVolume.texture = SKTexture(imageNamed: "High")
        }else if toque.name == "sol" {
            playVideo(video, tipo: "mp4")
            playAudio(audioS, tipo: "m4a")
        }
        
        if novaScene != nil {
            
            backgroundPrincipal.removeFromParent()
            personagemJulia.removeFromParent()
            personagemCaio.removeFromParent()
            personagemCarol.removeFromParent()
            personagemPedro.removeFromParent()
            sol.removeFromParent()
            videoSprite.removeFromParent()
            raioSol.removeFromParent()
            videoSprite.removeFromParent()
            
            self.scene!.view?.presentScene(novaScene)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func montarScene(){
        
        //imagem de plano de fundo
        backgroundPrincipal = SKSpriteNode(imageNamed: "cenarioPrincipal")
        backgroundPrincipal.zPosition = 2
        backgroundPrincipal.name = "backGroundPrincipal"
        backgroundPrincipal.size = CGSize(width: 1424, height: 800)
        backgroundPrincipal.position = CGPoint(x: 670, y: 400)
        
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
        
        personagemJulia = SKSpriteNode(imageNamed: "Julia")
        personagemJulia.zPosition = 4
        personagemJulia.name = "Julia"
        personagemJulia.size = CGSize(width: 250, height: 400)
        personagemJulia.position = CGPoint(x: 200, y: 250)
        
        personagemCarol = SKSpriteNode(imageNamed: "Carol")
        personagemCarol.zPosition = 2
        personagemCarol.name = "Carol"
        personagemCarol.size = CGSize(width: 250, height: 450)
        personagemCarol.position = CGPoint(x: 400, y: 380)

        personagemPedro = SKSpriteNode(imageNamed: "Pedro")
        personagemPedro.zPosition = 2
        personagemPedro.name = "Pedro"
        personagemPedro.size = CGSize(width: 250, height: 450)
        personagemPedro.position = CGPoint(x: 700, y: 380)
        
        personagemCaio = SKSpriteNode(imageNamed: "Caio")
        personagemCaio.zPosition = 4
        personagemCaio.name = "Caio"
        personagemCaio.size = CGSize(width: 300, height: 400)
        personagemCaio.position = CGPoint(x: 900, y: 250)
        
        botaoCredito = SKSpriteNode(imageNamed: "creditos")
        botaoCredito.zPosition = 2
        botaoCredito.name = "credito"
        botaoCredito.size = CGSize(width: 90, height: 40)
        botaoCredito.position = CGPoint(x: 950, y: 700)
        
        if volumeTotal == false {
                botaoVolume = SKSpriteNode(imageNamed: "High")
        }else {
            botaoVolume = SKSpriteNode(imageNamed: "Mute")
        }
        
        botaoVolume.zPosition = 3
        botaoVolume.name = "volume"
        botaoVolume.size = CGSize(width: 30, height: 30)
        botaoVolume.position = CGPoint(x: 950, y: 650)
        
        addChild(backgroundPrincipal)
        addChild(raioSol)
        addChild(sol)
        addChild(titulo)
        addChild(botaoVolume)
        addChild(personagemJulia)
        addChild(personagemCarol)
        addChild(personagemPedro)
        addChild(personagemCaio)
        addChild(botaoCredito)
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

