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
    
    func setButtonA(button: UIButton, selector: Selector, vc: Any) {
        button.layer.cornerRadius = 100
        button.layer.borderWidth = 1
        let border = UIColor.black.cgColor
        button.layer.borderColor = border
        button.addTarget(vc, action: selector, for: .touchUpInside)
    }
}
