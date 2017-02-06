//
//  HttpTools.m
//  Demo
//
//  Created by jinxinnan on 2017/1/10.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "HttpTools.h"

@implementation HttpTools
-(void)getMethod:(NSString*) url paramatar:(CallBackBlock)CallBackBlcok{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    request.HTTPMethod = @"GET";
    // 设置请求超时
    request.timeoutInterval = 10.0;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(data&&!error){
            NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            dispatch_async(dispatch_get_main_queue(), ^{
                if(result){
                    CallBackBlcok(result);
                }
            });
        }else
            NSLog(@"%@",error);
    }] resume];
}
-(void)postMethod:(NSString *)url :(NSDictionary *)dict{
    NSData *data =    [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];//请求头
    request.timeoutInterval = 30.0;
    [request setHTTPBody:data];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    __block NSString *result = @"";
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(!error){
            result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.delegate!=nil) {
                    [self.delegate httpResponse:result];
                }
            });
        }else
            NSLog(@"%@",error);
    }] resume];
}

@end
