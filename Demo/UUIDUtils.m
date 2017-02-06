//
//  UUIDUtils.m
//  Demo
//
//  Created by jinxinnan on 2017/1/19.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "UUIDUtils.h"

@implementation UUIDUtils
+ (NSString *)getUUid{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString *)uuid_string_ref];
    CFRelease(uuid_ref);
    CFRelease(uuid_string_ref);
    return [uuid lowercaseString];
 }
@end
