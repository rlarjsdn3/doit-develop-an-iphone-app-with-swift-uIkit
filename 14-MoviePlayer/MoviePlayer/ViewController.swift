//
//  ViewController.swift
//  MoviePlayer
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
    
    private func playVideo(_ url: URL) {
        let playerController = AVPlayerViewController()
        
        let player = AVPlayer(url: url)
        playerController.player = player
        
        self.present(playerController, animated: true) {
            player.play()
        }
    }

    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
        let url = URL(string: filePath!)!
        
        playVideo(url)
    }
    
    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
        let url = URL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
        
        playVideo(url)
    }
}

