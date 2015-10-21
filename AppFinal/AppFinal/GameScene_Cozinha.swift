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

class GameScene_Cozinha: SKScene {
    var gameController: GameViewController!

    var background_cozinha: SKSpriteNode!
    var background: SKSpriteNode!
    
    var personagem_Ro: SKSpriteNode!
    
    var chat: SKSpriteNode!
    var chat2: SKSpriteNode!
    var chat3: SKSpriteNode!
    var chat4: SKSpriteNode!
    var chat5: SKSpriteNode!
    var chat6: SKSpriteNode!
    var chat7: SKSpriteNode!
    
    var seta_play: SKSpriteNode!
    var seta_play2: SKSpriteNode!
    var seta_play3: SKSpriteNode!
    var seta_play4: SKSpriteNode!
    var seta_play5: SKSpriteNode!
    var seta_play6: SKSpriteNode!
    var seta_play7: SKSpriteNode!
    
    var seta_back: SKSpriteNode!
    
    var leg1: SKSpriteNode!
    var leg2: SKSpriteNode!
    var leg3: SKSpriteNode!
    var leg4: SKSpriteNode!
    var leg5: SKSpriteNode!
    var leg6: SKSpriteNode!
    var leg7: SKSpriteNode!
    var leg8: SKSpriteNode!
    
    var prato: SKSpriteNode!
    
    var movie: MPMoviePlayerController?
    var audio: AVAudioPlayer!
    
    var exercicio: ExercicioJSON = ExercicioJSON()
    var video: String = ""
    var audioS: String = ""
    
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
    
    override func didMoveToView(view: SKView) {

        video = exercicio.getVideo(2, video: "video1")
        audioS = exercicio.getAudio(2, audio: "audio1")

        montarScene()
        
        playVideo(video, tipo: "m4v")
        playAudio(audioS, tipo: "m4a")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocation)
        
