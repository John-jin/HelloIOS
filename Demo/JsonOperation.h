//
//  JsonOperation.h
//  Demo
//
//  Created by jinxinnan on 2017/1/19.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonOperation : NSObject
//字典转Json字符串
+ (NSString*)convertToJSONData:(NSDictionary *)infoDict;
//JSON字符串转化为字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
@end
