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
    var personagem_Julia: SKSpriteNode!
    var personagem2_menu: PersonagensMenu!
    var personagem3_menu: PersonagensMenu!
    var personagem4_menu: PersonagensMenu!
    
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
        backgroundPrincipal = SKSpriteNode(imageNamed: "cenarioInicialVazio")
        backgroundPrincipal.zPosition = 2
        backgroundPrincipal.name = "backGroundPrincipal"
        backgroundPrincipal.size = CGSize(width: 1400, height: 800)
        backgroundPrincipal.position = CGPoint(x: 510, y: 400)
        
        personagem_Julia = SKSpriteNode(imageNamed: "Julia-1")
        personagem_Julia.zPosition = 2
        personagem_Julia.name = "Julia"
        personagem_Julia.size = CGSize(width: 300, height: 500)
        personagem_Julia.position = CGPoint(x: 150, y: 250)
        
        addChild(backgroundPrincipal)
        addChild(personagem_Julia)
    }
    
    //função para mudar o texto do nome do jogo
    func muda_texto(personagem: String){
        placa_nome_jogo.removeFromParent();
        
        if personagem == "personagem2_novo" {
            placa_nome_jogo = PersonagensMenu(texture: SKTexture(imageNamed: "cozinha"), color: UIColor.clearColor(), size: CGSize(width: 377, height: 162), item: 100)
            placa_nome_jogo.zPosition = 1
            placa_nome_jogo.name = "cozinha"
            placa_nome_jogo.position = CGPoint(x: 800, y: 100)
            
        }else if personagem == "personagem3_novo" {
            placa_nome_jogo = PersonagensMenu(texture: SKTexture(imageNamed: "piscina_de_bolinhas"), color: UIColor.clearColor(), size: CGSize(width: 377, height: 162), item: 100)
            placa_nome_jogo.zPosition = 1
            placa_nome_jogo.name = "piscina"
            placa_nome_jogo.position = CGPoint(x: 800, y: 100)
            
        }
        
        addChild(placa_nome_jogo)

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
        videoSprite.position = CGPoint(x: 500, y: 300)
        videoSprite.size = CGSize(width: 350, height: 250)
        
        
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

