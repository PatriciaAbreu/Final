//
//  GameScene.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 17/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit
import MediaPlayer
import AVFoundation

func random(lo: Int, hi : Int) -> Int {
    return lo + Int(arc4random_uniform(UInt32(hi - lo + 1)))
}

class GameScene: SKScene {
    
    var gameController: GameViewController!
    
    //background
    var backgroundPrincipal: SKSpriteNode!
    
    //icones do menu
    var menu_numeros: SKSpriteNode!
    var menu_espaco_forma: SKSpriteNode!
    var menu_operacoes: SKSpriteNode!
    var menu_grandeza_medidas:SKSpriteNode!
    
    var menu: SKSpriteNode!
    
    var circulo_menu: PersonagensMenu!
    var personagem1_menu: PersonagensMenu!
    var personagem2_menu: PersonagensMenu!
    var personagem3_menu: PersonagensMenu!
    var personagem4_menu: PersonagensMenu!
    
    //placas
    var placa_nome_jogo: SKSpriteNode!
    
    let menu_todo = SKSpriteNode(color: UIColor.clearColor(), size: CGSize(width: 583, height: 574))
    
    var texto: SKSpriteNode!
    var seta: SKSpriteNode!

    var menuTocado: SKSpriteNode!
    
    var videoSprite: SKVideoNode!
    var audio: AVAudioPlayer!
    
    var exercicio: ExercicioJSON = ExercicioJSON()
    var video: String = ""
    var audioS: String = ""
    
