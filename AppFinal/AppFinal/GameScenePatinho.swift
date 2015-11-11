//
//  GameScenePatinho.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 17/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit
import MediaPlayer
import AVFoundation

class GameScenePatinho: SKScene {
    
    var background_patinhos: SKSpriteNode!
    var patinho: SKSpriteNode!
    var patinhos: [SKSpriteNode] = []
    let texto: SKLabelNode = SKLabelNode(fontNamed: "Arial")
    var quantidadeDePatinhos: Int!
    var numeroDigitado: Int!
    let teclado = Teclado()
    var jogarNovamente: SKSpriteNode!
    var retornarMenu: SKSpriteNode!
    
    var movie: MPMoviePlayerController?
    var audio: AVAudioPlayer!
    
    var exercicio: ExercicioJSON = ExercicioJSON()
    var video: String = ""
    var audioS: String = ""

    
    override func didMoveToView(view: SKView) {
        montaScene()
        montaExercicio(0)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocation)

        var menu: SKScene?
        if toque.name == "jogarNovamente"{
            texto.removeFromParent()
            jogarNovamente.removeFromParent()
            retornarMenu.removeFromParent()
            montaExercicio(0)
            
        }else if toque.name == "retornarMenu"{
            menu = GameScene(size: size)
            self.scene?.view?.presentScene(menu)
            
        }else if toque.name == "tentarNovamente" {
            jogarNovamente.removeFromParent()
            texto.removeFromParent()
            montaExercicio(quantidadeDePatinhos)
        }
        
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func montaScene(){
        
        //posiciona e adiciona o plano de fundo
        background_patinhos = SKSpriteNode(imageNamed: "lake")
        background_patinhos.zPosition = 1
        background_patinhos.name = "background_patinhos"
        background_patinhos.size = CGSize(width: 1050, height: 800)
        background_patinhos.position = CGPoint(x: 510, y: 400)
        
        addChild(background_patinhos)
        
    }
    
    func montaExercicio(quantidadePatinhos: Int){
        
        if quantidadePatinhos == 0 {
            quantidadeDePatinhos = random(1, hi: 7)
        }else {
            quantidadeDePatinhos = quantidadePatinhos
        }
        
        
        for i in 1...quantidadeDePatinhos{
            
            patinho = SKSpriteNode(imageNamed: "pato")
            patinho.zPosition = 1
            patinho.name = "patinho\(i)"
            patinho.size = CGSize(width: 100, height: 100)
            patinho.position = CGPoint(x: 1100, y: 250)
            
            patinhos.append(patinho)
            
            addChild(patinho)

            let duracao:Int = 4 * Int(i)
            let espera: SKAction = SKAction.waitForDuration(NSTimeInterval(duracao))
            let andaTrecho1: SKAction = SKAction.moveToX(600, duration: 1.5)
            let andaTrecho2: SKAction = SKAction.moveTo(CGPoint(x: 550, y: 200), duration: 1.5)
            let andaTrecho3: SKAction = SKAction.moveToX(-70, duration: 1.5)
            let sequencia: SKAction = SKAction.sequence([espera,andaTrecho1, andaTrecho2, andaTrecho3])
            
            if i == quantidadeDePatinhos {
                patinho.runAction(sequencia, completion: { () -> Void in
                    self.montaResposta(self.quantidadeDePatinhos)
                })
            }else{
                patinho.runAction(sequencia)
            }
        }
    }
    
    func montaResposta(resposta: Int){
        
        for i in 0...patinhos.count-1 {
            patinhos[i].removeFromParent()
        }
        
        teclado.patinho = self
        addChild(teclado)
        
        teclado.position = CGPoint(x: CGRectGetMidX((self.view?.bounds)!), y: CGRectGetMinY((self.view?.bounds)!) + teclado.frame.height/2)

        self.texto.position = CGPoint(x: 500, y: 500)
        self.texto.zPosition = 1
        self.texto.fontSize = 50

        self.texto.text = "Quantos patinhos passaram?"
        self.texto.fontColor = UIColor.blackColor()
        addChild(self.texto)
        
    }
    
    func numeroTocado(numero: String){
        if numero == "DELETE" {
            self.texto.text = "RESPOSTA"
            movie?.view.hidden = true
            video = exercicio.getVideo(1, video: "video2")
            audioS = exercicio.getAudio(1, audio: "audio2")
            
            playVideo(video, tipo: "mp4")
            playAudio(audioS, tipo: "m4a")
        }else if numero == "ENTER" {
            verificaResposta(numero)
        }else {
            self.texto.text = numero
            numeroDigitado = Int(numero)
        }
        
    }
    
    func verificaResposta(numero: String){
        
        teclado.removeFromParent()
        
        if quantidadeDePatinhos == numeroDigitado {
            texto.text = "PARABENS!!"
            
            jogarNovamente = SKSpriteNode(imageNamed: "seta_rosa")
            jogarNovamente.name = "jogarNovamente"
            jogarNovamente.zPosition = 1
            jogarNovamente.position = CGPoint(x: 600, y: 300)
            jogarNovamente.size = CGSize(width: 100, height: 100)
            
            retornarMenu = SKSpriteNode(imageNamed: "seta_back")
            retornarMenu.name = "retornarMenu"
            retornarMenu.zPosition = 1
            retornarMenu.position = CGPoint(x: 400, y: 300)
            retornarMenu.size = CGSize(width: 100, height: 100)
            
            addChild(jogarNovamente)
            addChild(retornarMenu)
            
        }else{
            texto.text = "Acho que você errou. Tente novamente!"
            jogarNovamente = SKSpriteNode(imageNamed: "seta_rosa")
            jogarNovamente.name = "tentarNovamente"
            jogarNovamente.zPosition = 1
            jogarNovamente.position = CGPoint(x: 500, y: 400)
            jogarNovamente.size = CGSize(width: 100, height: 100)

            addChild(jogarNovamente)
            
        }
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
