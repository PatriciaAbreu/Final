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
    var placaMenu3: SKSpriteNode!
    var jogoPatinho: SKSpriteNode!
    var jogoEsconde: SKSpriteNode!
    var personagemJulia: SKSpriteNode!
    var dialogo: SKSpriteNode!
    var voltar: SKSpriteNode!
    var titulo: SKSpriteNode!
    var grama: SKSpriteNode!
    var proximo: SKSpriteNode!
    
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
        
        playVideo(video, tipo: "mp4")
        playAudio(audioS, tipo: "m4a")
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocation)
        
        if toque.name == "placaPato" {
           
            novaScene = GameScenePatinho(size: size)
            
        }else if toque.name == "placaEsconde" {
            
            novaScene = GameSceneEsconde(size: size)
            
        }else if toque.name == "voltar" {
            
            novaScene = GameScene(volume: volumeTotal, size: size)
            
        }else if toque.name == "sol" {
            
            playVideo(video, tipo: "mp4")
            playAudio(audioS, tipo: "m4a")
            
        }else if toque.name == "proximo" {
            
            if placaMenu1.position.x == 200 && placaMenu1.name == "placaPato"{
                
                placaMenu1.runAction(SKAction.moveToX(-100, duration: 1))
                placaMenu3.texture = SKTexture(imageNamed: "placaPato")
                placaMenu3.name = "placaPato"
                placaMenu3.runAction(SKAction.moveToX(500, duration: 1))
                placaMenu2.runAction(SKAction.moveToX(200, duration: 1), completion: { () -> Void in
                    self.placaMenu1.position = CGPoint(x: 800, y: 200)
                })
                
            }else if placaMenu2.position.x == 200 && placaMenu2.name == "placaEsconde"{
                
                placaMenu2.runAction(SKAction.moveToX(-100, duration: 1))
                placaMenu1.texture = SKTexture(imageNamed: "placaEsconde")
                placaMenu1.name = "placaEsconde"
                placaMenu1.runAction(SKAction.moveToX(500, duration: 1))
                placaMenu3.runAction(SKAction.moveToX(200, duration: 1), completion: { () -> Void in
                    self.placaMenu2.position = CGPoint(x: 800, y: 200)
                })
                
            }else if placaMenu3.position.x == 200 && placaMenu3.name == "placaPato"{

                placaMenu3.runAction(SKAction.moveToX(-100, duration: 1))
                placaMenu2.texture = SKTexture(imageNamed: "placaPato")
                placaMenu2.name = "placaPato"
                placaMenu2.runAction(SKAction.moveToX(500, duration: 1))
                placaMenu1.runAction(SKAction.moveToX(200, duration: 1), completion: { () -> Void in
                    self.placaMenu3.position = CGPoint(x: 800, y: 200)
                })
                
            }else if placaMenu1.position.x == 200 && placaMenu1.name == "placaEsconde" {
                
                placaMenu1.runAction(SKAction.moveToX(-100, duration: 1))
                placaMenu3.texture = SKTexture(imageNamed: "placaEsconde")
                placaMenu3.name = "placaEsconde"
                placaMenu3.runAction(SKAction.moveToX(500, duration: 1))
                placaMenu2.runAction(SKAction.moveToX(200, duration: 1), completion: { () -> Void in
                    self.placaMenu1.position = CGPoint(x: 800, y: 200)
                })
                
            }else if placaMenu2.position.x == 200 && placaMenu2.name == "placaPato" {
                
                placaMenu2.runAction(SKAction.moveToX(-100, duration: 1))
                placaMenu1.texture = SKTexture(imageNamed: "placaPato")
                placaMenu1.name = "placaPato"
                placaMenu1.runAction(SKAction.moveToX(500, duration: 1))
                placaMenu3.runAction(SKAction.moveToX(200, duration: 1), completion: { () -> Void in
                    self.placaMenu2.position = CGPoint(x: 800, y: 200)
                })
                
            }else if placaMenu3.position.x == 200 && placaMenu3.name == "placaEsconde" {
                
                placaMenu3.runAction(SKAction.moveToX(-100, duration: 1))
                placaMenu2.texture = SKTexture(imageNamed: "placaEsconde")
                placaMenu2.name = "placaEsconde"
                placaMenu2.runAction(SKAction.moveToX(500, duration: 1))
                placaMenu1.runAction(SKAction.moveToX(200, duration: 1), completion: { () -> Void in
                    self.placaMenu3.position = CGPoint(x: 800, y: 200)
                })
                
            }
            
//            jogoPatinho.runAction(SKAction.moveToX(-100, duration: 1), completion: { () -> Void in
//                self.jogoPatinho.position = CGPoint(x: 800, y: 200)
//            })
//            
//            
//            
//            jogoEsconde.runAction(SKAction.moveToX(190, duration: 1))
//
//            placaMenu3.runAction(SKAction.moveToX(500, duration: 1), completion: { () -> Void in
//               self.jogoPatinho.position = CGPoint(x: 490, y: 200)
//            })
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
        
        grama = SKSpriteNode(imageNamed: "grama")
        grama.zPosition = 2
        grama.name = "grama"
        grama.size = CGSize(width: 430, height: 325)
        grama.position = CGPoint(x: 820, y: 165)
        
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
        
        placaMenu1 = SKSpriteNode(imageNamed: "placaPato")
        placaMenu1.zPosition = 2
        placaMenu1.name = "placaPato"
        placaMenu1.size = CGSize(width: 200, height: 100)
        placaMenu1.position = CGPoint(x: 200, y: 200)
        
        placaMenu2 = SKSpriteNode(imageNamed: "placaEsconde")
        placaMenu2.zPosition = 2
        placaMenu2.name = "placaEsconde"
        placaMenu2.size = CGSize(width: 200, height: 100)
        placaMenu2.position = CGPoint(x: 500, y: 200)
        
        placaMenu3 = SKSpriteNode(imageNamed: "placa")
        placaMenu3.zPosition = 2
        placaMenu3.name = "placaPato"
        placaMenu3.size = CGSize(width: 200, height: 100)
        placaMenu3.position = CGPoint(x: 800, y: 200)
        
        proximo = SKSpriteNode(imageNamed: "seta_amarelo")
        proximo.zPosition = 2
        proximo.name = "proximo"
        proximo.size = CGSize(width: 50, height: 50)
        proximo.position = CGPoint(x: 600, y: 100)
        
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
        addChild(placaMenu1)
        addChild(placaMenu2)
        addChild(placaMenu3)
        addChild(grama)
//        addChild(proximo)
        addChild(sol)
        addChild(titulo)
        
//        addChild(jogoPatinho)
//        addChild(jogoEsconde)
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
        if volumeTotal == true {
            self.audio.volume = 0
        }
        self.audio.play()
    }

    
}