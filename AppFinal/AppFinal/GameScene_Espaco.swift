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

class GameScene_Espaco: SKScene {
    
    var background_bolas: SKSpriteNode!
    
    var movie: MPMoviePlayerController?
    var audio: AVAudioPlayer!

    var exercicio: ExercicioJSON = ExercicioJSON()
    var video: String = ""
    var audioS: String = ""

    var personagem_Paula: SKSpriteNode!
    
    var chat1: SKSpriteNode!
    
    var seta_play1: SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        
        montarScene()
        
        video = exercicio.getVideo(3, video: "video1")
        audioS = exercicio.getAudio(3, audio: "audio1")
        
        playVideo(video, tipo: "m4v")
        playAudio(audioS, tipo: "m4a")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
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
        seta_play1.name = "seta_play"
        seta_play1.size = CGSize(width: 50, height: 50)
        seta_play1.position = CGPoint(x: 740, y: 280)
        
        addChild(background_bolas)
        addChild(personagem_Paula)
        addChild(chat1)
        addChild(seta_play1)
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
