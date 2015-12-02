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
    var setaBack: SKSpriteNode!
    var sol: SKSpriteNode!
    
    var patinho: SKSpriteNode!
    var patinhos: [SKSpriteNode] = []
    let texto: SKLabelNode = SKLabelNode(fontNamed: "Arial")
    var quantidadeDePatinhos: Int!
    var numeroDigitado: Int!
    let teclado = Teclado()
    var jogarNovamente: SKSpriteNode!
    var retornarMenu: SKSpriteNode!
    
    var comemoracao: SKEmitterNode!
    var comemoracaoPosicao: SKSpriteNode!
    
    var videoSprite = SKVideoNode()
    var audio: AVAudioPlayer!
    
    var exercicio: ExercicioJSON = ExercicioJSON()
    var video: String = ""
    var audioS: String = ""
    
    
    override func didMoveToView(view: SKView) {
        
        montaScene()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocation)
        
        var menu: SKScene?
        
        if toque.name == "seta1" {
            chat.removeFromParent()
            seta.removeFromParent()
            videoSprite.removeFromParent()
            
            chat = SKSpriteNode(imageNamed: "chat_verde_azul_texto_2")
            chat.zPosition = 2
            chat.name = "chat2"
            chat.position = CGPoint(x: 700, y: 400)
            chat.size = CGSize(width: 200, height: 200)
            
            seta = SKSpriteNode(imageNamed: "seta_verde_azul")
            seta.zPosition = 2
            seta.name = "seta2"
            seta.position = CGPoint(x: 700, y: 370)
            seta.size = CGSize(width: 50, height: 50)
            
            video = exercicio.getVideo(3, video: "video2")
            audioS = exercicio.getAudio(3, audio: "audio2")
            
            playAudio(audioS, tipo: "m4a")
            playVideo(video, tipo: "mp4")
            
            addChild(chat)
            addChild(seta)
            
        }else if toque.name == "seta2" {
            chat.removeFromParent()
            seta.removeFromParent()
            videoSprite.removeFromParent()
            
            chat = SKSpriteNode(imageNamed: "chat_verde_azul_texto_3")
            chat.zPosition = 2
            chat.name = "chat3"
            chat.position = CGPoint(x: 700, y: 400)
            chat.size = CGSize(width: 200, height: 200)
            
            seta = SKSpriteNode(imageNamed: "seta_verde_azul")
            seta.zPosition = 2
            seta.name = "seta3"
            seta.position = CGPoint(x: 700, y: 370)
            seta.size = CGSize(width: 50, height: 50)
            
            video = exercicio.getVideo(3, video: "video3")
            audioS = exercicio.getAudio(3, audio: "audio3")
            
            playAudio(audioS, tipo: "m4a")
            playVideo(video, tipo: "mp4")
            
            addChild(chat)
            addChild(seta)
            
        }else if toque.name == "seta3" {
            chat.removeFromParent()
            seta.removeFromParent()
            videoSprite.removeFromParent()
            
            chat = SKSpriteNode(imageNamed: "chat_verde_azul_texto_4")
            chat.zPosition = 2
            chat.name = "chat4"
            chat.position = CGPoint(x: 700, y: 400)
            chat.size = CGSize(width: 200, height: 200)
            
            seta = SKSpriteNode(imageNamed: "seta_verde_azul")
            seta.zPosition = 2
            seta.name = "seta4"
            seta.position = CGPoint(x: 700, y: 370)
            seta.size = CGSize(width: 50, height: 50)
            
            video = exercicio.getVideo(3, video: "video4")
            audioS = exercicio.getAudio(3, audio: "audio4")
            
            playAudio(audioS, tipo: "m4a")
            playVideo(video, tipo: "mp4")
            
            addChild(chat)
            addChild(seta)
            
        }else if toque.name == "seta4" {
            chat.removeFromParent()
            seta.removeFromParent()
            personagem.removeFromParent()
            videoSprite.removeFromParent()
            sol.removeFromParent()
            background_patinhos.removeFromParent()
            
            background_patinhos = SKSpriteNode(imageNamed: "cenarioPatinhoSol")
            background_patinhos.zPosition = 2
            background_patinhos.name = "background_patinhos_sol"
            background_patinhos.size = CGSize(width: 1424, height: 800)
            background_patinhos.position = CGPoint(x: 670, y: 400)
            
            sol = SKSpriteNode(imageNamed: "sol")
            sol.zPosition = 2
            sol.name = "sol"
            sol.size = CGSize(width: 290, height: 290)
            sol.position = CGPoint(x: 178, y: 565)

            addChild(background_patinhos)
            addChild(sol)
            montaExercicio(0)
            
        }else if toque.name == "jogarNovamente" {
            comemoracaoPosicao.removeFromParent()
            
            jogarNovamente.removeFromParent()
            retornarMenu.removeFromParent()
            texto.removeFromParent()
            background_patinhos.removeFromParent()
            videoSprite.removeFromParent()
            
            background_patinhos = SKSpriteNode(imageNamed: "cenarioPatinhoVazio")
            background_patinhos.zPosition = 2
            background_patinhos.name = "background_patinhos_sol"
            background_patinhos.size = CGSize(width: 1424, height: 800)
            background_patinhos.position = CGPoint(x: 670, y: 400)
            
            personagem = SKSpriteNode(imageNamed: "Julia")
            personagem.zPosition = 2
            personagem.name = "Julia"
            personagem.position = CGPoint(x: 800, y: 200)
            personagem.size = CGSize(width: 150, height: 300)
            
            chat = SKSpriteNode(imageNamed: "chat_verde_azul_texto_6")
            chat.zPosition = 2
            chat.name = "chat5"
            chat.position = CGPoint(x: 700, y: 400)
            chat.size = CGSize(width: 200, height: 200)
            
            seta = SKSpriteNode(imageNamed: "seta_verde_azul")
            seta.zPosition = 2
            seta.name = "seta5"
            seta.position = CGPoint(x: 700, y: 370)
            seta.size = CGSize(width: 50, height: 50)
            
            audioS = exercicio.getAudio(3, audio: "audio6")
            playAudio(audioS, tipo: "m4a")
            
            video = exercicio.getVideo(3, video: "video6")
            playVideo(video, tipo: "mp4")
            
            addChild(background_patinhos)
            addChild(personagem)
            addChild(chat)
            addChild(seta)
            
        }else if toque.name == "retornarMenu" {
            
            menu = MenuJogo1(size: size)
            self.scene?.view?.presentScene(menu)
            
        }else if toque.name == "tentarNovamente" {
            
            jogarNovamente.removeFromParent()
            texto.removeFromParent()
            personagem.removeFromParent()
            chat.removeFromParent()
            background_patinhos.removeFromParent()
            
            background_patinhos = SKSpriteNode(imageNamed: "cenarioPatinhoSol")
            background_patinhos.zPosition = 2
            background_patinhos.name = "background_patinhos"
            background_patinhos.size = CGSize(width: 1424, height: 800)
            background_patinhos.position = CGPoint(x: 670, y: 400)
            
            addChild(background_patinhos)
            montaExercicio(quantidadeDePatinhos)
            
        }else if toque.name == "seta5" {
            
            personagem.removeFromParent()
            chat.removeFromParent()
            seta.removeFromParent()
            background_patinhos.removeFromParent()
            
            background_patinhos = SKSpriteNode(imageNamed: "cenarioPatinhoSol")
            background_patinhos.zPosition = 2
            background_patinhos.name = "background_patinhos_sol"
            background_patinhos.size = CGSize(width: 1424, height: 800)
            background_patinhos.position = CGPoint(x: 670, y: 400)
            
            sol = SKSpriteNode(imageNamed: "sol")
            sol.zPosition = 2
            sol.name = "sol"
            sol.size = CGSize(width: 290, height: 290)
            sol.position = CGPoint(x: 178, y: 565)
            
            addChild(background_patinhos)
            addChild(sol)
            
            montaExercicio(0)
            
        }else if toque.name == "setaVoltar" {
            
            menu = MenuJogo1(size: size)
            self.scene?.view?.presentScene(menu)
        }
        
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func montaScene(){
        
        //posiciona e adiciona o plano de fundo
        background_patinhos = SKSpriteNode(imageNamed: "cenarioPatinhoVazio")
        background_patinhos.zPosition = 2
        background_patinhos.name = "background_patinhos"
        background_patinhos.size = CGSize(width: 1424, height: 800)
        background_patinhos.position = CGPoint(x: 670, y: 400)
        
        sol = SKSpriteNode(imageNamed: "sol")
        sol.zPosition = 2
        sol.name = "sol"
        sol.size = CGSize(width: 290, height: 290)
        sol.position = CGPoint(x: 178, y: 565)
        
        personagem = SKSpriteNode(imageNamed: "Julia")
        personagem.zPosition = 2
        personagem.name = "Julia"
        personagem.position = CGPoint(x: 800, y: 200)
        personagem.size = CGSize(width: 150, height: 300)
        
        chat = SKSpriteNode(imageNamed: "chat_verde_azul_texto_1")
        chat.zPosition = 2
        chat.name = "chat1"
        chat.position = CGPoint(x: 700, y: 400)
        chat.size = CGSize(width: 200, height: 200)
        
        seta = SKSpriteNode(imageNamed: "seta_verde_azul")
        seta.zPosition = 2
        seta.name = "seta1"
        seta.position = CGPoint(x: 700, y: 370)
        seta.size = CGSize(width: 50, height: 50)
        
        setaBack = SKSpriteNode(imageNamed: "seta_verde_azul_voltar")
        setaBack.zPosition = 2
        setaBack.name = "setaVoltar"
        setaBack.position = CGPoint(x: 50, y: 50)
        setaBack.size = CGSize(width: 50, height: 50)
        
        audioS = exercicio.getAudio(3, audio: "audio1")
        playAudio(audioS, tipo: "m4a")
        
        video = exercicio.getVideo(3, video: "video1")
        playVideo(video, tipo: "mp4")
        
        addChild(background_patinhos)
        addChild(sol)
        addChild(personagem)
        addChild(chat)
        addChild(seta)
        addChild(setaBack)
        
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
            patinhot.zPosition = 2
            patinhot.name = "patinho\(i)"
            patinhot.size = CGSize(width: 100, height: 100)
            patinhot.position = CGPoint(x: 1100, y: 230)
            
            patinhos.append(patinhot)
            
            addChild(patinhot)
            
            let duracao:Int = 4 * Int(i)
            let espera: SKAction = SKAction.waitForDuration(NSTimeInterval(duracao))
            let andaTrecho1: SKAction = SKAction.moveToX(1000, duration: 1.5)
            let andaTrecho2: SKAction = SKAction.moveTo(CGPoint(x: 800, y: 180), duration: 1.5)
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
        background_patinhos.removeFromParent()
        
        background_patinhos = SKSpriteNode(imageNamed: "cenarioPatinhoVazio")
        background_patinhos.zPosition = 2
        background_patinhos.name = "background_patinhos"
        background_patinhos.size = CGSize(width: 1424, height: 800)
        background_patinhos.position = CGPoint(x: 670, y: 400)

        addChild(background_patinhos)
        
        teclado.patinho = self
        addChild(teclado)
        
        teclado.position = CGPoint(x: CGRectGetMidX((self.view?.bounds)!), y: CGRectGetMinY((self.view?.bounds)!) + teclado.frame.height/2)
        
        texto.position = CGPoint(x: 500, y: 300)
        texto.zPosition = 999999
        texto.fontSize = 40
        texto.color = UIColor.blackColor()
        texto.text = "Resposta"
        addChild(texto)
        
        personagem = SKSpriteNode(imageNamed: "Julia")
        personagem.zPosition = 2
        personagem.name = "Julia"
        personagem.position = CGPoint(x: 900, y: 200)
        personagem.size = CGSize(width: 150, height: 300)
        
        chat = SKSpriteNode(imageNamed: "chat_verde_azul_texto_7")
        chat.zPosition = 2
        chat.name = "chat1"
        chat.position = CGPoint(x: 800, y: 400)
        chat.size = CGSize(width: 200, height: 200)
        
        audioS = exercicio.getAudio(3, audio: "audio7")
        playAudio(audioS, tipo: "m4a")
        
        video = exercicio.getVideo(3, video: "video5")
        playVideo(video, tipo: "mp4")
        
        addChild(personagem)
        addChild(chat)
        
    }
    
    func numeroTocado(numero: String){
        if numero == "DELETE" {
            self.texto.text = "RESPOSTA"
            
            video = exercicio.getVideo(3, video: "video2")
            audioS = exercicio.getAudio(3, audio: "audio2")
            
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
        chat.removeFromParent()
        texto.removeFromParent()
        videoSprite.removeFromParent()
        
        if quantidadeDePatinhos == numeroDigitado {
            
            // comemoração estilo fogos de artifício
            comemoracao = SKEmitterNode(fileNamed: "Comemoracao")!
            comemoracaoPosicao = SKSpriteNode()
            comemoracaoPosicao.zPosition = 3
            comemoracaoPosicao.position = CGPoint(x: 800, y: 600)
            addChild(comemoracaoPosicao)
            comemoracaoPosicao.addChild(comemoracao)
            
            retornarMenu = SKSpriteNode(imageNamed: "seta_verde_azul")
            retornarMenu.name = "retornarMenu"
            retornarMenu.zPosition = 3
            retornarMenu.position = CGPoint(x: 600, y: 500)
            retornarMenu.size = CGSize(width: 100, height: 100)
            
            jogarNovamente = SKSpriteNode(imageNamed: "seta_verde_azul_voltar")
            jogarNovamente.name = "jogarNovamente"
            jogarNovamente.zPosition = 3
            jogarNovamente.position = CGPoint(x: 400, y: 500)
            jogarNovamente.size = CGSize(width: 100, height: 100)
            
            chat = SKSpriteNode(imageNamed: "chat_verde_azul_texto_8")
            chat.zPosition = 2
            chat.name = "chat1"
            chat.position = CGPoint(x: 800, y: 400)
            chat.size = CGSize(width: 200, height: 200)

            audioS = exercicio.getAudio(3, audio: "audio9")
            playAudio(audioS, tipo: "m4a")
            
            video = exercicio.getVideo(3, video: "video9")
            playVideo(video, tipo: "m4v")
            
            addChild(jogarNovamente)
            addChild(retornarMenu)
            addChild(chat)
            
        }else{
            texto.text = "Acho que você errou. Tente novamente!"
            jogarNovamente = SKSpriteNode(imageNamed: "seta_verde_azul")
            jogarNovamente.name = "tentarNovamente"
            jogarNovamente.zPosition = 2
            jogarNovamente.position = CGPoint(x: 500, y: 400)
            jogarNovamente.size = CGSize(width: 100, height: 100)
            
            chat = SKSpriteNode(imageNamed: "chat_verde_azul_texto_9")
            chat.zPosition = 2
            chat.name = "chat1"
            chat.position = CGPoint(x: 800, y: 400)
            chat.size = CGSize(width: 200, height: 200)

            audioS = exercicio.getAudio(3, audio: "audio8")
            playAudio(audioS, tipo: "m4a")
            
            video = exercicio.getVideo(3, video: "video8")
            playVideo(video, tipo: "m4v")
            
            addChild(jogarNovamente)
            addChild(chat)
        }
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
        videoSprite.position = CGPoint(x: 178, y: 565)
        videoSprite.size = CGSize(width: 500, height: 300)
        
        
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
