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

class GameSceneEsconde: SKScene {
    
    var gameController: GameViewController!
    
    var background_numeros: SKSpriteNode!
    var vaso: SKSpriteNode!
    var casaCachorro: SKSpriteNode!
    var bola: SKSpriteNode!
    
    var personagem_Caio: SKSpriteNode!
    var personagem_Julia: SKSpriteNode!
    
    var dialogo: SKSpriteNode!
    var dialogo2: SKSpriteNode!
    
    var seta_play: SKSpriteNode!
    var seta_play_2: SKSpriteNode!
    var seta_play_3: SKSpriteNode!
    var seta_play_4: SKSpriteNode!
    var seta_back: SKSpriteNode!
    
    var posicao: Int!
    
    var videoSprite: SKVideoNode!
    var audio: AVAudioPlayer!
    
    var numeros : [Numero] = []
    
    var posicoes: [SKSpriteNode] = []
    
    var barras: [SKSpriteNode] = []
    
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
            dialogo2.zPosition = 2
            dialogo2.name = "dialogo"
            dialogo2.size = CGSize(width: 200, height: 200)
            dialogo2.position = CGPoint(x: 780, y: 400)
            
            seta_play_2 = SKSpriteNode(imageNamed: "seta_azul")
            seta_play_2.zPosition = 2
            seta_play_2.name = "seta_play_2"
            seta_play_2.size = CGSize(width: 50, height: 50)
            seta_play_2.position = CGPoint(x: 780, y: 380)
            
            videoSprite.removeFromParent()
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
            videoSprite.removeFromParent()
            
