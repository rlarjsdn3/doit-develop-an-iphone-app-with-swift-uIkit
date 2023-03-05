//
//  ViewController.swift
//  DrawGraphics(Mission)
//
//  Created by 김건우 on 2023/03/05.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        drawFlower()
    }

    func drawFlower() {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        // 원 그리기
        context.addEllipse(in: circle(x: 120, y: 150))
        context.addEllipse(in: circle(x: 120+50, y: 150))
        context.addEllipse(in: circle(x: 120-50, y: 150))
        context.addEllipse(in: circle(x: 120, y: 150-50))
        context.addEllipse(in: circle(x: 120, y: 150+50))
        context.strokePath()
        
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        // 삼각형 그리기
        context.move(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 200, y: 450))
        context.addLine(to: CGPoint(x: 140, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 200))
        context.fillPath()
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    func circle(x: Int, y: Int) -> CGRect {
        return CGRect(x: x, y: y, width: 100, height: 100)
    }
}

