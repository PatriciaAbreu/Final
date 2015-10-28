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

class GameScene_Esconde: SKScene {
    
    var gameController: GameViewController!
    
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
    var seta_play_4: SKSpriteNode!
    var seta_back: SKSpriteNode!
    
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
    
    var barra0: SKSpriteNode!
    var barra1: SKSpriteNode!
    var barra2: SKSpriteNode!
    var barra3: SKSpriteNode!
    var barra4: SKSpriteNode!
    var barra5: SKSpriteNode!
    var barra6: SKSpriteNode!
    var barra7: SKSpriteNode!
    var barra8: SKSpriteNode!
    var barra9: SKSpriteNode!
    var barra10: SKSpriteNode!
    
    var posi_num1: SKSpriteNode!
    var posi_num2: SKSpriteNode!
    var posi_num3: SKSpriteNode!
    var posi_num4: SKSpriteNode!
    var posi_num5: SKSpriteNode!
    var posi_num6: SKSpriteNode!
    var posi_num7: SKSpriteNode!
    var posi_num8: SKSpriteNode!
    var posi_num9: SKSpriteNode!
    var posi_num10: SKSpriteNode!
    
    var controle: Int = 0
    
    var exercicio: ExercicioJSON = ExercicioJSON()
    var video: String = ""
    var audioS: String = ""
    
    override func didMoveToView(view: SKView) {
        
        montarScene()
        
        video = exercicio.getVideo(1, video: "video1")
        audioS = exercicio.getAudio(1, audio: "audio1")
        
        playVideo(video, tipo: "mp4")
        playAudio(audioS, tipo: "m4a")
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocation)
        
        print(toque.name)
        
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
            video = exercicio.getVideo(1, video: "video2")
            audioS = exercicio.getAudio(1, audio: "audio2")
            