            montarExercicio()
            
        }else if toque.name == "seta_play_3" {
            
            dialogo2.removeFromParent()
            seta_play_3.removeFromParent()
            background_numeros.removeFromParent()
            
            personagem_Caio.runAction(SKAction.moveToX(1100, duration: 0.5))
            videoSprite.removeFromParent()
            
            //posiciona e adiciona o plano de fundo
            background_numeros = SKSpriteNode(imageNamed: "cenarioEsconde")
            background_numeros.zPosition = 2
            background_numeros.name = "background_numeros"
            background_numeros.size = CGSize(width: 1100, height: 800)
            background_numeros.position = CGPoint(x: 550, y: 400)
            
            addChild(background_numeros)
            
        }else if toque.name == "seta_play_4" {
            
            videoSprite.removeFromParent()
            var novoJogo = SKScene()
            novoJogo = MenuJogo1(size: size)
            self.scene!.view?.presentScene(novoJogo)
            
        }else if toque.name == "seta_back" {
            
            videoSprite.removeFromParent()
            var voltarMenu = SKScene()
            voltarMenu = MenuJogo1(size: size)
            self.scene!.view?.presentScene(voltarMenu)
            
        }else if toque.name == "julia" && controle != 10 {
            background_numeros.removeFromParent()
            
            //posiciona e adiciona o plano de fundo
            background_numeros = SKSpriteNode(imageNamed: "cenarioEscondeVazio")
            background_numeros.zPosition = 2
            background_numeros.name = "background_numeros"
            background_numeros.size = CGSize(width: 1100, height: 800)
            background_numeros.position = CGPoint(x: 550, y: 400)
            
            addChild(background_numeros)
            
            personagem_Caio.runAction(SKAction.moveToX(950, duration: 0.5))
            
            dialogo2 = SKSpriteNode(imageNamed: "chat_azul_texto_2")
            dialogo2.zPosition = 2
            dialogo2.name = "dialogo"
            dialogo2.size = CGSize(width: 200, height: 200)
            dialogo2.position = CGPoint(x: 900, y: 400)
            
            seta_play_3 = SKSpriteNode(imageNamed: "seta_azul")
            seta_play_3.zPosition = 2
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
            background_numeros.removeFromParent()
            
            if posicao == 1 {
                vaso.removeFromParent()
            }else if posicao == 2 {
                casaCachorro.removeFromParent()
            }else{
                bola.removeFromParent()
            }
            
            personagem_Julia.runAction(SKAction.scaleTo(2, duration: 0.3))
            numeros[3].name = "exercicio1_3"
            
            personagem_Caio.runAction(SKAction.moveToX(950, duration: 0.5))
            
            background_numeros = SKSpriteNode(imageNamed: "cenarioEscondeVazio")
            background_numeros.zPosition = 2
            background_numeros.name = "background_numeros"
            background_numeros.size = CGSize(width: 1100, height: 800)
            background_numeros.position = CGPoint(x: 550, y: 400)

            dialogo2 = SKSpriteNode(imageNamed: "chat_azul_texto_4")
            dialogo2.zPosition = 2
            dialogo2.name = "dialogo"
            dialogo2.size = CGSize(width: 200, height: 200)
            dialogo2.position = CGPoint(x: 900, y: 400)
            
            seta_play_4 = SKSpriteNode(imageNamed: "seta_azul")
            seta_play_4.zPosition = 2
            seta_play_4.name = "seta_play_4"
            seta_play_4.size = CGSize(width: 50, height: 50)
            seta_play_4.position = CGPoint(x: 900, y: 380)
            
            addChild(background_numeros)
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
        background_numeros = SKSpriteNode(imageNamed: "cenarioEscondeVazio")
        background_numeros.zPosition = 2
        background_numeros.name = "background_numeros"
        background_numeros.size = CGSize(width: 1100, height: 800)
        background_numeros.position = CGPoint(x: 550, y: 400)
        
        //posiciona e adiciona personagens
        personagem_Caio = SKSpriteNode(imageNamed: "Caio")
        personagem_Caio.zPosition = 5
        personagem_Caio.name = "caio"
        personagem_Caio.size = CGSize(width: 150, height: 300)
        personagem_Caio.position = CGPoint(x: 850, y: 150)
        
        //posiciona e adiciona dialogo
        dialogo = SKSpriteNode(imageNamed: "chat_azul_texto")
        dialogo.zPosition = 2
        dialogo.name = "dialogo"
        dialogo.size = CGSize(width: 200, height: 200)
        dialogo.position = CGPoint(x: 780, y: 400)
        
        //posiona e adiciona setas
        seta_play = SKSpriteNode(imageNamed: "seta_azul")
        seta_play.zPosition = 2
        seta_play.name = "seta_play_1"
        seta_play.size = CGSize(width: 50, height: 50)
        seta_play.position = CGPoint(x: 780, y: 380)
        
        seta_back = SKSpriteNode(imageNamed: "seta_back")
        seta_back.zPosition = 4
        seta_back.name = "seta_back"
        seta_back.size = CGSize(width: 50, height: 50)
        seta_back.position = CGPoint(x: 50, y: 50)
        
        addChild(background_numeros)
        addChild(personagem_Caio)
        addChild(dialogo)
        addChild(seta_play)
        addChild(seta_back)
        
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
        videoSprite.position = CGPoint(x: 100, y: 610)
        videoSprite.size = CGSize(width: 350, height: 290)
        
        
        addChild(videoSprite)
        videoSprite.play()

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
        
        background_numeros.removeFromParent()
        
        //posiciona e adiciona o plano de fundo
        background_numeros = SKSpriteNode(imageNamed: "cenarioEsconde")
        background_numeros.zPosition = 2
        background_numeros.name = "background_numeros"
        background_numeros.size = CGSize(width: 1100, height: 800)
        background_numeros.position = CGPoint(x: 550, y: 400)
        
        addChild(background_numeros)
        
        // posiciona Julia
        
        posicao = random(1, hi: 3)
        
        if posicao == 1 {
            vaso = SKSpriteNode(imageNamed: "vaso")
            vaso.zPosition = 4
            vaso.name = "vaso"
            vaso.size = CGSize(width: 170, height: 430)
            vaso.position = CGPoint(x: 80, y: 220)
            
            personagem_Julia = SKSpriteNode(imageNamed: "Julia")
            personagem_Julia.zPosition = 3
            personagem_Julia.name = "julia"
            personagem_Julia.size = CGSize(width: 150, height: 200)
            personagem_Julia.position = CGPoint(x: 110, y: 220)

            addChild(vaso)
            addChild(personagem_Julia)
            
        }else if posicao == 2 {
            casaCachorro = SKSpriteNode(imageNamed: "casaCachorro")
            casaCachorro.zPosition = 4
            casaCachorro.name = "casaCachorro"
            casaCachorro.size = CGSize(width: 200, height: 200)
            casaCachorro.position = CGPoint(x: 630, y: 250)
            
            personagem_Julia = SKSpriteNode(imageNamed: "Julia")
            personagem_Julia.zPosition = 3
            personagem_Julia.name = "julia"
            personagem_Julia.size = CGSize(width: 150, height: 200)
            personagem_Julia.position = CGPoint(x: 690, y: 250)

            addChild(casaCachorro)
            addChild(personagem_Julia)
            
        } else {
            bola = SKSpriteNode(imageNamed: "bola")
            bola.zPosition = 4
            bola.name = "bola"
            bola.size = CGSize(width: 200, height: 220)
            bola.position = CGPoint(x: 800, y: 100)
            
            personagem_Julia = SKSpriteNode(imageNamed: "Julia")
            personagem_Julia.zPosition = 3
            personagem_Julia.name = "julia"
            personagem_Julia.size = CGSize(width: 150, height: 200)
            personagem_Julia.position = CGPoint(x: 740, y: 100)
            
            addChild(bola)
            addChild(personagem_Julia)
        }
        
        // gera números de 1 a 10
        for i in 1...10{
            let num = Numero(texture: SKTexture(imageNamed: "num\(i)"), color: UIColor.whiteColor(), size: CGSize(width: 50, height: 50), numero: 1, exercicio: 1)
            num.zPosition = 5
            num.name = "exercicio1_\(i)"
            var test = false
            repeat{
                num.position = CGPoint(x: random(30, hi: 970), y: random(30, hi: 500))
                test = false
                var j = 0
                while j < numeros.count && !test{
                    test = num.intersectsNode(numeros[j])
                    j++
                }
            } while test
            
            numeros.append(num)
            addChild(num)
        }
        
        var distancia = 550
        
        // gera SKSpriteNodes transparentes para posicionar os números
        for i in 1...5 {
            let posi = SKSpriteNode()
            posi.color = UIColor.clearColor()
            posi.position = CGPoint(x: distancia, y: 700)
            posi.size = CGSize(width: 100, height: 70)
            posi.zPosition = 3
            posi.name = "posi_num\(i)"
            
            distancia = distancia + 100
            
            posicoes.append(posi)
            addChild(posi)
        }
        
        distancia = 550
        
        for i in 6...10 {
            let posi = SKSpriteNode()
            posi.color = UIColor.clearColor()
            posi.position = CGPoint(x: distancia, y: 600)
            posi.size = CGSize(width: 100, height: 70)
            posi.zPosition = 3
            posi.name = "posi_num\(i)"
            
            distancia = distancia + 100
            
            posicoes.append(posi)
            addChild(posi)
        }
        
        var distaciaXBarra = 550
        
        // gera as barras para posicionar os números
        for i in 1...5 {
            let barra = SKSpriteNode(imageNamed: "placa")
            barra.zPosition = 3
            barra.size = CGSize(width: 100, height: 70)
            barra.position = CGPoint(x: distaciaXBarra, y: 700)
            barra.name = "barra\(i)"
            
            distaciaXBarra = distaciaXBarra + 100
            
            barras.append(barra)
            addChild(barra)
            
        }
        
        distaciaXBarra = 550
        
        for i in 6...10 {
            let barra = SKSpriteNode(imageNamed: "placa")
            barra.zPosition = 3
            barra.size = CGSize(width: 100, height: 70)
            barra.position = CGPoint(x: distaciaXBarra, y: 600)
            barra.name = "barra\(i)"
            
            distaciaXBarra = distaciaXBarra + 100
            
            barras.append(barra)
            addChild(barra)
   
        }
        
    }
    
    //função para fazer o boneco aparecer avisando que agora pode procurar a Julia
    func procurarJulia(){
        
        background_numeros.removeFromParent()
        
        //posiciona e adiciona o plano de fundo
        background_numeros = SKSpriteNode(imageNamed: "cenarioEscondeVazio")
        background_numeros.zPosition = 2
        background_numeros.name = "background_numeros"
        background_numeros.size = CGSize(width: 1100, height: 800)
        background_numeros.position = CGPoint(x: 550, y: 400)
        
        addChild(background_numeros)
        
        personagem_Caio.runAction(SKAction.moveToX(950, duration: 0.5))
        
        dialogo2 = SKSpriteNode(imageNamed: "chat_azul_texto_3")
        dialogo2.zPosition = 2
        dialogo2.name = "dialogo"
        dialogo2.size = CGSize(width: 200, height: 200)
        dialogo2.position = CGPoint(x: 900, y: 400)
        
        seta_play_3 = SKSpriteNode(imageNamed: "seta_azul")
        seta_play_3.zPosition = 2
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
        
        if numero.intersectsNode(posicoes[0]) {
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posicoes[0].position.x, y: posicoes[0].position.y), duration: 0.2))
            print("entrou1")
            
        }else if numero.intersectsNode(posicoes[1]){
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posicoes[1].position.x, y: posicoes[1].position.y), duration: 0.2))
            print("entrou2")
        }else if numero.intersectsNode(posicoes[2]){
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posicoes[2].position.x, y: posicoes[2].position.y), duration: 0.2))
            print("entrou3")
            
        }else if numero.intersectsNode(posicoes[3]){
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posicoes[3].position.x, y: posicoes[3].position.y), duration: 0.2))
            print("entrou4")
            
        }else if numero.intersectsNode(posicoes[4]){
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posicoes[4].position.x, y: posicoes[4].position.y), duration: 0.2))
            print("entrou5")
            
        }else if numero.intersectsNode(posicoes[5]){
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posicoes[5].position.x, y: posicoes[5].position.y), duration: 0.2))
            print("entrou6")
            
        }else if numero.intersectsNode(posicoes[6]){
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posicoes[6].position.x, y: posicoes[6].position.y), duration: 0.2))
            print("entrou7")
            
        }else if numero.intersectsNode(posicoes[7]){
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posicoes[7].position.x, y: posicoes[7].position.y), duration: 0.2))
            print("entrou8")
            
        }else if numero.intersectsNode(posicoes[8]){
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posicoes[8].position.x, y: posicoes[8].position.y), duration: 0.2))
            print("entrou9")
            
        }else if numero.intersectsNode(posicoes[9]){
            
            numero.runAction(SKAction.moveTo(CGPoint(x: posicoes[9].position.x, y: posicoes[9].position.y), duration: 0.2))
            print("entrou10")
            
        }
        
        
    }
    
    func verificaPosicao(numero: Numero){
        
        if numero.intersectsNode(posicoes[0]){
            
            if numero.name != "exercicio1_1" {
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 0 {
                controle = 1
                
            }else{
                
                 numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }
            
            
        }else if numero.intersectsNode(posicoes[1]) {
            
            if numero.name != "exercicio1_2"{

                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 1 {
                controle = 2
                
            }else{
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }

            
            
        }else if numero.intersectsNode(posicoes[2]){
            
            if numero.name != "exercicio1_3" {
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 2 {
                controle = 3
                
            }else{
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }

            
            
        }else if numero.intersectsNode(posicoes[3]) {
            
            if numero.name != "exercicio1_4" {
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 3 {
                controle = 4
                
            }else{
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }

            
            
        }else if numero.intersectsNode(posicoes[4]) {
            
            if numero.name != "exercicio1_5" {
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 4 {
                controle = 5
                
            }else{
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }

            
            
        }else if numero.intersectsNode(posicoes[5]) {
            
            if numero.name != "exercicio1_6" {
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 5 {
                controle = 6
                
            }else{
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }

            
            
        }else if numero.intersectsNode(posicoes[6]) {
            
            if numero.name != "exercicio1_7" {
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 6 {
                controle = 7
                
            }else{
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }

            
            
        }else if numero.intersectsNode(posicoes[7]) {
            
            if numero.name != "exercicio1_8" {
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 7 {
                controle = 8
                
            }else{
                
                 numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }

            
            
        }else if numero.intersectsNode(posicoes[8]) {
            
            if numero.name != "exercicio1_9" {
                
                numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
            }else if controle == 8 {
                controle = 9
                
            }else{
                
                 numero.runAction(SKAction.moveTo(CGPoint(x: Numero.toque.x, y: Numero.toque.y), duration: 0.2))
                
            }

            
            
        }else if numero.intersectsNode(posicoes[9]) {
            
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
