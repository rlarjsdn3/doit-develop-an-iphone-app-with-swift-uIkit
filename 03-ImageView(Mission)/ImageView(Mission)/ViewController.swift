//
//  ViewController.swift
//  ImageView(Mission)
//
//  Created by 김건우 on 2023/02/21.
//

import UIKit

class ViewController: UIViewController {
    var numImage = 1
    let maxImage = 6
    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        imgView.image = UIImage(named: String(numImage) + ".png")
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        numImage += 1
        if numImage > maxImage {
            numImage = 1
        }
        imgView.image = UIImage(named: String(numImage) + ".png")
    }
    
    @IBAction func btnPrevious(_ sender: UIButton) {
        numImage -= 1
        if numImage < 1 {
            numImage = maxImage
        }
        imgView.image = UIImage(named: String(numImage) + ".png")
    }
}

