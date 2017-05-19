//
//  GameViewController.swift
//  SIT206 Assignment 2
//
//  Created by JOSIP ANTONY JURINA on 27/04/2017.
//  Copyright © 2017 JOSIP ANTONY JURINA. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation
import GameplayKit

class GameViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    func playSound(){
        
        let music = Bundle.main.path(forResource: "backgroundMusic", ofType: "mp3")
        let audioN = NSURL(fileURLWithPath: music!)
    do {
        player = try AVAudioPlayer(contentsOf: audioN as URL)
        
        
        player?.prepareToPlay()
        player?.numberOfLoops = -1
        player?.play()
    
    } catch let error {
        print(error.localizedDescription)
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
            // Load the SKScene from 'GameScene.sks'
            if let view = self.view as! SKView? {
                playSound()
                let scene = MainMenuScene(size: CGSize(width: 1536, height: 2048))
                
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
                view.showsFPS = true
                view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
