//
//  AddViewController.swift
//  Table
//
//  Created by 김건우 on 2023/02/28.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM = itemsImageFile.count
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT: CGFloat = 50.0
    
    var imageArray: [UIImage?] = []
    var selectedRow: Int = 0
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var tfAddItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0..<itemsImageFile.count {
            let image = UIImage(named: itemsImageFile[i])
            imageArray.append(image)
        }
        imgView.image = imageArray[0]
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImageFile.append(itemsImageFile[selectedRow])
        tfAddItem.text = ""
        _ = navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return MAX_ARRAY_NUM
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imgView.image = UIImage(named: itemsImageFile[row])
        selectedRow = row
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
