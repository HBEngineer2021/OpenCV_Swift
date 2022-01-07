//
//  filterModeView.swift
//  OpenCV_Swift
//
//  Created by Motoki Onayama on 2021/12/27.
//

import UIKit

class FilterModeView: UIView {
    
    static var rowNum: Int? = 0
    
    @IBOutlet weak var contentView: UIView! {
        didSet {
            contentView.backgroundColor = UIColor.white
        }
    }
    
    @IBOutlet weak var closeBtn: UIButton!
    
    @IBOutlet weak var grayScaleBtn: UIButton! {
        didSet {
            CustomButton.shared.setButtonB(button: grayScaleBtn)
        }
    }
    
    @IBOutlet weak var cannyBtn: UIButton! {
        didSet {
            CustomButton.shared.setButtonB(button: cannyBtn)
        }
    }
    
    @IBOutlet weak var sobelBtn: UIButton! {
        didSet {
            CustomButton.shared.setButtonB(button: sobelBtn)
        }
    }
    
    @IBOutlet weak var laplacianBtn: UIButton! {
        didSet {
            CustomButton.shared.setButtonB(button: laplacianBtn)
        }
    }
    
    @IBOutlet weak var gaussianBlurBtn: UIButton! {
        didSet {
            CustomButton.shared.setButtonB(button: gaussianBlurBtn)
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        let nib = UINib(nibName: "FilterModeView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        addSubview(view)
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    @IBAction func grayScaleAction(_ sender: Any) {
        FilterModeView.rowNum = 1
        self.removeFromSuperview()
    }
    
    @IBAction func cannyAction(_ sender: Any) {
        FilterModeView.rowNum = 2
        self.removeFromSuperview()
    }
    
    @IBAction func sobelAction(_ sender: Any) {
        FilterModeView.rowNum = 3
        self.removeFromSuperview()
    }
    
    @IBAction func laplacianAction(_ sender: Any) {
        FilterModeView.rowNum = 4
        self.removeFromSuperview()
    }
    
    @IBAction func gaussianBlurAction(_ sender: Any) {
        FilterModeView.rowNum = 5
        self.removeFromSuperview()
    }
    
    @IBAction func addAction(_ sender: Any) {
        FilterModeView.rowNum = 6
        self.removeFromSuperview()
    }
    
    @IBAction func addWeightedAction(_ sender: Any) {
        FilterModeView.rowNum = 7
        self.removeFromSuperview()
    }
    
}
