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
    var seta_play: SKSpriteNode!
    
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
    
    override func didMoveToView(view: SKView) {

        montarScene()
        
        var exercicio: ExercicioJSON = ExercicioJSON()
        
        var audio = exercicio.getAudio(1)
        
        playVideo("teste", tipo: "m4v")
        playAudio(audio, tipo: "m4a")
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        let touch = touches.first as! UITouch
        let touchLocation = touch.locationInNode(self)
        
        var toque = self.nodeAtPoint(touchLocation)
        
        if toque.name == "seta_play" {
            dialogo.hidden = true
            seta_play.hidden = true

            personagem_Caio.runAction(SKAction.moveToX(1100, duration: 0.5))
            
            montarExercicio()
        }
        
        if num3.name == "fim" && toque.name == "julia" {
            println(num3)
            brinquedo1.removeFromParent()
            personagem_Julia.runAction(SKAction.scaleTo(2, duration: 0.3))
            num3.name = "exercicio1_3"
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
//    func montarMenu() {
//        //posicionando os menus na tela
////        menu_numeros = SKSpriteNode(imageNamed: "menuAzul_Numeros.png")
////        menu_numeros.zPosition = 1
////        menu_numeros.position = CGPoint(x: 300, y: 530)
////        menu_numeros.name = "menu_numeros"
//        
//        self.backgroundColor = UIColor.whiteColor()
//
//        menu_ano1 = SKSpriteNode(imageNamed: "menuRoxo_Ano1")
//        menu_ano1.zPosition = 1
//        menu_ano1.position = CGPoint(x: 300, y: 500)
//        menu_ano1.name = "menu_ano1"
//        
//        menu_ano2 = SKSpriteNode(imageNamed: "menuRosa_Ano2")
//        menu_ano2.zPosition = 1
//        menu_ano2.position = CGPoint(x: 700, y: 300)
//        menu_ano2.name = "menu_ano2"
//        
//        addChild(menu_ano1)
//        addChild(menu_ano2)
////        let animacao = SKAction.rotateToAngle(90, duration: 0.3)
////        menu_numeros.runAction(animacao)
//    }
    
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
        seta_play.name = "seta_play"
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
        
        num0 = Numero(texture: SKTexture(imageNamed: "num0"), color: nil, size: CGSize(width: 50, height: 50))
        num0.zPosition = 1
        num0.name = "exercicio1_0"
        num0.position = CGPoint(x: 950, y: 700)
        
        num1 = Numero(texture: SKTexture(imageNamed: "num1"), color: nil, size: CGSize(width: 50, height: 50))
        num1.zPosition = 1
        num1.name = "exercicio1_1"
        num1.position = CGPoint(x: 800, y: 600)
        
        num2 = Numero(texture: SKTexture(imageNamed: "num2"), color: nil, size: CGSize(width: 50, height: 50))
        num2.zPosition = 1
        num2.name = "exercicio1_2"
        num2.position = CGPoint(x: 890, y: 650)
        
        num3 = Numero(texture: SKTexture(imageNamed: "num3"), color: nil, size: CGSize(width: 50, height: 50))
        num3.zPosition = 1
        num3.name = "exercicio1_3"
        num3.position = CGPoint(x: 920, y: 580)
        
        addChild(num0)
        addChild(num1)
        addChild(num2)
        addChild(num3)
    }
}
