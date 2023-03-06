//
//  ViewController.swift
//  PinchGesture
//
//  Created by 김건우 on 2023/03/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtPinch: UILabel!
    
    var initalFontSize: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_: )))
        self.view.addGestureRecognizer(pinch)
    }

    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        if (pinch.state == UIGestureRecognizer.State.began) {
            initalFontSize = txtPinch.font.pointSize
        } else {
            txtPinch.font = txtPinch.font.withSize(initalFontSize + pinch.scale)
        }
    }
}

