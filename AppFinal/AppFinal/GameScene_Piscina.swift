//
//  GameScene_Espaco.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 17/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit
import MediaPlayer
import AVFoundation

class GameScene_Piscina: SKScene {
    
    var background_bolas: SKSpriteNode!
    var background: SKSpriteNode!
    
    var movie: MPMoviePlayerController?
    var audio: AVAudioPlayer!

    var exercicio: ExercicioJSON = ExercicioJSON()
    var video: String = ""
    var audioS: String = ""

    var personagem_Paula: SKSpriteNode!
    var personagem_placa: SKSpriteNode!
    var personagem_placa1: SKSpriteNode!
    var personagem_placa2: SKSpriteNode!
    var personagem_placa3: SKSpriteNode!
    var personagem_placa4: SKSpriteNode!
    var personagem_placa5: SKSpriteNode!
    
    var chat1: SKSpriteNode!
    var chat2: SKSpriteNode!
    var chat3: SKSpriteNode!
    
    var seta_play: SKSpriteNode!
    var seta_play1: SKSpriteNode!
    var seta_play2: SKSpriteNode!
    var seta_play3: SKSpriteNode!
    
    var bola1: SKSpriteNode!
    var bola2: SKSpriteNode!
    var bola3: SKSpriteNode!
    var bola4: SKSpriteNode!
    var bola5: SKSpriteNode!
    var bola6: SKSpriteNode!
    var bola7: SKSpriteNode!
    var bola8: SKSpriteNode!
    var bola9: SKSpriteNode!
    
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
        
        montarScene()
        
        video = exercicio.getVideo(3, video: "video1")
        audioS = exercicio.getAudio(3, audio: "audio1")
        
