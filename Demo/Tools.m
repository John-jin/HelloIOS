//
//  Tools.m
//  Demo
//
//  Created by jinxinnan on 2017/1/19.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "Tools.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@implementation Tools

+(CGFloat)getScreenWidth{
    return SCREEN_WIDTH;
}
+(CGFloat)getScreenHeight{
    return SCREEN_HEIGHT;
}
+(CGFloat)getSystemVersion{
    return [[UIDevice currentDevice].systemVersion floatValue];
}
+(CGSize)getStatusSize{
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    return rectStatus.size;
}
+(CGSize)getNavigationBarSize:(UINavigationController *)nc{
    CGRect rectNav = nc.navigationBar.frame;
    return rectNav.size;
}
@end
