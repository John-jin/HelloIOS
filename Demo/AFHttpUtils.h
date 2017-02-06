//
//  AFHttpUtils.h
//  Demo
//
//  Created by jinxinnan on 2017/1/11.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessBlock)(NSString *result);
typedef void (^FailedBlock)(NSError *error);
@interface AFHttpUtils : NSObject
+(instancetype) sharedHttpUtils;

-(void)getByAFNet:(NSString *)pUrl paramater:(SuccessBlock) success paramater:(FailedBlock) fail;

-(void)postByAFNet:(NSString *)pUrl :(NSDictionary *)dict paramater:(SuccessBlock) success paramater:(FailedBlock) fail;

-(void)downloadByAFNet:(NSString *)pUrl : (NSURL *)filePath paramater:(SuccessBlock) success paramater:(FailedBlock) fail;

-(void)uploadByAFNet:(NSString *)pUrl : (NSURL *)filePath paramater:(SuccessBlock) success paramater:(FailedBlock) fail;



@end
