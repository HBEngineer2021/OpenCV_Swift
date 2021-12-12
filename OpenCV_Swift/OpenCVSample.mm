//
//  OpenCVSample.mm
//  OpenCV_Swift
//
//  Created by Motoki Onayama on 2021/09/20.
//

#import "opencv2/opencv.hpp"
#import "opencv2/imgproc.hpp"
#import "opencv2/imgcodecs.hpp"
#import "opencv2/imgcodecs/ios.h"

#import "OpenCVSample.h"

@implementation OpenCVSample
+(UIImage *)GrayScale:(UIImage *)image{
    // convert image to mat
    cv::Mat mat;
    UIImageToMat(image, mat);

    // convert mat to gray scale
    cv::Mat gray;
    cv::cvtColor(mat, gray, cv::COLOR_BGR2GRAY);

    // convert to image
    UIImage * grayImg = MatToUIImage(gray);

    return grayImg;
}
+(UIImage *)Canny:(UIImage *)image{
    cv::Mat mat;
    UIImageToMat(image, mat);
    
    cv::Mat gray;
    cv::cvtColor(mat, gray, cv::COLOR_BGR2GRAY);
    
    cv::Canny(mat, gray, 100, 100);
    
    return MatToUIImage(gray);
}
+(UIImage *)Sobel:(UIImage *)image{
    cv::Mat mat;
    UIImageToMat(image, mat);
    
    cv::Mat gray;
    cv::cvtColor(mat, gray, cv::COLOR_BGR2GRAY);
    
    cv::Mat blur;
    cv::GaussianBlur(gray, blur, cv::Size(5,5), 0);
    
    cv::Mat sobel;
    /// カーネルサイズよりもdx、dyが大きいとエラーになる
    cv::Sobel(blur, sobel, CV_16S, 3, 3, 7);
    
    cv::Mat img;
    cv::convertScaleAbs(sobel, img);
    
    return MatToUIImage(img);
}
+(UIImage *)Laplacian:(UIImage *)image{
    cv::Mat mat;
    UIImageToMat(image, mat);
    
    cv::Mat gray;
    cv::cvtColor(mat, gray, cv::COLOR_BGR2GRAY);
    
    cv::Laplacian(mat, gray, 10);
    
    return MatToUIImage(gray);
}
+(UIImage *)GaussianBlur:(UIImage *)image{
    cv::Mat mat;
    UIImageToMat(image, mat);
    
    cv::Mat blur;
    cv::GaussianBlur(mat, blur, cv::Size(41,41), 0);
    
    return MatToUIImage(blur);
}
+(UIImage *)Add:(UIImage *)image{
    cv::Mat mat;
    UIImageToMat(image, mat);
    
    cv::Mat add;
    cv::add(mat, mat, add);
    
    return MatToUIImage(add);
}
+(UIImage *)Dilate:(UIImage *)image{
    cv::Mat mat;
    UIImageToMat(image, mat);
    
    cv::Mat gray;
    cv::cvtColor(mat, gray, cv::COLOR_BGR2GRAY);
    
    cv::Laplacian(mat, gray, 10);
    
    cv::Mat dilate;
    cv::dilate(mat, dilate, 6);
    
    return MatToUIImage(dilate);
}
+(UIImage *)Erode:(UIImage *)image{
    cv::Mat mat;
    UIImageToMat(image, mat);
    
    cv::Mat gray;
    cv::cvtColor(mat, gray, cv::COLOR_BGR2GRAY);
    
    cv::Laplacian(mat, gray, 10);
    
    cv::Mat erode;
    cv::erode(mat, erode, 6);
    
    return MatToUIImage(erode);
}
+(UIImage *)Absdiff:(UIImage *)image{
    cv::Mat mat;
    UIImageToMat(image, mat);
    cv::Mat gray;
    cv::cvtColor(mat, gray, cv::COLOR_BGR2GRAY);
    
    cv::Mat mat1;
    UIImageToMat(image, mat1);
    cv::circle(mat1, cv::Point(300, 300), 100, cv::Scalar(255,0,0), 3, 1);
    cv::Mat gray1;
    cv::cvtColor(mat1, gray1, cv::COLOR_BGR2GRAY);
    
    cv::Mat absdiff;
    cv::absdiff(gray, gray1, absdiff);
    
    return MatToUIImage(absdiff);
}
/*+(UIImage *)CalcHist:(UIImage *)image{
    cv::Mat mat;
    UIImageToMat(image, mat);
    
    cv::Mat calcHist;
    cv::MatND hist;
    int channels[] = {0, 1};
    int hbins = 30, sbins = 32;
    int histSize[] = {hbins, sbins};
    float hranges[] = { 0, 180 };
    float sranges[] = { 0, 256 };
    const float* ranges[] = { hranges, sranges };
    cv::calcHist(mat, 1, channels, hist, 2, histSize, ranges);
    return MatToUIImage(calcHist);
}*/
@end
