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
    
    func imageProccess(rowNum: Int, image: UIImage) -> UIImage {
        switch rowNum {
        case 0:
            return OpenCVSample.original(image)
        case 1:
            return OpenCVSample.grayScale(image)
        case 2:
            return OpenCVSample.canny(image)
        case 3:
            return OpenCVSample.sobel(image)
        case 4:
            return OpenCVSample.laplacian(image)
        case 5:
            return OpenCVSample.gaussianBlur(image)
        case 6:
            return OpenCVSample.add(image)
        case 7:
            return OpenCVSample.addWeighted(image)
        default:
            break
        }
        return OpenCVSample.original(image)
    }
    
    @IBAction func stopBtn(_ sender: Any) {
        stop()
    }
    
    @IBAction func filterBtn(_ sender: Any) {
        let filterModeView = FilterModeView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        filterModeView.center = view.center
        self.view.addSubview(filterModeView)
    }
    
    func start() {
        videoCapture.run { CMSampleBuffer in
            if let convertImage = self.UIImageFromSampleBuffer(CMSampleBuffer) {
                if let rowNum = FilterModeView.rowNum {
                    DispatchQueue.main.async {
                        let select = self.imageProccess(rowNum: rowNum, image: convertImage)
                        self.previewImage.image = select
                    }
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