        if toque.name == "seta_play" {
            chat.removeFromParent()
            seta_play.removeFromParent()
            
            //posiciona e adiciona a conversa
            chat2 = SKSpriteNode(imageNamed: "chat_roxo_texto_2")
            chat2.zPosition = 1
            chat2.name = "chat2"
            chat2.size = CGSize(width: 200, height: 200)
            chat2.position = CGPoint(x: 730, y: 300)
            
            //posiciona e adiciona a seta de próximo
            seta_play2 = SKSpriteNode(imageNamed: "seta_roxa")
            seta_play2.zPosition = 1
            seta_play2.name = "seta_play2"
            seta_play2.size = CGSize(width: 50, height: 50)
            seta_play2.position = CGPoint(x: 740, y: 270)
            
            movie?.view.hidden = true
            video = exercicio.getVideo(2, video: "video2")
            audioS = exercicio.getAudio(2, audio: "audio2")
            
            playVideo(video, tipo: "m4v")
            playAudio(audioS, tipo: "m4a")
            
            addChild(chat2)
            addChild(seta_play2)
            
        }else if toque.name == "seta_play2" {
            
            chat2.removeFromParent()
            seta_play2.removeFromParent()
            
            //posiciona e adiciona a conversa
            chat3 = SKSpriteNode(imageNamed: "chat_roxo_texto_3")
            chat3.zPosition = 1
            chat3.name = "chat3"
            chat3.size = CGSize(width: 200, height: 200)
            chat3.position = CGPoint(x: 730, y: 300)
            
            //posiciona e adiciona a seta de próximo
            seta_play3 = SKSpriteNode(imageNamed: "seta_roxa")
            seta_play3.zPosition = 1
            seta_play3.name = "seta_play3"
            seta_play3.size = CGSize(width: 50, height: 50)
            seta_play3.position = CGPoint(x: 740, y: 270)

            movie?.view.hidden = true
            video = exercicio.getVideo(2, video: "video3")
            audioS = exercicio.getAudio(2, audio: "audio3")
            
            playVideo(video, tipo: "m4v")
            playAudio(audioS, tipo: "m4a")

            
            addChild(chat3)
            addChild(seta_play3)
            
        }else if toque.name == "seta_play3" {
            
            chat3.removeFromParent()
            seta_play3.removeFromParent()
            
            personagem_Ro.runAction(SKAction.moveToX(1500, duration: 0.6))
            movie?.view.hidden = true
            
            montarExercicio()
            
        }else if toque.name == "seta_play4" {
            
            chat4.removeFromParent()
            seta_play4.removeFromParent()
            
            personagem_Ro.runAction(SKAction.moveToX(1500, duration: 0.6))
            movie?.view.hidden = true
            
            cozinhar()
            
        }else if toque.name == "seta_play5" {
            
            chat5.removeFromParent()
            seta_play5.removeFromParent()
            
            personagem_Ro.runAction(SKAction.moveToX(1500, duration: 0.6))
            movie?.view.hidden = true
            
        }else if toque.name == "seta_play6" {
            
            var novaScene = SKScene()
            novaScene = GameScene(size: size)
            movie?.view.hidden = true
            self.scene!.view?.presentScene(novaScene)
            
        }else if toque.name == "seta_play7" {
            
            chat7.removeFromParent()
            seta_play7.removeFromParent()
            
            personagem_Ro.runAction(SKAction.moveToX(1500, duration: 0.6))
            movie?.view.hidden = true
            
        }else if toque.name == "seta_back" {
            
            var voltarMenu = SKScene()
            voltarMenu = GameScene(size: size)
            movie?.view.hidden = true
            self.scene!.view?.presentScene(voltarMenu)
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func montarScene(){
        
        scene?.view?.backgroundColor = UIColor.whiteColor()
        
        //posiciona e adiciona o plano de fundo
        background = SKSpriteNode(imageNamed: "fundo")
        background.zPosition = 1
        background.name = "background_numeros"
        background.size = CGSize(width: 1050, height: 800)
        background.position = CGPoint(x: 510, y: 400)
    
        background_cozinha = SKSpriteNode(imageNamed: "fundo_cozinha")
        background_cozinha.zPosition = 1
        background_cozinha.name = "background_numeros"
        background_cozinha.size = CGSize(width: 471, height: 490)
        background_cozinha.position = CGPoint(x: 510, y: 400)
        
        //posiciona e adiciona o personagem
        personagem_Ro = SKSpriteNode(imageNamed: "Ro")
        personagem_Ro.zPosition = 1
        personagem_Ro.name = "ro"
        personagem_Ro.size = CGSize(width: 142, height: 337)
        personagem_Ro.position = CGPoint(x: 850, y: 150)
        
        //posiciona e adiciona a conversa
        chat = SKSpriteNode(imageNamed: "chat_roxo_texto_1")
        chat.zPosition = 1
        chat.name = "chat1"
        chat.size = CGSize(width: 200, height: 200)
        chat.position = CGPoint(x: 730, y: 300)
        
        //posiciona e adiciona a seta de próximo e a de voltar
        seta_play = SKSpriteNode(imageNamed: "seta_roxa")
        seta_play.zPosition = 1
        seta_play.name = "seta_play"
        seta_play.size = CGSize(width: 50, height: 50)
        seta_play.position = CGPoint(x: 740, y: 280)
        
        seta_back = SKSpriteNode(imageNamed: "seta_back_roxa")
        seta_back.zPosition = 1
        seta_back.name = "seta_back"
        seta_back.size = CGSize(width: 50, height: 50)
        seta_back.position = CGPoint(x: 50, y: 50)

        addChild(background)
        addChild(background_cozinha)
        addChild(personagem_Ro)
        addChild(chat)
        addChild(seta_play)
        addChild(seta_back)
        
    }
    
    func montarExercicio(){
        
        leg1 = Vegetais(texture: SKTexture(imageNamed: "abobora"), color: UIColor.clearColor(), size: CGSize(width: 80, height: 80), tipo: "legume")
        leg1.zPosition = 1
        leg1.name = "abobora"
        leg1.position = CGPoint(x: 100, y: 100)
        
        leg2 = Vegetais(texture: SKTexture(imageNamed: "abacaxi"), color: UIColor.clearColor(), size: CGSize(width: 80, height: 100), tipo: "fruta")
        leg2.zPosition = 1
        leg2.name = "abacaxi"
        leg2.position = CGPoint(x: 200, y: 250)
        
        leg3 = Vegetais(texture: SKTexture(imageNamed: "beterraba"), color: UIColor.clearColor(), size: CGSize(width: 80, height: 100), tipo: "legume")
        leg3.zPosition = 1
        leg3.name = "beterraba"
        leg3.position = CGPoint(x: 150, y: 450)
        
        leg4 = Vegetais(texture: SKTexture(imageNamed: "couve_flor"), color: UIColor.clearColor(), size: CGSize(width: 80, height: 80), tipo: "legume")
        leg4.zPosition = 1
        leg4.name = "couve_flor"
        leg4.position = CGPoint(x: 450, y: 700)
        
        leg5 = Vegetais(texture: SKTexture(imageNamed: "kiwi"), color: UIColor.clearColor(), size: CGSize(width: 80, height: 80), tipo: "fruta")
        leg5.zPosition = 1
        leg5.name = "kiwi"
        leg5.position = CGPoint(x: 850, y: 650)
        
        leg6 = Vegetais(texture: SKTexture(imageNamed: "pimentao"), color: UIColor.clearColor(), size: CGSize(width: 80, height: 80), tipo: "legume")
        leg6.zPosition = 1
        leg6.name = "pimentao"
        leg6.position = CGPoint(x: 800, y: 450)
        
        leg7 = Vegetais(texture: SKTexture(imageNamed: "cenoura"), color: UIColor.clearColor(), size: CGSize(width: 80, height: 80), tipo: "legume")
        leg7.zPosition = 1
        leg7.name = "cenoura"
        leg7.position = CGPoint(x: 900, y: 250)
        
        leg8 = Vegetais(texture: SKTexture(imageNamed: "banana"), color: UIColor.clearColor(), size: CGSize(width: 80, height: 80), tipo: "fruta")
        leg8.zPosition = 1
        leg8.name = "banana"
        leg8.position = CGPoint(x: 750, y: 100)
        
        addChild(leg1)
        addChild(leg2)
        addChild(leg3)
        addChild(leg4)
        addChild(leg5)
        addChild(leg6)
        addChild(leg7)
        addChild(leg8)
    }
    
    //função para tocar video
    func playVideo( video: String, tipo: String){
        
        let path = NSBundle.mainBundle().pathForResource(video, ofType: tipo)
        let url = NSURL.fileURLWithPath(path!)
        let movie = MPMoviePlayerController(contentURL: url)
        
        if (movie != nil) {
            
            self.movie = movie
            movie.view.frame = CGRect(x: 20, y: 20, width: 300, height: 300)
            movie.view.layer.zPosition = 1
            movie.scalingMode = .AspectFill
            self.view?.addSubview(movie.view)
            movie.play()
        }else{
            debugPrint("Video não encontrado", terminator: "")
        }
    }
    
    //função para tocar audio
    func playAudio(audio: String, tipo: String){
        
        let path = NSBundle.mainBundle().pathForResource(audio, ofType: tipo)
        let url = NSURL(fileURLWithPath: path!)
        self.audio = try? AVAudioPlayer(contentsOfURL: url)
        self.audio.prepareToPlay()
        self.audio.play()
    }

    func vamosContar(){
        
        leg2.removeFromParent()
        leg5.removeFromParent()
        leg8.removeFromParent()
        
        //posiciona e adiciona a conversa
        chat5 = SKSpriteNode(imageNamed: "chat_roxo_texto_5")
        chat5.zPosition = 1
        chat5.name = "chat5"
        chat5.size = CGSize(width: 200, height: 200)
        chat5.position = CGPoint(x: 730, y: 300)
        
        //posiciona e adiciona a seta de próximo
        seta_play5 = SKSpriteNode(imageNamed: "seta_roxa")
        seta_play5.zPosition = 1
        seta_play5.name = "seta_play5"
        seta_play5.size = CGSize(width: 50, height: 50)
        seta_play5.position = CGPoint(x: 740, y: 270)
        
        movie?.view.hidden = true
        video = exercicio.getVideo(2, video: "video5")
        audioS = exercicio.getAudio(2, audio: "audio5")
        
        playVideo(video, tipo: "m4v")
        playAudio(audioS, tipo: "m4a")
        
        
        addChild(chat5)
        addChild(seta_play5)
        
        personagem_Ro.runAction(SKAction.moveToX(850, duration: 0.6))
        personagem_Ro.zPosition = 3
        
        num1 = Numero(texture: SKTexture(imageNamed: "num1"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 1, exercicio: 2)
        num1.zPosition = 1
        num1.name = "exercicio2_1"
        num1.position = CGPoint(x: 600, y: 700)
        
        num2 = Numero(texture: SKTexture(imageNamed: "num2"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 2, exercicio: 2)
        num2.zPosition = 1
        num2.name = "exercicio2_2"
        num2.position = CGPoint(x: 200, y: 500)
        
        num3 = Numero(texture: SKTexture(imageNamed: "num3"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 3, exercicio: 2)
        num3.zPosition = 1
        num3.name = "exercicio2_3"
        num3.position = CGPoint(x: 150, y: 350)
        
        num4 = Numero(texture: SKTexture(imageNamed: "num4"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 4, exercicio: 2)
        num4.zPosition = 1
        num4.name = "exercicio2_4"
        num4.position = CGPoint(x: 100, y: 200)
        
        num5 = Numero(texture: SKTexture(imageNamed: "num5"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 5, exercicio: 2)
        num5.zPosition = 1
        num5.name = "exercicio2_5"
        num5.position = CGPoint(x: 800, y: 550)
        
        num6 = Numero(texture: SKTexture(imageNamed: "num6"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 6, exercicio: 2)
        num6.zPosition = 1
        num6.name = "exercicio2_6"
        num6.position = CGPoint(x: 200, y: 100)
        
        num7 = Numero(texture: SKTexture(imageNamed: "num7"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 7, exercicio: 2)
        num7.zPosition = 1
        num7.name = "exercicio2_7"
        num7.position = CGPoint(x: 800, y: 200)
        
        num8 = Numero(texture: SKTexture(imageNamed: "num8"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 8, exercicio: 2)
        num8.zPosition = 1
        num8.name = "exercicio2_8"
        num8.position = CGPoint(x: 850, y: 400)
        
        num9 = Numero(texture: SKTexture(imageNamed: "num9"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 9, exercicio: 2)
        num9.zPosition = 1
        num9.name = "exercicio2_9"
        num9.position = CGPoint(x: 100, y: 650)
        
        num10 = Numero(texture: SKTexture(imageNamed: "num10"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 10, exercicio: 2)
        num10.zPosition = 1
        num10.name = "exercicio2_10"
        num10.position = CGPoint(x: 900, y: 300)
        
        
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
    
    func contouErrado(){
        //posiciona e adiciona a conversa
        chat7 = SKSpriteNode(imageNamed: "chat_roxo_texto_7")
        chat7.zPosition = 1
        chat7.name = "chat7"
        chat7.size = CGSize(width: 200, height: 200)
        chat7.position = CGPoint(x: 730, y: 300)
        
        //posiciona e adiciona a seta de próximo
        seta_play7 = SKSpriteNode(imageNamed: "seta_roxa")
        seta_play7.zPosition = 1
        seta_play7.name = "seta_play7"
        seta_play7.size = CGSize(width: 50, height: 50)
        seta_play7.position = CGPoint(x: 740, y: 270)
        
        movie?.view.hidden = true
        
        //mudar para audio5
        video = exercicio.getVideo(2, video: "video7")
        audioS = exercicio.getAudio(2, audio: "audio7")
        
        playVideo(video, tipo: "m4v")
        playAudio(audioS, tipo: "m4a")
        
        
        addChild(chat7)
        addChild(seta_play7)
        
        personagem_Ro.runAction(SKAction.moveToX(850, duration: 0.6))

    }
    
    func prontoParaCozinhar(){
        print("COZINHAR")
        
        //posiciona e adiciona a conversa
        chat4 = SKSpriteNode(imageNamed: "chat_roxo_texto_4")
        chat4.zPosition = 1
        chat4.name = "chat4"
        chat4.size = CGSize(width: 200, height: 200)
        chat4.position = CGPoint(x: 730, y: 300)
        
        //posiciona e adiciona a seta de próximo
        seta_play4 = SKSpriteNode(imageNamed: "seta_roxa")
        seta_play4.zPosition = 1
        seta_play4.name = "seta_play4"
        seta_play4.size = CGSize(width: 50, height: 50)
        seta_play4.position = CGPoint(x: 740, y: 270)
        
        movie?.view.hidden = true
        
        //mudar para audio5
        video = exercicio.getVideo(2, video: "video4")
        audioS = exercicio.getAudio(2, audio: "audio4")
        
        playVideo(video, tipo: "m4v")
        playAudio(audioS, tipo: "m4a")
        
        
        addChild(chat4)
        addChild(seta_play4)

        personagem_Ro.runAction(SKAction.moveToX(850, duration: 0.6))
        
    }
    
    func cozinhar() {
        leg1.runAction(SKAction.moveTo(CGPoint(x: 510, y: 360), duration: 0.7))
        leg3.runAction(SKAction.moveTo(CGPoint(x: 510, y: 360), duration: 0.7))
        leg4.runAction(SKAction.moveTo(CGPoint(x: 510, y: 360), duration: 0.7))
        leg6.runAction(SKAction.moveTo(CGPoint(x: 510, y: 360), duration: 0.7))
        leg7.runAction(SKAction.moveTo(CGPoint(x: 510, y: 360), duration: 0.7))

        novoPrato()
    }
    
    func novoPrato() {
        
        leg1.removeFromParent()
        leg3.removeFromParent()
        leg4.removeFromParent()
        leg6.removeFromParent()
        leg7.removeFromParent()
        
        num1.removeFromParent()
        num2.removeFromParent()
        num3.removeFromParent()
        num4.removeFromParent()
        num5.removeFromParent()
        num6.removeFromParent()
        num7.removeFromParent()
        num8.removeFromParent()
        num9.removeFromParent()
        num10.removeFromParent()
        
        prato = SKSpriteNode(imageNamed: "prato")
        prato.zPosition = 1
        prato.position = CGPoint(x: 510, y: 360)
        prato.name = "prato"
        prato.size = CGSize(width: 150, height: 150)
        
        addChild(prato)
        
        //posiciona e adiciona a conversa
        chat6 = SKSpriteNode(imageNamed: "chat_roxo_texto_6")
        chat6.zPosition = 1
        chat6.name = "chat6"
        chat6.size = CGSize(width: 200, height: 200)
        chat6.position = CGPoint(x: 730, y: 300)
        
        //posiciona e adiciona a seta de próximo
        seta_play6 = SKSpriteNode(imageNamed: "seta_roxa")
        seta_play6.zPosition = 1
        seta_play6.name = "seta_play6"
        seta_play6.size = CGSize(width: 50, height: 50)
        seta_play6.position = CGPoint(x: 740, y: 270)
        
        movie?.view.hidden = true
        
        
        
        //mudar para audio6
        video = exercicio.getVideo(2, video: "video6")
        audioS = exercicio.getAudio(2, audio: "audio6")
        
        playVideo(video, tipo: "m4v")
        playAudio(audioS, tipo: "m4a")
        
        
        addChild(chat6)
        addChild(seta_play6)
        
        personagem_Ro.runAction(SKAction.moveToX(850, duration: 0.6))
    }
}

