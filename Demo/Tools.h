//
//  Tools.h
//  Demo
//
//  Created by jinxinnan on 2017/1/19.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tools : NSObject
+(CGFloat)getScreenWidth;
+(CGFloat)getScreenHeight;

+(CGFloat)getSystemVersion;

+(CGSize)getStatusSize;
+(CGSize)getNavigationBarSize:(UINavigationController *)nc;
@end
