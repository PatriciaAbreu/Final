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
    var personagem: SKSpriteNode!
    var chat: SKSpriteNode!
    var seta: SKSpriteNode!
    
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
        
        video = exercicio.getVideo(4, video: "video1")
        audioS = exercicio.getAudio(4, audio: "audio1")
        
        playVideo(video, tipo: "m4v")
        playAudio(audioS, tipo: "m4a")

        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocation)

        var menu: SKScene?
        
        if toque.name == "seta1" {
            chat.removeFromParent()
            seta.removeFromParent()
            
            chat = SKSpriteNode(imageNamed: "chat_verde_azul_texto_2")
            chat.zPosition = 1
            chat.name = "chat2"
            chat.position = CGPoint(x: 600, y: 400)
            chat.size = CGSize(width: 200, height: 200)
            
            seta = SKSpriteNode(imageNamed: "seta_azul")
            seta.zPosition = 1
            seta.name = "seta2"
            seta.position = CGPoint(x: 600, y: 370)
            seta.size = CGSize(width: 50, height: 50)

            movie!.view.hidden = true
            video = exercicio.getVideo(4, video: "video2")
            audioS = exercicio.getAudio(4, audio: "audio2")
            
            playVideo(video, tipo: "m4v")
            playAudio(audioS, tipo: "m4a")
            
            addChild(chat)
            addChild(seta)
            
        }else if toque.name == "seta2" {
            chat.removeFromParent()
            seta.removeFromParent()
            
            chat = SKSpriteNode(imageNamed: "chat_verde_azul_texto_3")
            chat.zPosition = 1
            chat.name = "chat3"
            chat.position = CGPoint(x: 600, y: 400)
            chat.size = CGSize(width: 200, height: 200)
            
            seta = SKSpriteNode(imageNamed: "seta_azul")
            seta.zPosition = 1
            seta.name = "seta3"
            seta.position = CGPoint(x: 600, y: 370)
            seta.size = CGSize(width: 50, height: 50)

            movie!.view.hidden = true
            video = exercicio.getVideo(4, video: "video3")
            audioS = exercicio.getAudio(4, audio: "audio3")
            
            playVideo(video, tipo: "m4v")
            playAudio(audioS, tipo: "m4a")
            
            addChild(chat)
            addChild(seta)
        
        }else if toque.name == "seta3" {
            chat.removeFromParent()
            seta.removeFromParent()
            
            chat = SKSpriteNode(imageNamed: "chat_verde_azul_texto_4")
            chat.zPosition = 1
            chat.name = "chat4"
            chat.position = CGPoint(x: 600, y: 400)
            chat.size = CGSize(width: 200, height: 200)
            
            seta = SKSpriteNode(imageNamed: "seta_azul")
            seta.zPosition = 1
            seta.name = "seta4"
            seta.position = CGPoint(x: 600, y: 370)
            seta.size = CGSize(width: 50, height: 50)

            movie!.view.hidden = true
            video = exercicio.getVideo(4, video: "video4")
            audioS = exercicio.getAudio(4, audio: "audio4")
            
            playVideo(video, tipo: "m4v")
            playAudio(audioS, tipo: "m4a")
            
            addChild(chat)
            addChild(seta)
            
        }else if toque.name == "seta4" {
            chat.removeFromParent()
            seta.removeFromParent()
            personagem.removeFromParent()
            movie!.view.hidden = true
            
            montaExercicio(0)
            
        }else if toque.name == "jogarNovamente" {
            texto.removeFromParent()
            jogarNovamente.removeFromParent()
            retornarMenu.removeFromParent()
            montaExercicio(0)
            
        }else if toque.name == "retornarMenu" {
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
        background_patinhos = SKSpriteNode(imageNamed: "cenarioPatinho.png")
        background_patinhos.zPosition = 1
        background_patinhos.name = "background_patinhos"
        background_patinhos.size = CGSize(width: 1050, height: 800)
        background_patinhos.position = CGPoint(x: 510, y: 400)
        
        personagem = SKSpriteNode(imageNamed: "Julia-1")
        personagem.zPosition = 1
        personagem.name = "Julia"
        personagem.position = CGPoint(x: 700, y: 200)
        personagem.size = CGSize(width: 150, height: 300)
        
        chat = SKSpriteNode(imageNamed: "chat_verde_azul_texto_1")
        chat.zPosition = 1
        chat.name = "chat1"
        chat.position = CGPoint(x: 600, y: 400)
        chat.size = CGSize(width: 200, height: 200)
        
        seta = SKSpriteNode(imageNamed: "seta_azul")
        seta.zPosition = 1
        seta.name = "seta1"
        seta.position = CGPoint(x: 600, y: 370)
        seta.size = CGSize(width: 50, height: 50)
        
        
        
        
        
        
        addChild(background_patinhos)
        addChild(personagem)
        addChild(chat)
        addChild(seta)
        
    }
    
    func montaExercicio(quantidadePatinhos: Int){
        
        if quantidadePatinhos == 0 {
            quantidadeDePatinhos = random(1, hi: 7)
        }else {
            quantidadeDePatinhos = quantidadePatinhos
        }
        
        
        for i in 1...quantidadeDePatinhos{

            let patinhot = SKSpriteNode()
            patinhot.texture = SKTexture(imageNamed: "patoTerra")
            patinhot.zPosition = 1
            patinhot.name = "patinho\(i)"
            patinhot.size = CGSize(width: 100, height: 100)
            patinhot.position = CGPoint(x: 1100, y: 250)
            
            patinhos.append(patinhot)
            
            addChild(patinhot)

            let duracao:Int = 4 * Int(i)
            let espera: SKAction = SKAction.waitForDuration(NSTimeInterval(duracao))
            let andaTrecho1: SKAction = SKAction.moveToX(790, duration: 1.5)
            let andaTrecho2: SKAction = SKAction.moveTo(CGPoint(x: 700, y: 200), duration: 1.5)
            let andaTrecho3: SKAction = SKAction.moveToX(-70, duration: 1.5)
            let trocaPatoTerraParaAgua = SKAction.runBlock({ () -> Void in
                patinhot.texture = SKTexture(imageNamed: "pato")
            })
            let sequencia: SKAction = SKAction.sequence([espera, andaTrecho1, andaTrecho2, trocaPatoTerraParaAgua, andaTrecho3])
            
            if i == quantidadeDePatinhos {
                patinhot.runAction(sequencia, completion: { () -> Void in
                    self.montaResposta(self.quantidadeDePatinhos)
                })
            }else{
                patinhot.runAction(sequencia)
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
            texto.fontColor = UIColor.blueColor()
            
            // comemoração estilo fogos de artifício
            let comemoracao: SKEmitterNode = SKEmitterNode(fileNamed: "Comemoracao")!
            let comemoracaoPosicao: SKSpriteNode = SKSpriteNode()
            comemoracaoPosicao.zPosition = 1
            comemoracaoPosicao.position = CGPoint(x: 800, y: 600)
            addChild(comemoracaoPosicao)
            comemoracaoPosicao.addChild(comemoracao)
            
            retornarMenu = SKSpriteNode(imageNamed: "seta_rosa")
            retornarMenu.name = "retornarMenu"
            retornarMenu.zPosition = 1
            retornarMenu.position = CGPoint(x: 600, y: 300)
            retornarMenu.size = CGSize(width: 100, height: 100)
            
            jogarNovamente = SKSpriteNode(imageNamed: "seta_back")
            jogarNovamente.name = "jogarNovamente"
            jogarNovamente.zPosition = 1
            jogarNovamente.position = CGPoint(x: 400, y: 300)
            jogarNovamente.size = CGSize(width: 100, height: 100)
            
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
