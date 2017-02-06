//
//  FormatUtils.h
//  Demo
//
//  Created by jinxinnan on 2017/1/19.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface FormatUtils : NSObject
+(NSInteger) string2Int:(NSString *) str;
+(CGFloat) string2Float:(NSString *) str;
+(NSString *) int2String:(NSInteger) num;
+(NSString *) float2String:(CGFloat) num;

+(NSNumber*)StringToNumber:(NSString*) str;
@end
