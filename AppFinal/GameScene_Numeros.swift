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
    
    var exercicio: ExercicioJSON = ExercicioJSON()
    var video: String = ""
    var audioS: String = ""
    
    override func didMoveToView(view: SKView) {

        montarScene()
        
        video = exercicio.getVideo(1, video: "video1")
        audioS = exercicio.getAudio(1, audio: "audio1")
        
        playVideo(video, tipo: "m4v")
        playAudio(audioS, tipo: "m4a")
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)

        let toque = self.nodeAtPoint(touchLocation)
        
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
            
        }else if toque.name == "seta_play_4" {
            
            var novoJogo = SKScene()
            novoJogo = GameScene_Numeros(size: size)
            self.scene!.view?.presentScene(novoJogo)
            
        }else if toque.name == "seta_back" {
            
            let voltarMenu = GameScene()
            voltarMenu.size = view!.bounds.size
            voltarMenu.backgroundColor = UIColor(red: 246/255, green: 127/255, blue: 250/255, alpha: 1)
            voltarMenu.scaleMode = .ResizeFill
            
            self.scene?.view?.presentScene(voltarMenu)
            
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
            
            video = exercicio.getVideo(1, video: "video2")
            audioS = exercicio.getAudio(1, audio: "audio2")
            
            playVideo(video, tipo: "m4v")
            playAudio(audioS, tipo: "m4a")
            
        }else if toque.name == "julia" && Numero.verifica == 10{
            
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
        
//        num0 = Numero(texture: SKTexture(imageNamed: "num0"), color: nil, size: CGSize(width: 50, height: 50), numero: 0)
//        num0.zPosition = 1
//        num0.name = "exercicio1_0"
//        num0.position = CGPoint(x: 500, y: 600)
        
        num1 = Numero(texture: SKTexture(imageNamed: "num1"), color: UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 1)
        num1.zPosition = 1
        num1.name = "exercicio1_1"
        num1.position = CGPoint(x: 800, y: 600)
        
        num2 = Numero(texture: SKTexture(imageNamed: "num2"), color:  UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 2)
        num2.zPosition = 1
        num2.name = "exercicio1_2"
        num2.position = CGPoint(x: 400, y: 550)
        
        num3 = Numero(texture: SKTexture(imageNamed: "num3"), color:  UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 3)
        num3.zPosition = 1
        num3.name = "exercicio1_3"
        num3.position = CGPoint(x: 150, y: 450)
        
        num4 = Numero(texture: SKTexture(imageNamed: "num4"), color:  UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 4)
        num4.zPosition = 1
        num4.name = "exercicio1_4"
        num4.position = CGPoint(x: 920, y: 580)
        
        num5 = Numero(texture: SKTexture(imageNamed: "num5"), color:  UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 5)
        num5.zPosition = 1
        num5.name = "exercicio1_5"
        num5.position = CGPoint(x: 750, y: 530)
        
        num6 = Numero(texture: SKTexture(imageNamed: "num6"), color: UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 6)
        num6.zPosition = 1
        num6.name = "exercicio1_6"
        num6.position = CGPoint(x: 900, y: 480)
        
        num7 = Numero(texture: SKTexture(imageNamed: "num7"), color: UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 7)
        num7.zPosition = 1
        num7.name = "exercicio1_7"
        num7.position = CGPoint(x: 300, y: 500)
        
        num8 = Numero(texture: SKTexture(imageNamed: "num8"), color: UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 8)
        num8.zPosition = 1
        num8.name = "exercicio1_8"
        num8.position = CGPoint(x: 970, y: 430)
        
        num9 = Numero(texture: SKTexture(imageNamed: "num9"), color: UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 9)
        num9.zPosition = 1
        num9.name = "exercicio1_9"
        num9.position = CGPoint(x: 600, y: 530)
        
        num10 = Numero(texture: SKTexture(imageNamed: "num10"), color: UIColor.whiteColor(), size: CGSize(width: 80, height: 70), numero: 10)
        num10.zPosition = 1
        num10.name = "exercicio1_10"
        num10.position = CGPoint(x: 220, y: 580)
        
//        addChild(num0)
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
        
//        barra para posicionar os números
//        barra0 = SKSpriteNode(imageNamed: "barra")
//        barra0.zPosition = 1
//        barra0.name = "barra0"
//        barra0.size = CGSize(width: 70, height: 10)
//        barra0.position = CGPoint(x: 100, y: 650)
        
        barra1 = SKSpriteNode(imageNamed: "barra")
        barra1.zPosition = 1
        barra1.name = "barra1"
        barra1.size = CGSize(width: 70, height: 10)
        barra1.position = CGPoint(x: 180, y: 650)
        
        barra2 = SKSpriteNode(imageNamed: "barra")
        barra2.zPosition = 1
        barra2.name = "barra2"
        barra2.size = CGSize(width: 70, height: 10)
        barra2.position = CGPoint(x: 260, y: 650)
        
        barra3 = SKSpriteNode(imageNamed: "barra")
        barra3.zPosition = 1
        barra3.name = "barra3"
        barra3.size = CGSize(width: 70, height: 10)
        barra3.position = CGPoint(x: 340, y: 650)
        
        barra4 = SKSpriteNode(imageNamed: "barra")
        barra4.zPosition = 1
        barra4.name = "barra4"
        barra4.size = CGSize(width: 70, height: 10)
        barra4.position = CGPoint(x: 420, y: 650)
        
        barra5 = SKSpriteNode(imageNamed: "barra")
        barra5.zPosition = 1
        barra5.name = "barra5"
        barra5.size = CGSize(width: 70, height: 10)
        barra5.position = CGPoint(x: 500, y: 650)
        
        barra6 = SKSpriteNode(imageNamed: "barra")
        barra6.zPosition = 1
        barra6.name = "barra6"
        barra6.size = CGSize(width: 70, height: 10)
        barra6.position = CGPoint(x: 580, y: 650)
        
        barra7 = SKSpriteNode(imageNamed: "barra")
        barra7.zPosition = 1
        barra7.name = "barra7"
        barra7.size = CGSize(width: 70, height: 10)
        barra7.position = CGPoint(x: 660, y: 650)
        
        barra8 = SKSpriteNode(imageNamed: "barra")
        barra8.zPosition = 1
        barra8.name = "barra8"
        barra8.size = CGSize(width: 70, height: 10)
        barra8.position = CGPoint(x: 740, y: 650)
        
        barra9 = SKSpriteNode(imageNamed: "barra")
        barra9.zPosition = 1
        barra9.name = "barra9"
        barra9.size = CGSize(width: 70, height: 10)
        barra9.position = CGPoint(x: 820, y: 650)
        
        barra10 = SKSpriteNode(imageNamed: "barra")
        barra10.zPosition = 1
        barra10.name = "barra10"
        barra10.size = CGSize(width: 70, height: 10)
        barra10.position = CGPoint(x: 900, y: 650)
        
//        addChild(barra0)
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
        playVideo(video, tipo: "m4v")
        playAudio(audioS, tipo: "m4a")
    }
}
