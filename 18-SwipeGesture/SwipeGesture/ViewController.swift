//
//  ViewController.swift
//  SwipeGesture
//
//  Created by 김건우 on 2023/03/06.
//

import UIKit

class ViewController: UIViewController {
    let numOfTouches = 2
    
    @IBOutlet var imgViewUp: UIImageView!
    @IBOutlet var imgViewDown: UIImageView!
    @IBOutlet var imgViewLeft: UIImageView!
    @IBOutlet var imgViewRight: UIImageView!
    
    var imageLeft = [UIImage]()
    var imageRight = [UIImage]()
    var imageUp = [UIImage]()
    var imageDown = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        imageUp.append(UIImage(named: "arrow-up-black.png")!)
        imageUp.append(UIImage(named: "arrow-up-red.png")!)
        imageUp.append(UIImage(named: "arrow-up-green.png")!)
        imageDown.append(UIImage(named: "arrow-down-black.png")!)
        imageDown.append(UIImage(named: "arrow-down-red.png")!)
        imageDown.append(UIImage(named: "arrow-down-green.png")!)
        imageLeft.append(UIImage(named: "arrow-left-black.png")!)
        imageLeft.append(UIImage(named: "arrow-left-red.png")!)
        imageLeft.append(UIImage(named: "arrow-left-green.png")!)
        imageRight.append(UIImage(named: "arrow-right-black.png")!)
        imageRight.append(UIImage(named: "arrow-right-red.png")!)
        imageRight.append(UIImage(named: "arrow-right-green.png")!)
        
        imgViewUp.image = imageUp[0]
        imgViewDown.image = imageDown[0]
        imgViewLeft.image = imageLeft[0]
        imgViewRight.image = imageRight[0]
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_: )))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
//        swipeUp.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action:  #selector(ViewController.respondToSwipeGesture(_: )))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
//        swipeDown.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action:  #selector(ViewController.respondToSwipeGesture(_: )))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
//        swipeLeft.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action:  #selector(ViewController.respondToSwipeGesture(_: )))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
//        swipeRight.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_: )))
        swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
        swipeUpMulti.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeUpMulti)
        
        let swipeDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeDownMulti.direction = UISwipeGestureRecognizer.Direction.down
        swipeDownMulti.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeDownMulti)
        
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeftMulti.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeLeftMulti)
        
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        swipeRightMulti.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeRightMulti)
    }

    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imgViewUp.image = imageUp[0]
            imgViewDown.image = imageDown[0]
            imgViewLeft.image = imageLeft[0]
            imgViewRight.image = imageRight[0]
            
            switch swipeGesture.direction {
            case .up:
                imgViewUp.image = imageUp[1]
            case .down:
                imgViewDown.image = imageDown[1]
            case .left:
                imgViewLeft.image = imageLeft[1]
            case .right:
                imgViewRight.image = imageRight[1]
            default:
                break
            }
        }
    }
    
    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imgViewUp.image = imageUp[0]
            imgViewDown.image = imageDown[0]
            imgViewLeft.image = imageLeft[0]
            imgViewRight.image = imageRight[0]
            
            switch swipeGesture.direction {
            case .up:
                imgViewUp.image = imageUp[2]
            case .down:
                imgViewDown.image = imageDown[2]
            case .left:
                imgViewLeft.image = imageLeft[2]
            case .right:
                imgViewRight.image = imageRight[2]
            default:
                break
            }
        }
    }
}

