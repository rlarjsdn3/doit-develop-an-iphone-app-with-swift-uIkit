//
//  ViewController.swift
//  CameraPhotoLibrary(Mission)
//
//  Created by 김건우 on 2023/03/04.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var flagImageSave = false
    
    var numImage = -1
    
    @IBOutlet var imgView1: UIImageView!
    @IBOutlet var imgView2: UIImageView!
    @IBOutlet var imgView3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            flagImageSave = true
            
            increaseNumImage()
            print(numImage)
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            imagePicker.mediaTypes = ["public.image"]
            
            self.present(imagePicker, animated: true)
        } else {
            myAlert("카메라 접근 불가", message: "애플리케이션이 카메라에 접근할 수 없습니다.")
        }
    }
    
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            increaseNumImage()
            print(numImage)
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            imagePicker.mediaTypes = ["public.image"]
            
            self.present(imagePicker, animated: true)
        } else {
            myAlert("포토 라이브러리 접근 불가", message: "애플리케이션이 포토 라이브러리에 접근할 수 없습니다.")
        }
    }
    
    @IBAction func btnReset(_ sender: UIButton) {
        imgView1.image = nil
        imgView2.image = nil
        imgView3.image = nil
    }
    
    func myAlert(_ title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )
        let action = UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default
        )
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func increaseNumImage() {
        numImage = (numImage + 1) % 3
    }
    
    func decreaseNumImage() {
        numImage -= 1
        if numImage == -1 {
            numImage = 2
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        if mediaType.isEqual(to: "public.image" as String) {
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
        }
        
        switch numImage {
        case 0:
            imgView1.image = captureImage
        case 1:
            imgView2.image = captureImage
        default:
            imgView3.image = captureImage
        }
        
        self.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        numImage -= 1
        self.dismiss(animated: true)
    }
}

