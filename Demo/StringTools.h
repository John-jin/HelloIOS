//
//  StringTools.h
//  Demo
//
//  Created by jinxinnan on 2017/1/19.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface StringTools : NSObject
+(CGSize)sizeWithFont:(UIFont *)font str:(NSString*)str;
+(BOOL)isContainChinese:(NSString*)str;
@end
