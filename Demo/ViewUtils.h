//
//  ViewUtils.h
//  Demo
//
//  Created by jinxinnan on 2017/1/19.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewUtils : NSObject
+(void)setViewBorder:(UIView *)view color:(UIColor *)color radius:(float)radius border:(float)border;

+(UIVisualEffectView *) BlurEffect:(UIView *) mainView :(UIVisualEffectView *) blurView;
@end
