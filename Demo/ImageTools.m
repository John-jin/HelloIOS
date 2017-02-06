//
//  ImageTools.m
//  Demo
//
//  Created by jinxinnan on 2017/1/19.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "ImageTools.h"

@implementation ImageTools
/**
 *  压缩图片到指定尺寸大小
 *
 *  @param image 原始图片
 *  @param size  目标大小
 *
 *  @return 生成图片
 */
+(UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size{
    UIImage * resultImage = image;
    UIGraphicsBeginImageContext(size);
    [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIGraphicsEndImageContext();
    return image;
}

/**
 图片质量压缩
 */
+(UIImage *)compressImage:(UIImage *)image percent:(float)percent{
    NSData *imageData = UIImageJPEGRepresentation(image, percent);
    UIImage *newImage = [UIImage imageWithData:imageData];
    return newImage;
}
/**
 *  压缩图片到指定文件大小
 *
 *  @param image 目标图片
 *  @param size  目标大小（最大值）
 *
 *  @return 返回的图片文件
 */
+ (UIImage *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size{
    NSData * data = UIImageJPEGRepresentation(image, 1.0);
    CGFloat dataKBytes = data.length/1000.0;
    CGFloat maxQuality = 0.9f;
    CGFloat lastData = dataKBytes;
    while (dataKBytes > size && maxQuality > 0.01f) {
        maxQuality = maxQuality - 0.01f;
        data = UIImageJPEGRepresentation(image, maxQuality);
        dataKBytes = data.length / 1000.0;
        if (lastData == dataKBytes) {
            break;
        }else{
            lastData = dataKBytes;
        }
    }
    UIImage *completeImage = [UIImage imageWithData: data];
    return completeImage;
    
}

/**
 图片虚化处理
 */
+(UIImage *)blurrImage:(UIImage *) _image scale:(float)_scale{
    if (!_image)
        return nil;
    CIContext *context = [CIContext contextWithOptions:nil];
    // Create an image
    CIImage *image = [CIImage imageWithCGImage:_image.CGImage];
    // Set up a Gaussian Blur filter
    CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blurFilter setValue:image forKey:kCIInputImageKey];
    // Get blurred image out
    CIImage *blurredImage = [blurFilter valueForKey:kCIOutputImageKey];
    // Set up vignette filter
    CIFilter *vignetteFilter = [CIFilter filterWithName:@"CIVignette"];
    [vignetteFilter setValue:blurredImage forKey:kCIInputImageKey];
    [vignetteFilter setValue:@(3.f) forKey:@"InputIntensity"];
    // get vignette & blurred image
    CIImage *vignetteImage = [vignetteFilter valueForKey:kCIOutputImageKey];
    //CGFloat scale = [[UIScreen mainScreen] scale];
    CGSize scaledSize = CGSizeMake(_image.size.width * _scale, _image.size.height * _scale);
    CGImageRef imageRef = [context createCGImage:vignetteImage fromRect:(CGRect){CGPointZero, scaledSize}];
    return [UIImage imageWithCGImage:imageRef scale:[[UIScreen mainScreen] scale] orientation:UIImageOrientationUp];
}
+(UIImage *)toRoundImage:(UIImage *)image{
    CGFloat imageW = image.size.width;
    CGFloat imageH = imageW;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat bigRadius = imageW * 0.5;
    CGFloat centerX = bigRadius;
    CGFloat centerY = bigRadius;
    CGContextAddArc(context, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(context);
    CGFloat smallRadius = bigRadius;
    CGContextAddArc(context, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    CGContextClip(context);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
