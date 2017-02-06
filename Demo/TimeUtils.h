//
//  TimeUtils.h
//  Demo
//
//  Created by jinxinnan on 2017/1/19.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeUtils : NSObject
+(NSString*)getCurrentTime;
+(NSString*)getFormatedTime:(NSDate*)date;

+(int)getMinutesFrom:(NSString *)fDate to:(NSString *)tDate;
@end
