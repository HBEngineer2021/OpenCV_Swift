//
//  OpenCVSample.h
//  OpenCV_Swift
//
//  Created by Motoki Onayama on 2021/09/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OpenCVSample : NSObject
+(UIImage *)GrayScale:(UIImage *)image;
+(UIImage *)Canny:(UIImage *)image;
+(UIImage *)Laplacian:(UIImage *)image;
+(UIImage *)Sobel:(UIImage *)image;
+(UIImage *)GaussianBlur:(UIImage *)image;
+(UIImage *)Add:(UIImage *)image;
+(UIImage *)Dilate:(UIImage *)image;
@end

NS_ASSUME_NONNULL_END
