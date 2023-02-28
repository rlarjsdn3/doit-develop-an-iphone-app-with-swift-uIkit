//
//  ViewController.swift
//  Navigation
//
//  Created by 김건우 on 2023/02/28.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    var isZoom = false
    
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : use Bar button"
        }
        editViewController.textMessage = txtMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = isZoom
        editViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    func didImageZoom(_ controller: EditViewController, isZoom: Bool) {
        // 축소 → 확대
        if isZoom { // true
            if !self.isZoom {
                let size = CGSize(width: imgView.frame.width * 2, height: imgView.frame.height * 2)
                imgView.frame.size = size
            }
        // 확대 → 축소
        } else {
            if self.isZoom {
                let size = CGSize(width: imgView.frame.width / 2, height: imgView.frame.height / 2)
                imgView.frame.size = size
            }
        }
        
        self.isZoom = isZoom
    }
}

