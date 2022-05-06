//
//  CustomButton.swift
//  OpenCV_Swift
//
//  Created by Motoki Onayama on 2021/12/12.
//

import Foundation
import UIKit

class CustomButton {
    static var shared = CustomButton()
    
    /// UIButtonを設定
    /// - Parameters:
    ///   - button: 設定したいUIButtonクラスを指定する
    ///   - selector: Selectorクラスを指定する
    ///   - vc: ViewControllerクラスを指定する
    func setButtonA(button: UIButton, selector: Selector, vc: Any) {
        button.layer.cornerRadius = 100
        button.layer.borderWidth = 1
        let border = UIColor.black.cgColor
        button.layer.borderColor = border
        button.addTarget(vc, action: selector, for: .touchUpInside)
    }
    
    func setButtonB(button: UIButton) {
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
    }
    
    func setSnapshotButton(button: UIButton) {
        button.layer.cornerRadius = button.frame.size.width/2
        button.backgroundColor = UIColor.white
    }
}
