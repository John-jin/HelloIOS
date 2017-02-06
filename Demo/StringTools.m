//
//  StringTools.m
//  Demo
//
//  Created by jinxinnan on 2017/1/19.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "StringTools.h"

@implementation StringTools

/**
 获取字符串的size

 @param font 字体
 @param str 字符
 @return size
 */
+(CGSize)sizeWithFont:(UIFont *)font str:(NSString*)str{
    CGSize cgSize = [str sizeWithAttributes:@{ NSFontAttributeName : font }];
    return  cgSize;
}
//判断一个字符串是否包含汉字
+(BOOL)isContainChinese:(NSString*)str{
    BOOL flag=NO;
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if(a>0x4e00&&a<0x9fff){
            flag=YES;
            break;
        }
    }
    return flag;
}
@end
