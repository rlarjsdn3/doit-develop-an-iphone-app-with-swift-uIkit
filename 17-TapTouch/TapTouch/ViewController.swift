//
//  ViewController.swift
//  TapTouch
//
//  Created by 김건우 on 2023/03/05.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtMessage: UILabel!
    @IBOutlet var txtTapCount: UILabel!
    @IBOutlet var txtTouchCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touches Began"
        txtTapCount.text = String(touch.tapCount) // 탭의 개수
        txtTouchCount.text = String(touches.count) // 터치의 개수
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touches Moved"
        txtTapCount.text = String(touch.tapCount) // 탭의 개수
        txtTouchCount.text = String(touches.count) // 터치의 개수
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touches End"
        txtTapCount.text = String(touch.tapCount) // 탭의 개수
        txtTouchCount.text = String(touches.count) // 터치의 개수
    }

}

