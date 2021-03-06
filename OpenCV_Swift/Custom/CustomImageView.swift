//
//  CustomImageView.swift
//  OpenCV_Swift
//
//  Created by Motoki Onayama on 2021/12/12.
//

import Foundation
import UIKit

class CustomImageView {
    static var shared = CustomImageView()
    
    /// UIImageViewを設定
    /// - Parameters:
    ///   - imageView: 設定したいUIImageViewクラスを指定する
    ///   - selector: Slectorクラスを指定する
    ///   - vc: ViewControllerクラスを指定する
    func setImageViewA(imageView: UIImageView, selector: Selector, vc: Any) {
        imageView.layer.cornerRadius = 100
        imageView.layer.borderWidth = 1
        let border = UIColor.black.cgColor
        imageView.layer.borderColor = border
        imageView.isUserInteractionEnabled = true
        let tapped = UITapGestureRecognizer(target: vc, action: selector)
        imageView.addGestureRecognizer(tapped)
        tapped.delegate = vc as? UIGestureRecognizerDelegate
    }
}
