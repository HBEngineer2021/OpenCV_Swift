//
//  CameraViewController.swift
//  OpenCV_Swift
//
//  Created by Motoki Onayama on 2021/12/26.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {

    @IBOutlet weak var previewImage: UIImageView!
    
    @IBOutlet weak var snapshotBtn: UIButton! {
        didSet {
            CustomButton.shared.setSnapshotButton(button: snapshotBtn)
        }
    }
    
    let videoCapture = VideoCapture()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    
    @IBAction func stopBtn(_ sender: Any) {
        stop()
    }
    
    func start() {
        videoCapture.run { CMSampleBuffer in
            if let convertImage = self.UIImageFromSampleBuffer(CMSampleBuffer) {
                DispatchQueue.main.async {
                    let gray = OpenCVSample.canny(convertImage)
                    self.previewImage.image = gray
                }
            }
        }
    }
    
    func stop() {
        videoCapture.stop()
    }
    
    func UIImageFromSampleBuffer(_ sampleBuffer: CMSampleBuffer) -> UIImage? {
        if let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) {
            let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
            let imageRect = CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(pixelBuffer), height: CVPixelBufferGetHeight(pixelBuffer))
            let context = CIContext()
            if let image = context.createCGImage(ciImage, from: imageRect) {
                return UIImage(cgImage: image)
            }
        }
        return nil
    }
}
