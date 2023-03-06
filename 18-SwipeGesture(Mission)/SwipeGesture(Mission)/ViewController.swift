//
//  ViewController.swift
//  SwipeGesture(Mission)
//
//  Created by 김건우 on 2023/03/06.
//

import UIKit

let images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    let imageCount = images.count
    
    var imageIndex = 0
    var uiImages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        for image in images {
            uiImages.append(UIImage(named: image)!)
        }
        imgView.image = uiImages[imageIndex]
        
        pageControl.numberOfPages = imageCount
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.gray
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeAction(_: )))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeAction(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    func nextPage() {
        imageIndex = (imageIndex + 1) % imageCount
    }
    
    func prevPage() {
        imageIndex -= 1
        if imageIndex == -1 {
            imageIndex = imageCount - 1
        }
    }
    
    @IBAction func changeImageView(_ sender: UIPageControl) {
        imageIndex = pageControl.currentPage
        imgView.image = uiImages[imageIndex]
    }
    
    @objc func swipeAction(_ gesture: UIGestureRecognizer) {
        if let gesture = gesture as? UISwipeGestureRecognizer {
            switch gesture.direction {
            case .left:
                nextPage()
            case .right:
                prevPage()
            default:
                break
            }
            
            imgView.image = uiImages[imageIndex]
            pageControl.currentPage = imageIndex
        }
    }
}

