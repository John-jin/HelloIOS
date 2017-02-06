//
//  HttpTools.h
//  Demo
//
//  Created by jinxinnan on 2017/1/10.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CallBackBlock) (NSString* result);

@protocol HttpResult <NSObject>

@required
-(void) httpResponse:(NSString *)result;

@end

@interface HttpTools : NSObject

@property(nonatomic,assign) id<HttpResult> delegate;

-(void)getMethod:(NSString*) url paramatar:(CallBackBlock)CallBackBlcok;

-(void)postMethod:(NSString*) url :(NSDictionary*) dict;

@end
