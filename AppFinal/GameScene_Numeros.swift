//
//  GameScene_Numeros.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 17/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit
import MediaPlayer
import AVFoundation

class GameScene_Numeros: SKScene {
    
    var gameController: GameViewController!
    
//    var menu_ano1: SKSpriteNode!
//    var menu_ano2: SKSpriteNode!
    
    var background_numeros: SKSpriteNode!
    var brinquedo1: SKSpriteNode!
    var brinquedo2: SKSpriteNode!
    
    var personagem_Caio: SKSpriteNode!
    var personagem_Julia: SKSpriteNode!
    
    var dialogo: SKSpriteNode!
    var dialogo2: SKSpriteNode!
    
    var seta_play: SKSpriteNode!
    var seta_play_2: SKSpriteNode!
    var seta_play_3: SKSpriteNode!
    
    var movie: MPMoviePlayerController?
    var audio: AVAudioPlayer!
    
    var num0: Numero!
    var num1: Numero!
    var num2: Numero!
    var num3: Numero!
    var num4: Numero!
    var num5: Numero!
    var num6: Numero!
    var num7: Numero!
    var num8: Numero!
    var num9: Numero!
    var num10: Numero!
    
    var exercicio: ExercicioJSON = ExercicioJSON()
    var video: String = ""
    var audioS: String = ""
    
