//
//  FormatUtils.m
//  Demo
//
//  Created by jinxinnan on 2017/1/19.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "FormatUtils.h"


@implementation FormatUtils
+(NSInteger) string2Int:(NSString *) str{
    return [str integerValue];
}
+(CGFloat) string2Float:(NSString *) str{
    return [str floatValue];
}
+(NSString *) int2String:(NSInteger) num{
    return [NSString stringWithFormat:@"%ld",(long)num];
}
+(NSString *) float2String:(CGFloat) num{
    return [NSString stringWithFormat:@"%f",num];
}

//字符串数字转NSNumber
+(NSNumber*)StringToNumber:(NSString*) str{
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterNoStyle];
    NSNumber * myNumber = [f numberFromString:str];
    return  myNumber;
}
@end
