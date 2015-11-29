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

class GameScene: SKScene {
    
    var gameController: GameViewController!
    
    //background
    var backgroundPrincipal: SKSpriteNode!
    
    //icones do menu
    var menu_numeros: SKSpriteNode!
    var menu_espaco_forma: SKSpriteNode!
    var menu_operacoes: SKSpriteNode!
    var menu_grandeza_medidas:SKSpriteNode!
    
    var menu: SKSpriteNode!
    
    var circulo_menu: PersonagensMenu!
    var personagemJulia: SKSpriteNode!
    var personagemCarol: SKSpriteNode!
    var personagemPedro: SKSpriteNode!
    var personagemCaio: SKSpriteNode!
    var raioSol: SKSpriteNode!
    var sol: SKSpriteNode!
    
    //placas
    var placa_nome_jogo: SKSpriteNode!
    
    let menu_todo = SKSpriteNode(color: UIColor.clearColor(), size: CGSize(width: 583, height: 574))
    
    var texto: SKSpriteNode!
    var seta: SKSpriteNode!

    var menuTocado: SKSpriteNode!
    
    var videoSprite: SKVideoNode!
    var audio: AVAudioPlayer!
    
    var exercicio: ExercicioJSON = ExercicioJSON()
    var video: String = ""
    var audioS: String = ""
    
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
        
            backgroundPrincipal.removeFromParent()
            personagemJulia.removeFromParent()
            personagemCaio.removeFromParent()
            personagemCarol.removeFromParent()
            personagemPedro.removeFromParent()
            sol.removeFromParent()
            videoSprite.removeFromParent()
            raioSol.removeFromParent()
            
            novaScene = MenuJogo1(size: size)
            videoSprite.removeFromParent()
            
        }else if toque.name == "Caio" {
            
            novaScene = GameScenePatinho(size: size)
            videoSprite.removeFromParent()
            
        }else if toque.name == "Carol"  {
            
            novaScene = MenuJogo1(size: size)
            videoSprite.removeFromParent()
            
        }else if toque.name == "Pedro"  {
            
            novaScene = MenuJogo1(size: size)
            videoSprite.removeFromParent()
            
        }
        
        if novaScene != nil {
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
        
        
        addChild(backgroundPrincipal)
        addChild(raioSol)
        addChild(sol)
        addChild(personagemJulia)
        addChild(personagemCarol)
        addChild(personagemPedro)
        addChild(personagemCaio)
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

