//
//  ViewController.swift
//  PageControl(Mission)
//
//  Created by 김건우 on 2023/02/27.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblNumber: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = 10
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.gray
        lblNumber.text = String(pageControl.currentPage + 1)
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        lblNumber.text = String(sender.currentPage + 1)
    }
}