            playVideo(video, tipo: "mp4")
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
            
        }else if toque.name == "seta_play_4" {
            
            movie?.view.hidden = true
            var novoJogo = SKScene()
            novoJogo = GameScene(size: size)
            self.scene!.view?.presentScene(novoJogo)
            
        }else if toque.name == "seta_back" {
            
            movie?.view.hidden = true
            var voltarMenu = SKScene()
            voltarMenu = GameScene(size: size)
            self.scene!.view?.presentScene(voltarMenu)
            
        }else if toque.name == "julia" && controle != 10 {
            
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
            
            video = exercicio.getVideo(1, video: "video2")
            audioS = exercicio.getAudio(1, audio: "audio2")
            
            playVideo(video, tipo: "mp4")
            playAudio(audioS, tipo: "m4a")
            
        }else if toque.name == "julia" && controle == 10{
            
            print(num3)
            brinquedo1.removeFromParent()
            personagem_Julia.runAction(SKAction.scaleTo(2, duration: 0.3))
            num3.name = "exercicio1_3"
            
            personagem_Caio.runAction(SKAction.moveToX(950, duration: 0.5))
            
            dialogo2 = SKSpriteNode(imageNamed: "chat_azul_texto_4")
            dialogo2.zPosition = 1
            dialogo2.name = "dialogo"
            dialogo2.size = CGSize(width: 200, height: 200)
            dialogo2.position = CGPoint(x: 900, y: 400)
            
            seta_play_4 = SKSpriteNode(imageNamed: "seta_azul")
            seta_play_4.zPosition = 1
            seta_play_4.name = "seta_play_4"
            seta_play_4.size = CGSize(width: 50, height: 50)
            seta_play_4.position = CGPoint(x: 900, y: 380)
            
            addChild(dialogo2)
            addChild(seta_play_4)
            
            video = exercicio.getVideo(1, video: "video4")
            audioS = exercicio.getAudio(1, audio: "audio4")
            
            playVideo(video, tipo: "mp4")
            playAudio(audioS, tipo: "m4a")
            
        }
    }
    
    func montarScene(){
        
        //posiciona e adiciona o plano de fundo
        background_numeros = SKSpriteNode(imageNamed: "fundo_sala_brinquedos")
        background_numeros.zPosition = 1
        background_numeros.name = "background_numeros"
        background_numeros.size = CGSize(width: 1050, height: 800)
        background_numeros.position = CGPoint(x: 510, y: 400)
        
        // posiciona e adiciona brinquedos
        brinquedo1 = SKSpriteNode(imageNamed: "bola_toy")
        brinquedo1.zPosition = 1
        brinquedo1.name = "brinquedo1"
        brinquedo1.size = CGSize(width: 200, height: 200)
        brinquedo1.position = CGPoint(x: 300, y: 100)
        
        brinquedo2 = SKSpriteNode(imageNamed: "carro_toy")
        brinquedo2.zPosition = 1
        brinquedo2.name = "brinquedo2"
        brinquedo2.size = CGSize(width: 124, height: 81)
        brinquedo2.position = CGPoint(x: 450, y: 330)
        
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
        
        //posiciona e adiciona dialogo
        dialogo = SKSpriteNode(imageNamed: "chat_azul_texto")
        dialogo.zPosition = 1
        dialogo.name = "dialogo"
        dialogo.size = CGSize(width: 200, height: 200)
        dialogo.position = CGPoint(x: 780, y: 400)
        
        //posiona e adiciona setas
        seta_play = SKSpriteNode(imageNamed: "seta_azul")
        seta_play.zPosition = 1
        seta_play.name = "seta_play_1"
        seta_play.size = CGSize(width: 50, height: 50)
        seta_play.position = CGPoint(x: 780, y: 380)
        
        seta_back = SKSpriteNode(imageNamed: "seta_back")
        seta_back.zPosition = 1
        seta_back.name = "seta_back"
        seta_back.size = CGSize(width: 50, height: 50)
        seta_back.position = CGPoint(x: 50, y: 50)
        
        addChild(background_numeros)
        addChild(personagem_Julia)
        addChild(brinquedo1)
        addChild(brinquedo2)
        addChild(personagem_Caio)
        addChild(dialogo)
        addChild(seta_play)
        addChild(seta_back)
        
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
    
    //função par montar o exercicio
    func montarExercicio(){
        
        num1 = Numero(texture: SKTexture(imageNamed: "num1"), color: UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 1, exercicio: 1)
        num1.zPosition = 1
        num1.name = "exercicio1_1"
        num1.position = CGPoint(x: 800, y: 600)
        
        num2 = Numero(texture: SKTexture(imageNamed: "num2"), color:  UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 2, exercicio: 1)
        num2.zPosition = 1
        num2.name = "exercicio1_2"
        num2.position = CGPoint(x: 400, y: 550)
        
        num3 = Numero(texture: SKTexture(imageNamed: "num3"), color:  UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 3, exercicio: 1)
        num3.zPosition = 1
        num3.name = "exercicio1_3"
        num3.position = CGPoint(x: 150, y: 450)
        
        num4 = Numero(texture: SKTexture(imageNamed: "num4"), color:  UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 4, exercicio: 1)
        num4.zPosition = 1
        num4.name = "exercicio1_4"
        num4.position = CGPoint(x: 920, y: 580)
        
        num5 = Numero(texture: SKTexture(imageNamed: "num5"), color:  UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 5, exercicio: 1)
        num5.zPosition = 1
        num5.name = "exercicio1_5"
        num5.position = CGPoint(x: 750, y: 530)
        
        num6 = Numero(texture: SKTexture(imageNamed: "num6"), color: UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 6, exercicio: 1)
        num6.zPosition = 1
        num6.name = "exercicio1_6"
        num6.position = CGPoint(x: 900, y: 480)
        
        num7 = Numero(texture: SKTexture(imageNamed: "num7"), color: UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 7, exercicio: 1)
        num7.zPosition = 1
        num7.name = "exercicio1_7"
        num7.position = CGPoint(x: 300, y: 500)
        
        num8 = Numero(texture: SKTexture(imageNamed: "num8"), color: UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 8, exercicio: 1)
        num8.zPosition = 1
        num8.name = "exercicio1_8"
        num8.position = CGPoint(x: 970, y: 430)
        
        num9 = Numero(texture: SKTexture(imageNamed: "num9"), color: UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 9, exercicio: 1)
        num9.zPosition = 1
        num9.name = "exercicio1_9"
        num9.position = CGPoint(x: 600, y: 530)
        
        num10 = Numero(texture: SKTexture(imageNamed: "num10"), color: UIColor.whiteColor(), size: CGSize(width: 80, height: 70), numero: 10, exercicio: 1)
        num10.zPosition = 1
        num10.name = "exercicio1_10"
        num10.position = CGPoint(x: 220, y: 580)
        
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
        
        posi_num1 = SKSpriteNode()
        posi_num1.color = UIColor.clearColor()
        posi_num1.size = CGSize(width: 100, height: 100)
        posi_num1.position = CGPoint(x: 70, y: 670)
        posi_num1.zPosition = 0
        posi_num1.name = "posi_num1"
        
        posi_num2 = SKSpriteNode()
        posi_num2.color = UIColor.clearColor()
        posi_num2.size = CGSize(width: 100, height: 100)
        posi_num2.position = CGPoint(x: 170, y: 670)
        posi_num2.zPosition = 0
        posi_num2.name = "posi_num2"
        
        posi_num3 = SKSpriteNode()
        posi_num3.color = UIColor.clearColor()
        posi_num3.size = CGSize(width: 100, height: 100)
        posi_num3.position = CGPoint(x: 270, y: 670)
        posi_num3.zPosition = 0
        posi_num3.name = "posi_num3"
        
        posi_num4 = SKSpriteNode()
        posi_num4.color = UIColor.clearColor()
        posi_num4.size = CGSize(width: 100, height: 100)
        posi_num4.position = CGPoint(x: 370, y: 670)
        posi_num4.zPosition = 0
        posi_num4.name = "posi_num4"
        
        posi_num5 = SKSpriteNode()
        posi_num5.color = UIColor.clearColor()
        posi_num5.size = CGSize(width: 100, height: 100)
        posi_num5.position = CGPoint(x: 470, y: 670)
        posi_num5.zPosition = 0
        posi_num5.name = "posi_num5"
        
        posi_num6 = SKSpriteNode()
        posi_num6.color = UIColor.clearColor()
        posi_num6.size = CGSize(width: 100, height: 100)
        posi_num6.position = CGPoint(x: 570, y: 670)
        posi_num6.zPosition = 0
        posi_num6.name = "posi_num6"
        
        posi_num7 = SKSpriteNode()
        posi_num7.color = UIColor.clearColor()
        posi_num7.size = CGSize(width: 100, height: 100)
        posi_num7.position = CGPoint(x: 670, y: 670)
        posi_num7.zPosition = 0
        posi_num7.name = "posi_num7"
        
        posi_num8 = SKSpriteNode()
        posi_num8.color = UIColor.clearColor()
        posi_num8.size = CGSize(width: 100, height: 100)
        posi_num8.position = CGPoint(x: 770, y: 670)
        posi_num8.zPosition = 0
        posi_num8.name = "posi_num8"
        
        posi_num9 = SKSpriteNode()
        posi_num9.color = UIColor.clearColor()
        posi_num9.size = CGSize(width: 100, height: 100)
        posi_num9.position = CGPoint(x: 870, y: 670)
        posi_num9.zPosition = 0
        posi_num9.name = "posi_num9"
        
        
        posi_num10 = SKSpriteNode()
        posi_num10.color = UIColor.clearColor()
        posi_num10.size = CGSize(width: 100, height: 100)
        posi_num10.position = CGPoint(x: 970, y: 670)
        posi_num10.zPosition = 1
        posi_num10.name = "posi_num10"
        
        addChild(posi_num1)
        addChild(posi_num2)
        addChild(posi_num3)
        addChild(posi_num4)
        addChild(posi_num5)
        addChild(posi_num6)
        addChild(posi_num7)
        addChild(posi_num8)
        addChild(posi_num9)
        addChild(posi_num10)
        
        
        barra1 = SKSpriteNode(imageNamed: "barra")
        barra1.zPosition = 1
        barra1.name = "barra1"
        barra1.size = CGSize(width: 70, height: 10)
        barra1.position = CGPoint(x: 70, y: 640)
        
        barra2 = SKSpriteNode(imageNamed: "barra")
        barra2.zPosition = 1
        barra2.name = "barra2"
        barra2.size = CGSize(width: 70, height: 10)
        barra2.position = CGPoint(x: 170, y: 640)
        
        barra3 = SKSpriteNode(imageNamed: "barra")
        barra3.zPosition = 1
        barra3.name = "barra3"
        barra3.size = CGSize(width: 70, height: 10)
        barra3.position = CGPoint(x: 270, y: 640)
        
        barra4 = SKSpriteNode(imageNamed: "barra")
        barra4.zPosition = 1
        barra4.name = "barra4"
        barra4.size = CGSize(width: 70, height: 10)
        barra4.position = CGPoint(x: 370, y: 640)
        
        barra5 = SKSpriteNode(imageNamed: "barra")
        barra5.zPosition = 1
        barra5.name = "barra5"
        barra5.size = CGSize(width: 70, height: 10)
        barra5.position = CGPoint(x: 470, y: 640)
        
        barra6 = SKSpriteNode(imageNamed: "barra")
        barra6.zPosition = 1
        barra6.name = "barra6"
        barra6.size = CGSize(width: 70, height: 10)
        barra6.position = CGPoint(x: 570, y: 640)
        
        barra7 = SKSpriteNode(imageNamed: "barra")
        barra7.zPosition = 1
        barra7.name = "barra7"
        barra7.size = CGSize(width: 70, height: 10)
        barra7.position = CGPoint(x: 670, y: 640)
        
        barra8 = SKSpriteNode(imageNamed: "barra")
        barra8.zPosition = 1
        barra8.name = "barra8"
        barra8.size = CGSize(width: 70, height: 10)
        barra8.position = CGPoint(x: 770, y: 640)
        
        barra9 = SKSpriteNode(imageNamed: "barra")
        barra9.zPosition = 1
        barra9.name = "barra9"
        barra9.size = CGSize(width: 70, height: 10)
        barra9.position = CGPoint(x: 870, y: 640)
        
        barra10 = SKSpriteNode(imageNamed: "barra")
        barra10.zPosition = 1
        barra10.name = "barra10"
        barra10.size = CGSize(width: 70, height: 10)
        barra10.position = CGPoint(x: 970, y: 640)
        
        addChild(barra1)
        addChild(barra2)
        addChild(barra3)
        addChild(barra4)
        addChild(barra5)
        addChild(barra6)
        addChild(barra7)
        addChild(barra8)
        addChild(barra9)
        addChild(barra10)
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
        
        video = exercicio.getVideo(1, video: "video3")
        audioS = exercicio.getAudio(1, audio: "audio3")
        playVideo(video, tipo: "mp4")
        playAudio(audioS, tipo: "m4a")
    }
    
    
    func posicionarNumero(numero:Numero){
        
        if numero.intersectsNode(posi_num1) {
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posi_num1.position.x, y: posi_num1.position.y), duration: 0.2))
            print("entrou1")
            
        }else if numero.intersectsNode(posi_num2){
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posi_num2.position.x, y: posi_num2.position.y), duration: 0.2))
            print("entrou2")
        }else if numero.intersectsNode(posi_num3){
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posi_num3.position.x, y: posi_num3.position.y), duration: 0.2))
            print("entrou3")
            
        }else if numero.intersectsNode(posi_num4){
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posi_num4.position.x, y: posi_num4.position.y), duration: 0.2))
            print("entrou4")
            
        }else if numero.intersectsNode(posi_num5){
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posi_num5.position.x, y: posi_num5.position.y), duration: 0.2))
            print("entrou5")
            
        }else if numero.intersectsNode(posi_num6){
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posi_num6.position.x, y: posi_num6.position.y), duration: 0.2))
            print("entrou6")
            
        }else if numero.intersectsNode(posi_num7){
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posi_num7.position.x, y: posi_num7.position.y), duration: 0.2))
            print("entrou7")
            
        }else if numero.intersectsNode(posi_num8){
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posi_num8.position.x, y: posi_num8.position.y), duration: 0.2))
            print("entrou8")
            
        }else if numero.intersectsNode(posi_num9){
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posi_num9.position.x, y: posi_num9.position.y), duration: 0.2))
            print("entrou9")
            
        }else if numero.intersectsNode(posi_num10){
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posi_num10.position.x, y: posi_num10.position.y), duration: 0.2))
            print("entrou10")
            
        }
        
        
    }
    
    func verificaPosicao(numero: Numero){
        
        if numero.intersectsNode(posi_num1){
            
            if numero.name != "exercicio1_1" {
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 0 {
                controle = 1
                
            }else{
                
                 numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }
            
            
        }else if numero.intersectsNode(posi_num2) {
            
            if numero.name != "exercicio1_2"{

                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 1 {
                controle = 2
                
            }else{
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }

            
            
        }else if numero.intersectsNode(posi_num3){
            
            if numero.name != "exercicio1_3" {
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 2 {
                controle = 3
                
            }else{
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }

            
            
        }else if numero.intersectsNode(posi_num4) {
            
            if numero.name != "exercicio1_4" {
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 3 {
                controle = 4
                
            }else{
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }

            
            
        }else if numero.intersectsNode(posi_num5) {
            
            if numero.name != "exercicio1_5" {
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 4 {
                controle = 5
                
            }else{
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }

            
            
        }else if numero.intersectsNode(posi_num6) {
            
            if numero.name != "exercicio1_6" {
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 5 {
                controle = 6
                
            }else{
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }

            
            
        }else if numero.intersectsNode(posi_num7) {
            
            if numero.name != "exercicio1_7" {
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 6 {
                controle = 7
                
            }else{
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }

            
            
        }else if numero.intersectsNode(posi_num8) {
            
            if numero.name != "exercicio1_8" {
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 7 {
                controle = 8
                
            }else{
                
                 numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }

            
            
        }else if numero.intersectsNode(posi_num9) {
            
            if numero.name != "exercicio1_9" {
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 8 {
                controle = 9
                
            }else{
                
                 numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }

            
            
        }else if numero.intersectsNode(posi_num10) {
            
            if numero.name != "exercicio1_10" {
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 9 {
                controle = 10
                procurarJulia()
                
            }else{
                
                 numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }

            
            
        }

        
    }
}