    override func didMoveToView(view: SKView) {

       
        //chamada para montar tela inicial
        montarScene()
        montarMenu()
        
        
        //chamada do video e audio
        video = exercicio.getVideo(0, video: "video1")
        audioS = exercicio.getAudio(0, audio: "audio1")
        
        playVideo(video, tipo: "mp4")
        playAudio(audioS, tipo: "m4a")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        //verifica qual menu foi tocado
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        let toque = self.nodeAtPoint(touchLocation)
        var novaScene: SKScene?
        
//        if toque.name == "seta_rosa" && personagem2_menu.name == "personagem2_novo"{
//            
//            novaScene = GameSceneCozinha(size: size)
//            movie?.view.hidden = true
//            
//        }else 
        if toque.name == "seta_rosa" && personagem3_menu.name == "personagem3_novo" {
        
            novaScene = GameScenePiscina(size: size)
            videoSprite.removeFromParent()
            
        }else if toque.name == "seta_rosa" && personagem4_menu.name == "personagem4_novo" {
            
            novaScene = GameScenePatinho(size: size)
            videoSprite.removeFromParent()
            
        }else if toque.name == "seta_rosa"  {
            
            novaScene = MenuJogo1(size: size)
            videoSprite.removeFromParent()
            
        }
        
        if novaScene != nil {
            self.scene!.view?.presentScene(novaScene)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func montarScene(){
        
        //imagem de plano de fundo
        backgroundPrincipal = SKSpriteNode(imageNamed: "cenarioInicialVazio")
        backgroundPrincipal.zPosition = 2
        backgroundPrincipal.name = "backGroundPrincipal"
        backgroundPrincipal.size = CGSize(width: 1400, height: 800)
        backgroundPrincipal.position = CGPoint(x: 510, y: 400)
        
        addChild(backgroundPrincipal)
    }
    
    func girarMenu(posicaoTocada:CGPoint) {
        print(posicaoTocada)
        
        // Posição (x, y) do personagem que fica no topo
        let posicaoPersonagemSelecionado = CGPoint(x: UIScreen.mainScreen().bounds.width / 2, y: UIScreen.mainScreen().bounds.height - 225)
        
        // Posição (x,y) do centro do circulo, neste caso, centro da tela
        let centro = CGPoint(x: UIScreen.mainScreen().bounds.width / 2, y: UIScreen.mainScreen().bounds.height / 2)
        
        // Vetor em relação a posição (x,y) que foi tocada
        let v1 = CGVector(dx: posicaoTocada.x - centro.x, dy: posicaoTocada.y - centro.y)
        
        // Vetor em relação a posição (x,y) que o personagem selecionado deve ir
        let v2 = CGVector(dx: posicaoPersonagemSelecionado.x - centro.x, dy: posicaoPersonagemSelecionado.y - centro.y)
        
        // Calcular o angulo que deve ser rotacionado
        var novoAngulo = (atan2(v2.dy, v2.dx) - atan2(v1.dy, v1.dx))
        
        // posicao
        var posicao = CGFloat(ceil(novoAngulo / 1.67))
        
        // Ajustar o segundo personagem no sentido anti-horario para que seja sempre identificado como -1
        if posicao == 3 || posicao == 0 {
            posicao = 3
        }
        
        // Se não for o personagem que está no topo
        if CGFloat(novoAngulo / 1.67) < -0.2 || CGFloat(novoAngulo / 1.67) > 0.5 {
            // Angulo deve ser multiplo de 1.57
            novoAngulo = posicao * 1.57
            
            // Usar a posicao do item para fazer uma animação com duracao legal para todos os personagens
            let duracao = 1.0 * Double(abs(posicao))
            
            // Realizar animação
            self.menu_todo.runAction(SKAction.rotateByAngle(novoAngulo, duration: duracao))
        }

    }
    
    func montarMenu() {
        
        menu_todo.zPosition = 1
        menu_todo.position = CGPoint(x: 525, y: 400)
        
        circulo_menu = PersonagensMenu(texture: SKTexture(imageNamed: "circulo"), color: UIColor.clearColor(), size: CGSize(width: 354, height: 348), item: 0)
        circulo_menu.zPosition = 1
        circulo_menu.position = CGPoint(x: 0, y: 0)
        circulo_menu.name = "circulo_menu"
        
        personagem1_menu = PersonagensMenu(texture: SKTexture(imageNamed: "personagem1"), color: UIColor.clearColor(), size: CGSize(width: 90, height: 121), item: 1)
        personagem1_menu.zPosition = 1
        personagem1_menu.position = CGPoint(x: 0, y: 225)
        personagem1_menu.name = "personagem1"
        
        personagem2_menu = PersonagensMenu(texture: SKTexture(imageNamed: "personagem2"), color: UIColor.clearColor(), size: CGSize(width: 131, height: 94), item: 2)
        personagem2_menu.zPosition = 1
        personagem2_menu.position = CGPoint(x: 225, y: 0)
        personagem2_menu.name = "personagem2"
        
        personagem3_menu = PersonagensMenu(texture: SKTexture(imageNamed: "personagem3"), color: UIColor.clearColor(), size: CGSize(width: 89, height: 120), item: 3)
        personagem3_menu.zPosition = 1
        personagem3_menu.position = CGPoint(x: 0, y: -225)
        personagem3_menu.name = "personagem3"
        
        personagem4_menu = PersonagensMenu(texture: SKTexture(imageNamed: "personagem4"), color: UIColor.clearColor(), size: CGSize(width: 120, height: 95), item: 4)
        personagem4_menu.zPosition = 1
        personagem4_menu.position = CGPoint(x: -225, y: 0)
        personagem4_menu.name = "personagem4"
        
//        menu_todo.addChild(circulo_menu)
//        menu_todo.addChild(personagem1_menu)
//        menu_todo.addChild(personagem2_menu)
//        menu_todo.addChild(personagem3_menu)
//        menu_todo.addChild(personagem4_menu)
        
        texto = SKSpriteNode(imageNamed: "texto1")
        texto.zPosition = 4
        texto.position = CGPoint(x: 530, y: 450)
        texto.name = "texto_menu"
        
        seta = SKSpriteNode(imageNamed: "seta_rosa")
        seta.zPosition = 4
        seta.position = CGPoint(x: 530, y: 330)
        seta.size = CGSize(width: 50, height: 50)
        seta.name = "seta_rosa"

        //adiciona e posiciona a placa com os nomes dos jogos
        placa_nome_jogo = PersonagensMenu(texture: SKTexture(imageNamed: "esconde_esconde"), color: UIColor.clearColor(), size: CGSize(width: 377, height: 162), item: 100)
        placa_nome_jogo.zPosition = 1
        placa_nome_jogo.name = "esconde"
        placa_nome_jogo.position = CGPoint(x: 800, y: 100)
        
//        addChild(placa_nome_jogo)
//        addChild(menu_todo)
//        addChild(texto)
//        addChild(seta)
        
        
    }

    //função para mudar o texto do nome do jogo
    func muda_texto(personagem: String){
        placa_nome_jogo.removeFromParent();
        
        if personagem == "personagem2_novo" {
            placa_nome_jogo = PersonagensMenu(texture: SKTexture(imageNamed: "cozinha"), color: UIColor.clearColor(), size: CGSize(width: 377, height: 162), item: 100)
            placa_nome_jogo.zPosition = 1
            placa_nome_jogo.name = "cozinha"
            placa_nome_jogo.position = CGPoint(x: 800, y: 100)
            
        }else if personagem == "personagem3_novo" {
            placa_nome_jogo = PersonagensMenu(texture: SKTexture(imageNamed: "piscina_de_bolinhas"), color: UIColor.clearColor(), size: CGSize(width: 377, height: 162), item: 100)
            placa_nome_jogo.zPosition = 1
            placa_nome_jogo.name = "piscina"
            placa_nome_jogo.position = CGPoint(x: 800, y: 100)
            
        }
        
        addChild(placa_nome_jogo)

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
        videoSprite.position = CGPoint(x: 180, y: 600)
        videoSprite.size = CGSize(width: 350, height: 250)
        
        
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

}