        playVideo(video, tipo: "m4v")
        playAudio(audioS, tipo: "m4a")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocation)
        
        if toque.name == "seta_play1" {
            
            chat1.removeFromParent()
            seta_play1.removeFromParent()
            movie?.view.hidden = true
            
            chat2 = SKSpriteNode(imageNamed: "chat_verde_texto_2")
            chat2.zPosition = 1
            chat2.name = "chat_verde_2"
            chat2.size = CGSize(width: 200, height: 200)
            chat2.position = CGPoint(x: 730, y: 300)
            
            seta_play2 = SKSpriteNode(imageNamed: "seta_verde")
            seta_play2.zPosition = 1
            seta_play2.name = "seta_play2"
            seta_play2.size = CGSize(width: 50, height: 50)
            seta_play2.position = CGPoint(x: 740, y: 280)
            
            video = exercicio.getVideo(3, video: "video2")
            audioS = exercicio.getAudio(3, audio: "audio2")
            
            playVideo(video, tipo: "m4v")
            playAudio(audioS, tipo: "m4a")
            
            addChild(chat2)
            addChild(seta_play2)
            
        }else if toque.name == "seta_play2" {
            
            chat2.removeFromParent()
            seta_play2.removeFromParent()
            movie!.view.hidden = true
            
            chat3 = SKSpriteNode(imageNamed: "chat_verde_texto_3")
            chat3.zPosition = 1
            chat3.name = "chat_verde_3"
            chat3.size = CGSize(width: 200, height: 200)
            chat3.position = CGPoint(x: 730, y: 300)
            
            seta_play3 = SKSpriteNode(imageNamed: "seta_verde")
            seta_play3.zPosition = 1
            seta_play3.name = "seta_play3"
            seta_play3.size = CGSize(width: 50, height: 50)
            seta_play3.position = CGPoint(x: 740, y: 280)
            
            video = exercicio.getVideo(3, video: "video3")
            audioS = exercicio.getAudio(3, audio: "audio3")
            
            playVideo(video, tipo: "m4v")
            playAudio(audioS, tipo: "m4a")
            
            addChild(chat3)
            addChild(seta_play3)
            
        }else if toque.name == "seta_play3" {
            
            chat3.removeFromParent()
            seta_play3.removeFromParent()
            movie?.view.hidden = true
            
            personagem_Paula.runAction(SKAction.moveToX(1200, duration: 0.6))
            
            background = SKSpriteNode(imageNamed: "fundo_para_bolas")
            background.zPosition = 1
            background.name = "fundo1"
            background.size = CGSize(width: 500, height: 500)
            background.position = CGPoint(x: 525, y: 400)
            
            seta_play = SKSpriteNode(imageNamed: "seta_verde")
            seta_play.zPosition = 1
            seta_play.name = "proximo"
            seta_play.size = CGSize(width: 70, height: 70)
            seta_play.position = CGPoint(x: 700, y: 80)
            
            addChild(background)
            addChild(seta_play)
            
            contarBolas(1)
            
        }else if toque.name == "proximo" && num4.name == "exercicio3_4_novo"{
            
            seta_play = SKSpriteNode(imageNamed: "seta_verde")
            seta_play.zPosition = 1
            seta_play.name = "proximo"
            seta_play.size = CGSize(width: 70, height: 70)
            seta_play.position = CGPoint(x: 700, y: 80)
            
            addChild(seta_play)
            
            contarBolas(2)
            
        }else if toque.name == "proximo" && num3.name == "exercicio3_3_novo" {
            
            seta_play = SKSpriteNode(imageNamed: "seta_verde")
            seta_play.zPosition = 1
            seta_play.name = "proximo"
            seta_play.size = CGSize(width: 70, height: 70)
            seta_play.position = CGPoint(x: 700, y: 80)
            
            addChild(seta_play)
        
            contarBolas(3)
            
        }else if toque.name == "proximo" && num5.name == "exercicio3_5_novo" {

            seta_play = SKSpriteNode(imageNamed: "seta_verde")
            seta_play.zPosition = 1
            seta_play.name = "proximo"
            seta_play.size = CGSize(width: 70, height: 70)
            seta_play.position = CGPoint(x: 700, y: 80)
            
            addChild(seta_play)
            
            contarBolas(4)
            
        }else if toque.name == "proximo" && num7.name == "exercicio3_7_novo" {
            
            seta_play = SKSpriteNode(imageNamed: "seta_verde")
            seta_play.zPosition = 1
            seta_play.name = "proximo"
            seta_play.size = CGSize(width: 70, height: 70)
            seta_play.position = CGPoint(x: 700, y: 80)
            
            addChild(seta_play)
            
            contarBolas(5)
            
        }else if toque.name == "proximo" && num2.name == "exercicio3_2_novo" {
            
            personagem_placa.removeFromParent()
            background.removeFromParent()
            
            bola1.removeFromParent()
            bola2.removeFromParent()
            
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
            
            somaBolas()
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    // função que monta a scene
    func montarScene() {
        //posicionando os menus na tela
        background_bolas = SKSpriteNode(imageNamed: "fundo_bolas")
        background_bolas.zPosition = 1
        background_bolas.size = CGSize(width: 1050, height: 800)
        background_bolas.position = CGPoint(x: 510, y: 400)
        background_bolas.name = "menu_espaco_forma"
        background_bolas.alpha = 0.9
        
        personagem_Paula = SKSpriteNode(imageNamed: "Paula")
        personagem_Paula.zPosition = 1
        personagem_Paula.name = "paula"
        personagem_Paula.position = CGPoint(x: 850, y: 150)
        personagem_Paula.size = CGSize(width: 126, height: 227)
        
        //posiciona e adiciona a conversa
        chat1 = SKSpriteNode(imageNamed: "chat_verde_texto_1")
        chat1.zPosition = 1
        chat1.name = "chat_verde_1"
        chat1.size = CGSize(width: 200, height: 200)
        chat1.position = CGPoint(x: 730, y: 300)
        
        //posiciona e adiciona a seta de próximo e a de voltar
        seta_play1 = SKSpriteNode(imageNamed: "seta_verde")
        seta_play1.zPosition = 1
        seta_play1.name = "seta_play1"
        seta_play1.size = CGSize(width: 50, height: 50)
        seta_play1.position = CGPoint(x: 740, y: 280)
        
        addChild(background_bolas)
        addChild(personagem_Paula)
        addChild(chat1)
        addChild(seta_play1)
    }
    
    //função que monta o exercicio
    func contarBolas(personagem: Int) {
        
        if personagem == 1 {
            
            personagem_placa = SKSpriteNode(imageNamed: "personagem_placa_1")
            personagem_placa.zPosition = 1
            personagem_placa.name = "personagem1"
            personagem_placa.size = CGSize(width: 110, height: 305)
            personagem_placa.position = CGPoint(x: 850, y: 150)
            
            bola1 = SKSpriteNode(imageNamed: "bola_amarela")
            bola1.zPosition = 1
            bola1.name = "bola1"
            bola1.size = CGSize(width: 100, height: 100)
            bola1.position = CGPoint(x: 440, y: 300)
            
            bola2 = SKSpriteNode(imageNamed: "bola_azul_claro")
            bola2.zPosition = 1
            bola2.name = "bola2"
            bola2.size = CGSize(width: 100, height: 100)
            bola2.position = CGPoint(x: 440, y: 470)
            
            bola3 = SKSpriteNode(imageNamed: "bola_rosa")
            bola3.zPosition = 1
            bola3.name = "bola3"
            bola3.size = CGSize(width: 100, height: 100)
            bola3.position = CGPoint(x: 640, y: 300)
            
            bola4 = SKSpriteNode(imageNamed: "bola_vermelha")
            bola4.zPosition = 1
            bola4.name = "bola4"
            bola4.size = CGSize(width: 100, height: 100)
            bola4.position = CGPoint(x: 640, y: 470)
            
            addChild(personagem_placa)
            addChild(bola1)
            addChild(bola2)
            addChild(bola3)
            addChild(bola4)
            
        }else if personagem == 2 {
            
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
            personagem_placa.removeFromParent()
            bola1.removeFromParent()
            bola2.removeFromParent()
            bola3.removeFromParent()
            bola4.removeFromParent()
            
            personagem_placa = SKSpriteNode(imageNamed: "personagem_placa_2")
            personagem_placa.zPosition = 1
            personagem_placa.name = "personagem2"
            personagem_placa.size = CGSize(width: 110, height: 305)
            personagem_placa.position = CGPoint(x: 850, y: 150)
            
            bola1 = SKSpriteNode(imageNamed: "bola_marrom")
            bola1.zPosition = 1
            bola1.name = "bola1"
            bola1.size = CGSize(width: 100, height: 100)
            bola1.position = CGPoint(x: 440, y: 300)
            
            bola2 = SKSpriteNode(imageNamed: "bola_roxa")
            bola2.zPosition = 1
            bola2.name = "bola2"
            bola2.size = CGSize(width: 100, height: 100)
            bola2.position = CGPoint(x: 500, y: 470)
            
            bola3 = SKSpriteNode(imageNamed: "bola_laranja")
            bola3.zPosition = 1
            bola3.name = "bola3"
            bola3.size = CGSize(width: 100, height: 100)
            bola3.position = CGPoint(x: 640, y: 370)
            
            addChild(personagem_placa)
            addChild(bola1)
            addChild(bola2)
            addChild(bola3)

        }else if personagem == 3 {
            
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
            personagem_placa.removeFromParent()
            bola1.removeFromParent()
            bola2.removeFromParent()
            bola3.removeFromParent()
            
            personagem_placa = SKSpriteNode(imageNamed: "personagem_placa_3")
            personagem_placa.zPosition = 1
            personagem_placa.name = "personagem3"
            personagem_placa.size = CGSize(width: 110, height: 305)
            personagem_placa.position = CGPoint(x: 850, y: 150)
            
            bola1 = SKSpriteNode(imageNamed: "bola_amarela")
            bola1.zPosition = 1
            bola1.name = "bola1"
            bola1.size = CGSize(width: 100, height: 100)
            bola1.position = CGPoint(x: 440, y: 300)
            
            bola2 = SKSpriteNode(imageNamed: "bola_azul_claro")
            bola2.zPosition = 1
            bola2.name = "bola2"
            bola2.size = CGSize(width: 100, height: 100)
            bola2.position = CGPoint(x: 440, y: 470)
            
            bola3 = SKSpriteNode(imageNamed: "bola_rosa")
            bola3.zPosition = 1
            bola3.name = "bola3"
            bola3.size = CGSize(width: 100, height: 100)
            bola3.position = CGPoint(x: 640, y: 300)
            
            bola4 = SKSpriteNode(imageNamed: "bola_vermelha")
            bola4.zPosition = 1
            bola4.name = "bola4"
            bola4.size = CGSize(width: 100, height: 100)
            bola4.position = CGPoint(x: 640, y: 470)
            
            bola5 = SKSpriteNode(imageNamed: "bola_verde")
            bola5.zPosition = 1
            bola5.name = "bola5"
            bola5.size = CGSize(width: 100, height: 100)
            bola5.position = CGPoint(x: 530, y: 380)
            
            addChild(personagem_placa)
            addChild(bola1)
            addChild(bola2)
            addChild(bola3)
            addChild(bola4)
            addChild(bola5)

        }else if personagem == 4 {
            
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
            personagem_placa.removeFromParent()
            bola1.removeFromParent()
            bola2.removeFromParent()
            bola3.removeFromParent()
            bola4.removeFromParent()
            bola5.removeFromParent()
            
            personagem_placa = SKSpriteNode(imageNamed: "personagem_placa_4")
            personagem_placa.zPosition = 1
            personagem_placa.name = "personagem4"
            personagem_placa.size = CGSize(width: 110, height: 305)
            personagem_placa.position = CGPoint(x: 850, y: 150)
            
            bola1 = SKSpriteNode(imageNamed: "bola_azul")
            bola1.zPosition = 1
            bola1.name = "bola1"
            bola1.size = CGSize(width: 100, height: 100)
            bola1.position = CGPoint(x: 440, y: 300)
            
            bola2 = SKSpriteNode(imageNamed: "bola_amarela")
            bola2.zPosition = 1
            bola2.name = "bola2"
            bola2.size = CGSize(width: 100, height: 100)
            bola2.position = CGPoint(x: 500, y: 500)
            
            bola3 = SKSpriteNode(imageNamed: "bola_rosa")
            bola3.zPosition = 1
            bola3.name = "bola3"
            bola3.size = CGSize(width: 100, height: 100)
            bola3.position = CGPoint(x: 630, y: 530)
            
            bola4 = SKSpriteNode(imageNamed: "bola_verde_claro")
            bola4.zPosition = 1
            bola4.name = "bola4"
            bola4.size = CGSize(width: 100, height: 100)
            bola4.position = CGPoint(x: 600, y: 300)
            
            bola5 = SKSpriteNode(imageNamed: "bola_vermelha")
            bola5.zPosition = 1
            bola5.name = "bola5"
            bola5.size = CGSize(width: 100, height: 100)
            bola5.position = CGPoint(x: 550, y: 400)
            
            bola6 = SKSpriteNode(imageNamed: "bola_marrom")
            bola6.zPosition = 1
            bola6.name = "bola6"
            bola6.size = CGSize(width: 100, height: 100)
            bola6.position = CGPoint(x: 660, y: 400)
            
            bola7 = SKSpriteNode(imageNamed: "bola_roxa")
            bola7.zPosition = 1
            bola7.name = "bola7"
            bola7.size = CGSize(width: 100, height: 100)
            bola7.position = CGPoint(x: 400, y: 400)
            
            addChild(personagem_placa)
            addChild(bola1)
            addChild(bola2)
            addChild(bola3)
            addChild(bola4)
            addChild(bola5)
            addChild(bola6)
            addChild(bola7)
            
        }else if personagem == 5 {
            
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
            personagem_placa.removeFromParent()
            bola1.removeFromParent()
            bola2.removeFromParent()
            bola3.removeFromParent()
            bola4.removeFromParent()
            bola5.removeFromParent()
            bola6.removeFromParent()
            bola7.removeFromParent()
            
            personagem_placa = SKSpriteNode(imageNamed: "personagem_placa_5")
            personagem_placa.zPosition = 1
            personagem_placa.name = "personagem5"
            personagem_placa.size = CGSize(width: 110, height: 305)
            personagem_placa.position = CGPoint(x: 850, y: 150)
            
            bola1 = SKSpriteNode(imageNamed: "bola_rosa")
            bola1.zPosition = 1
            bola1.name = "bola1"
            bola1.size = CGSize(width: 100, height: 100)
            bola1.position = CGPoint(x: 440, y: 300)
            
            bola2 = SKSpriteNode(imageNamed: "bola_amarela")
            bola2.zPosition = 1
            bola2.name = "bola2"
            bola2.size = CGSize(width: 100, height: 100)
            bola2.position = CGPoint(x: 500, y: 470)
            
            addChild(personagem_placa)
            addChild(bola1)
            addChild(bola2)
            
        }
        
        posicionaNumeros()
    }
    
    //função que posiciona os numeros
    func posicionaNumeros(){
        
        num1 = Numero(texture: SKTexture(imageNamed: "num1"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 1)
        num1.zPosition = 1
        num1.name = "exercicio3_1"
        num1.position = CGPoint(x: 600, y: 700)
        
        num2 = Numero(texture: SKTexture(imageNamed: "num2"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 2)
        num2.zPosition = 1
        num2.name = "exercicio3_2_certo"
        num2.position = CGPoint(x: 200, y: 500)
        
        num3 = Numero(texture: SKTexture(imageNamed: "num3"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 3)
        num3.zPosition = 1
        num3.name = "exercicio3_3_certo"
        num3.position = CGPoint(x: 150, y: 350)
        
        num4 = Numero(texture: SKTexture(imageNamed: "num4"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 4)
        num4.zPosition = 1
        num4.name = "exercicio3_4_certo"
        num4.position = CGPoint(x: 100, y: 200)
        
        num5 = Numero(texture: SKTexture(imageNamed: "num5"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 5)
        num5.zPosition = 1
        num5.name = "exercicio3_5_certo"
        num5.position = CGPoint(x: 800, y: 550)
        
        num6 = Numero(texture: SKTexture(imageNamed: "num6"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 6)
        num6.zPosition = 1
        num6.name = "exercicio3_6"
        num6.position = CGPoint(x: 200, y: 100)
        
        num7 = Numero(texture: SKTexture(imageNamed: "num7"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 7)
        num7.zPosition = 1
        num7.name = "exercicio3_7_certo"
        num7.position = CGPoint(x: 300, y: 700)
        
        num8 = Numero(texture: SKTexture(imageNamed: "num8"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 8)
        num8.zPosition = 1
        num8.name = "exercicio3_8"
        num8.position = CGPoint(x: 850, y: 400)
        
        num9 = Numero(texture: SKTexture(imageNamed: "num9"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 9)
        num9.zPosition = 1
        num9.name = "exercicio3_9"
        num9.position = CGPoint(x: 100, y: 650)
        
        num10 = Numero(texture: SKTexture(imageNamed: "num10"), color: UIColor.clearColor(), size: CGSize(width: 70, height: 70), numero: 10)
        num10.zPosition = 1
        num10.name = "exercicio3_10"
        num10.position = CGPoint(x: 900, y: 700)
        
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
    
    //função para soma das bolinhas
    func somaBolas(){
        
        personagem_placa1 = SKSpriteNode(imageNamed: "personagem_placa_1")
        personagem_placa1.zPosition = 1
        personagem_placa1.size = CGSize(width: 110, height: 305)
        personagem_placa1.position = CGPoint(x: 100, y: 600)
        
        addChild(personagem_placa1)
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
    

}
