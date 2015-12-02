//
//  GameViewController.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 17/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation


extension SKNode {
    class func unarchiveFromFile(file : String) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            let sceneData = try! NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe)
            let archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //monta plano de fundo
        let scene = GameScene(volume: false, size: view.bounds.size)
        scene.size = view.bounds.size
        scene.backgroundColor = UIColor(red: 246/255, green: 127/255, blue: 250/255, alpha: 1)
        scene.scaleMode = .ResizeFill
        let skView:SKView = SKView(frame: self.view.frame)
        scene.gameController = self
        self.view.addSubview(skView)
        skView.presentScene(scene)
    }
    
    override func viewDidAppear(animated: Bool) {
//        let scene = GameScene()
//        scene.size = view.bounds.size
//        scene.backgroundColor = UIColor.whiteColor()
//        let skView: SKView = SKView(frame: self.view.frame)
//        scene.gameController = self
//        self.view.addSubview(skView)
//        skView.presentScene(scene)
    }
}


//    override func shouldAutorotate() -> Bool {
//        return true
//    }
//
//    override func supportedInterfaceOrientations() -> Int {
//        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
//            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
//        } else {
//            return Int(UIInterfaceOrientationMask.All.rawValue)
//        }
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Release any cached data, images, etc that aren't in use.
//    }
//
//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }
//}