    override func didMoveToView(view: SKView) {

        montarScene()
        
        video = exercicio.getVideo(0)
        audioS = exercicio.getAudio(0, audio: "audio1")
        
        playVideo(video, tipo: "m4v")
        playAudio(audioS, tipo: "m4a")
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        let touch = touches.first as! UITouch
        let touchLocation = touch.locationInNode(self)
        
        var toque = self.nodeAtPoint(touchLocation)
        
        if toque.name == "seta_play_1" {
            
            seta_play.name = "seta_play_2"
            
            dialogo2 = SKSpriteNode(imageNamed: "chat_azul_texto_2")
            dialogo2.zPosition = 1
            dialogo2.name = "dialogo"
            dialogo2.size = CGSize(width: 200, height: 200)
            dialogo2.position = CGPoint(x: 780, y: 400)
            
            seta_play_2 = SKSpriteNode(imageNamed: "seta_azul")
            seta_play_2.zPosition = 1
            seta_play_2.name = "seta_play_2"
            seta_play_2.size = CGSize(width: 50, height: 50)
            seta_play_2.position = CGPoint(x: 780, y: 380)
            
            movie?.view.hidden = true
            
            video = exercicio.getVideo(0)
            audioS = exercicio.getAudio(0, audio: "audio2")
            
            playVideo(video, tipo: "m4v")
            playAudio(audioS, tipo: "m4a")
            
            dialogo.removeFromParent()
            seta_play.removeFromParent()
            addChild(dialogo2)
            addChild(seta_play_2)
            

        }else if toque.name == "seta_play_2" {
            dialogo2.removeFromParent()
            seta_play_2.removeFromParent()

            personagem_Caio.runAction(SKAction.moveToX(1100, duration: 0.5))
            movie?.view.hidden = true

            
            montarExercicio()
            
        }else if toque.name == "seta_play_3" {
            dialogo2.removeFromParent()
            seta_play_3.removeFromParent()
            
            personagem_Caio.runAction(SKAction.moveToX(1100, duration: 0.5))
            movie?.view.hidden = true
            
        }else if toque.name == "julia" && Numero.verifica != 10 {
            personagem_Caio.runAction(SKAction.moveToX(950, duration: 0.5))
            
            dialogo2 = SKSpriteNode(imageNamed: "chat_azul_texto_2")
            dialogo2.zPosition = 1
            dialogo2.name = "dialogo"
            dialogo2.size = CGSize(width: 200, height: 200)
            dialogo2.position = CGPoint(x: 900, y: 400)
            
            seta_play_3 = SKSpriteNode(imageNamed: "seta_azul")
            seta_play_3.zPosition = 1
            seta_play_3.name = "seta_play_3"
            seta_play_3.size = CGSize(width: 50, height: 50)
            seta_play_3.position = CGPoint(x: 900, y: 380)

            addChild(dialogo2)
            addChild(seta_play_3)

            video = exercicio.getVideo(0)
            audioS = exercicio.getAudio(0, audio: "audio2")
            
            playVideo(video, tipo: "m4v")
            playAudio(audioS, tipo: "m4a")
            
        }else if toque.name == "julia" && Numero.verifica == 10{
            println(num3)
            brinquedo1.removeFromParent()
            personagem_Julia.runAction(SKAction.scaleTo(2, duration: 0.3))
            num3.name = "exercicio1_3"
            
            personagem_Caio.runAction(SKAction.moveToX(950, duration: 0.5))
            
            dialogo2 = SKSpriteNode(imageNamed: "chat_azul_texto_2")
            dialogo2.zPosition = 1
            dialogo2.name = "dialogo"
            dialogo2.size = CGSize(width: 200, height: 200)
            dialogo2.position = CGPoint(x: 900, y: 400)
            
            seta_play_3 = SKSpriteNode(imageNamed: "seta_azul")
            seta_play_3.zPosition = 1
            seta_play_3.name = "seta_play_3"
            seta_play_3.size = CGSize(width: 50, height: 50)
            seta_play_3.position = CGPoint(x: 900, y: 380)
            
            addChild(dialogo2)
            addChild(seta_play_3)
            
            video = exercicio.getVideo(0)
            audioS = exercicio.getAudio(0, audio: "audio2")
            
            playVideo(video, tipo: "m4v")
            playAudio(audioS, tipo: "m4a")

        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func montarScene(){
        
        //posiciona e adiciona o plano de fundo
        background_numeros = SKSpriteNode(imageNamed: "fundo_sala_brinquedos")
        background_numeros.zPosition = 1
        background_numeros.name = "background_numeros"
        background_numeros.size = CGSize(width: 1050, height: 800)
        background_numeros.position = CGPoint(x: 510, y: 400)
        
        // posiciona e adiciona brinquedos
        brinquedo1 = SKSpriteNode(imageNamed: "toy5")
        brinquedo1.zPosition = 1
        brinquedo1.name = "brinquedo1"
        brinquedo1.size = CGSize(width: 200, height: 200)
        brinquedo1.position = CGPoint(x: 300, y: 100)
        
        brinquedo2 = SKSpriteNode(imageNamed: "toy2")
        brinquedo2.zPosition = 1
        brinquedo2.name = "brinquedo2"
        brinquedo2.size = CGSize(width: 150, height: 200)
        brinquedo2.position = CGPoint(x: 400, y: 400)
        
        //posiciona e adiciona personagens
        personagem_Caio = SKSpriteNode(imageNamed: "Caio")
        personagem_Caio.zPosition = 1
        personagem_Caio.name = "caio"
        personagem_Caio.size = CGSize(width: 150, height: 300)
        personagem_Caio.position = CGPoint(x: 850, y: 150)
        
        personagem_Julia = SKSpriteNode(imageNamed: "julia")
        personagem_Julia.zPosition = 1
        personagem_Julia.name = "julia"
        personagem_Julia.size = CGSize(width: 150, height: 200)
        personagem_Julia.position = CGPoint(x: 250, y: 150)
        
        dialogo = SKSpriteNode(imageNamed: "chat_azul_texto")
        dialogo.zPosition = 1
        dialogo.name = "dialogo"
        dialogo.size = CGSize(width: 200, height: 200)
        dialogo.position = CGPoint(x: 780, y: 400)
        
        seta_play = SKSpriteNode(imageNamed: "seta_azul")
        seta_play.zPosition = 1
        seta_play.name = "seta_play_1"
        seta_play.size = CGSize(width: 50, height: 50)
        seta_play.position = CGPoint(x: 780, y: 380)
        
        addChild(background_numeros)
        addChild(personagem_Julia)
        addChild(brinquedo1)
        addChild(brinquedo2)
        addChild(personagem_Caio)
        addChild(dialogo)
        addChild(seta_play)
        
    }
    
    //função para tocar video
    func playVideo(var video: String, var tipo: String){
    
        if let path = NSBundle.mainBundle().pathForResource(video, ofType: tipo), let url = NSURL.fileURLWithPath(path), let movie = MPMoviePlayerController(contentURL: url) {
            
            self.movie = movie
            movie.view.frame = CGRect(x: 20, y: 20, width: 300, height: 300)
            movie.view.layer.zPosition = 1
            movie.scalingMode = .AspectFill
            self.view?.addSubview(movie.view)
            movie.play()
        }else{
            debugPrint("Video não encontrado")
        }
    }

    //função para tocar audio
    func playAudio(var audio: String, var tipo: String){
        
        let path = NSBundle.mainBundle().pathForResource(audio, ofType: tipo)
        let url = NSURL(fileURLWithPath: path!)
        self.audio = AVAudioPlayer(contentsOfURL: url, error: nil)
        self.audio.prepareToPlay()
        self.audio.play()
    }
    
    //função par montar o exercicio
    func montarExercicio(){
        
        num0 = Numero(texture: SKTexture(imageNamed: "num0"), color: nil, size: CGSize(width: 50, height: 50), numero: 0)
        num0.zPosition = 1
        num0.name = "exercicio1_0"
        num0.position = CGPoint(x: 950, y: 700)
        
        num1 = Numero(texture: SKTexture(imageNamed: "num1"), color: nil, size: CGSize(width: 50, height: 50), numero: 1)
        num1.zPosition = 1
        num1.name = "exercicio1_1"
        num1.position = CGPoint(x: 800, y: 600)
        
        num2 = Numero(texture: SKTexture(imageNamed: "num2"), color: nil, size: CGSize(width: 50, height: 50), numero: 2)
        num2.zPosition = 1
        num2.name = "exercicio1_2"
        num2.position = CGPoint(x: 890, y: 650)
        
        num3 = Numero(texture: SKTexture(imageNamed: "num3"), color: nil, size: CGSize(width: 50, height: 50), numero: 3)
        num3.zPosition = 1
        num3.name = "exercicio1_3"
        num3.position = CGPoint(x: 800, y: 410)
        
        num4 = Numero(texture: SKTexture(imageNamed: "num4"), color: nil, size: CGSize(width: 50, height: 50), numero: 4)
        num4.zPosition = 1
        num4.name = "exercicio1_4"
        num4.position = CGPoint(x: 830, y: 500)
        
        num5 = Numero(texture: SKTexture(imageNamed: "num5"), color: nil, size: CGSize(width: 50, height: 50), numero: 5)
        num5.zPosition = 1
        num5.name = "exercicio1_5"
        num5.position = CGPoint(x: 750, y: 530)
        
        num6 = Numero(texture: SKTexture(imageNamed: "num6"), color: nil, size: CGSize(width: 50, height: 50), numero: 6)
        num6.zPosition = 1
        num6.name = "exercicio1_6"
        num6.position = CGPoint(x: 900, y: 480)
        
        num7 = Numero(texture: SKTexture(imageNamed: "num7"), color: nil, size: CGSize(width: 50, height: 50), numero: 7)
        num7.zPosition = 1
        num7.name = "exercicio1_7"
        num7.position = CGPoint(x: 830, y: 700)
        
        num8 = Numero(texture: SKTexture(imageNamed: "num8"), color: nil, size: CGSize(width: 50, height: 50), numero: 8)
        num8.zPosition = 1
        num8.name = "exercicio1_8"
        num8.position = CGPoint(x: 970, y: 430)
        
        num9 = Numero(texture: SKTexture(imageNamed: "num9"), color: nil, size: CGSize(width: 50, height: 50), numero: 9)
        num9.zPosition = 1
        num9.name = "exercicio1_9"
        num9.position = CGPoint(x: 700, y: 630)
        
        num10 = Numero(texture: SKTexture(imageNamed: "num10"), color: nil, size: CGSize(width: 80, height: 70), numero: 10)
        num10.zPosition = 1
        num10.name = "exercicio1_10"
        num10.position = CGPoint(x: 920, y: 580)
        
        addChild(num0)
        addChild(num1)
        addChild(num2)
        addChild(num3)
        addChild(num4)
        addChild(num5)
        addChild(num6)
        addChild(num7)
        addChild(num8)
        addChild(num9)
        addChild(num10)
        
    }
    
    //função para fazer o boneco aparecer avisando que agora pode procurar a Julia
    func procurarJulia(){
        
        personagem_Caio.runAction(SKAction.moveToX(950, duration: 0.5))
        
        dialogo2 = SKSpriteNode(imageNamed: "chat_azul_texto_3")
        dialogo2.zPosition = 1
        dialogo2.name = "dialogo"
        dialogo2.size = CGSize(width: 200, height: 200)
        dialogo2.position = CGPoint(x: 900, y: 400)
        
        seta_play_3 = SKSpriteNode(imageNamed: "seta_azul")
        seta_play_3.zPosition = 1
        seta_play_3.name = "seta_play_3"
        seta_play_3.size = CGSize(width: 50, height: 50)
        seta_play_3.position = CGPoint(x: 900, y: 380)
        
        addChild(dialogo2)
        addChild(seta_play_3)
        
        video = exercicio.getVideo(0)
        audioS = exercicio.getAudio(0, audio: "audio3")
        playVideo(video, tipo: "m4v")
        playAudio(audioS, tipo: "m4a")
    }
}