//
//  ViewController.swift
//  Alert(Mission)
//
//  Created by 김건우 on 2023/02/22.
//

import UIKit

class ViewController: UIViewController {
    let interval = 1.0
    let selector: Selector = #selector(ViewController.updateTime)
    
    var alarmTime: String?
    var alarmFlag = false
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: selector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss aaa"
        lblPickerTime.text = "선택시간: " +
        formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
        let date = Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss aaa"
        lblCurrentTime.text = "현재시간: " +
            formatter.string(from: date)
        
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date)
        
        if alarmTime == currentTime {
            if !alarmFlag {
                alarmAlert()
                alarmFlag = true
            } else {
                alarmFlag = false
            }
        }
    }
    
    func alarmAlert() {
        let alarmAlert = UIAlertController(
            title: "알림",
            message: "설정된 시간입니다!!",
            preferredStyle: UIAlertController.Style.alert
        )
        let okAction = UIAlertAction(
            title: "네, 알겠습니다",
            style: UIAlertAction.Style.default
        ) { _ in
            self.alarmTime = ""
        }
        alarmAlert.addAction(okAction)
        present(alarmAlert, animated: true)
    }
}

