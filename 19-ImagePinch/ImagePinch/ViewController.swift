//
//  ViewController.swift
//  ImagePinch
//
//  Created by 김건우 on 2023/03/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgPinch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }

    @objc func doPinch(_ gesture: UIPinchGestureRecognizer) {
        imgPinch.transform = imgPinch.transform.scaledBy(x: gesture.scale, y: gesture.scale)
        gesture.scale = 1
    }

}

