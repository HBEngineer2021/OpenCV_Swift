//
//  ViewController.swift
//  OpenCV_Swift
//
//  Created by Motoki Onayama on 2021/09/20.
//

import UIKit

class ViewController: UIViewController, AlertViewController {
    
    @IBOutlet var profileImageButton: UIButton!
    
    @IBOutlet weak var grayScaleImage: UIImageView!
    
    @IBOutlet weak var pickerView: UIPickerView!
        
    let imageArray = ["GrayScale", "Canny", "Sobel", "Laplacian", "Gaussian", "Add", "Erode", "Absdiff", "addWeighted"]
    var rowNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomButton.shared.setButtonA(button: profileImageButton, selector: #selector (tappedProfileImageButton), vc: self)
        CustomImageView.shared.setImageViewA(imageView: grayScaleImage, selector: #selector(self.tappedGetImage(_:)), vc: self)
        pickerView.delegate = self
        pickerView.dataSource = self
        LogManager.shared.createFile()
        _ = LogManager.shared.printer(object: "生成")
        LogManager.shared.write()
    }
    
    @objc private func tappedProfileImageButton() {
        print("tappedProfileImageButton")
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc private func tappedGetImage(_ sender: UITapGestureRecognizer) {
        let getImageView = sender.view! as! UIImageView
        guard let getImage = getImageView.image as UIImage? else { return }
        _ = saveToImage(handler: {
            (UIAlertAction) -> Void in
            UIImageWriteToSavedPhotosAlbum(getImage, self, #selector(self.showResultOfSaveImage(_:didFinishSavingWithError:contextInfo:)), nil)
        })
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editingImage = info[.editedImage] as? UIImage {
            profileImageButton.setImage(editingImage.withRenderingMode(.alwaysOriginal), for: .normal)
        } else if let originalImage = info[.originalImage] as? UIImage {
            profileImageButton.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        
        profileImageButton.setTitle("", for: .normal)
        profileImageButton.imageView?.contentMode = .scaleAspectFill
        profileImageButton.contentHorizontalAlignment = .fill
        profileImageButton.contentVerticalAlignment = .fill
        profileImageButton.clipsToBounds = true
        
        guard let image = profileImageButton.imageView?.image else { return }
        
        grayScaleImage.image = imageProccess(rowNum: rowNum, image: image)
        
        grayScaleImage.contentMode = .scaleAspectFill
        grayScaleImage.clipsToBounds = true
        
        dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    // 保存結果をアラートで表示
    @objc func showResultOfSaveImage(_ image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
        
        var title = "保存完了"
        var message = "カメラロールに保存しました"
        
        if error != nil {
            title = "エラー"
            message = "保存に失敗しました"
        }
        _ = success(title: title, message: message)
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.imageArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rowNum = row
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageArray[row]
    }
    
    func imageProccess(rowNum: Int, image: UIImage) -> UIImage {
        switch rowNum {
        case 0:
            return OpenCVSample.grayScale(image)
        case 1:
            return OpenCVSample.canny(image)
        case 2:
            return OpenCVSample.sobel(image)
        case 3:
            return OpenCVSample.laplacian(image)
        case 4:
            return OpenCVSample.gaussianBlur(image)
        case 5:
            return OpenCVSample.add(image)
        case 6:
            return OpenCVSample.erode(image)
        case 7:
            return OpenCVSample.absdiff(image)
        case 8:
            return OpenCVSample.addWeighted(image)
        default:
            break
        }
        return (profileImageButton.imageView?.image)!
    }
    
}
