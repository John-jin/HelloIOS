//
//  ImageTools.h
//  Demo
//
//  Created by jinxinnan on 2017/1/19.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageTools : NSObject
//尺寸压缩
+(UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size;
//质量压缩
+(UIImage *)compressImage:(UIImage *)image percent:(float)percent;
//图片压缩到指定大小
+ (UIImage *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size;

+(UIImage *)blurrImage:(UIImage *) _image scale:(float)_scale;

+(UIImage *)toRoundImage:(UIImage *)image;
@end
