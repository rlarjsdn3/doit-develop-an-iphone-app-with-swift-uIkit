//
//  ViewController.swift
//  MoviePlayer(Mission)
//
//  Created by 김건우 on 2023/03/03.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func playInternalVideo(forResource fileName: String, ofType ext: String) {
        let filePath = Bundle.main.path(forResource: fileName, ofType: ext)
        let url = NSURL(fileURLWithPath: filePath!)
        playVideo(url)
    }
    
    private func playExternalVideo(url: NSURL) {
        playVideo(url)
    }
    
    private func playVideo(_ url: NSURL) {
        let playerController = AVPlayerViewController()
        
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        
        self.present(playerController, animated: true) {
            player.play()
        }
    }

    @IBAction func playFastTyping(_ sender: UIButton) {
        playInternalVideo(forResource: "FastTyping", ofType: "mp4")
    }
    
    @IBAction func playMountain(_ sender: UIButton) {
        playInternalVideo(forResource: "Mountaineering", ofType: "mov")
    }
    
    @IBAction func playFirwork(_ sender: UIButton) {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks/mp4")!
        
        playExternalVideo(url: url)
    }
    
    @IBAction func playOcean(_ sender: UIButton) {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/ijybpprsmx0bgre/Seascape.mov")!
        
        playVideo(url)
    }
}

