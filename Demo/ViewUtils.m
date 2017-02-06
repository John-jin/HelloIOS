//
//  ViewUtils.m
//  Demo
//
//  Created by jinxinnan on 2017/1/19.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "ViewUtils.h"

@implementation ViewUtils

/**
 设置view的边框
 
 @param view view
 @param color 边框线颜色
 @param radius 圆角半径
 @param border 边框线宽度
 */
+(void)setViewBorder:(UIView *)view color:(UIColor *)color radius:(float)radius border:(float)border{
    //设置layer
    CALayer *layer=[view layer];
    //是否设置边框以及是否可见
    [layer setMasksToBounds:YES];
    //设置边框圆角的弧度
    [layer setCornerRadius:radius];
    //设置边框线的宽
    [layer setBorderWidth:border];
    //设置边框线的颜色
    [layer setBorderColor:[color CGColor]];
}

+(UIVisualEffectView *) BlurEffect:(UIView *) mainView :(UIVisualEffectView *) blurView{
    if ([[UIDevice currentDevice].systemVersion floatValue]>=8) {
        if(!blurView){
            UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
            blurView = [[UIVisualEffectView alloc]initWithEffect:beffect];
            blurView.frame = mainView.bounds;
            blurView.alpha = 0.8;
            [mainView addSubview:blurView];
        }else{
            [blurView removeFromSuperview];
            blurView = nil;
        }
    }
    return blurView;
}
@end
