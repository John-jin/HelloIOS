//
//  AFHttpUtils.m
//  Demo
//
//  Created by jinxinnan on 2017/1/11.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "AFHttpUtils.h"
#import "AFNetworking/AFNetworking.h"

@implementation AFHttpUtils

-(void)getByAFNet:(NSString *)pUrl paramater:(SuccessBlock) success paramater:(FailedBlock) fail;{
    NSURL *url = [NSURL URLWithString:pUrl];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLSessionConfiguration *defaultConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:defaultConfig];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSURLSessionTask *task = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if(!error){
            NSData *data = responseObject;
            NSString *strData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            if (success) {
                success(strData);
            }
        }
        else{
            if (fail) {
                fail(error);
            }
        }
        
    }];
    [task resume];

}

-(void)postByAFNet:(NSString *)pUrl :(NSDictionary *)dict paramater:(SuccessBlock) success paramater:(FailedBlock) fail{
    NSURL *url = [NSURL URLWithString:pUrl];
    NSData *data =    [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:data];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];//请求头
    NSURLSessionConfiguration *defaultConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:defaultConfig];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSURLSessionTask *task = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if(!error){
            NSData *data = responseObject;
            NSString *strData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            if (success) {
                success(strData);
            }
        }
        else{
            if (fail) {
                fail(error);
            }
        }
    }];
    [task resume];

}

-(void)downloadByAFNet:(NSString *)pUrl :(NSURL *)filePath paramater:(SuccessBlock) success paramater:(FailedBlock) fail{
    NSURL *URL = [NSURL URLWithString:pUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return filePath;
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if(!error){
            NSString *savedPath = [NSString stringWithContentsOfURL:filePath encoding:NSUTF8StringEncoding error:nil];
            if (success) {
                success(savedPath);
            }
        }
        else{
            if (fail) {
                fail(error);
            }
        }
    }];
    [downloadTask resume];
}

-(void)uploadByAFNet:(NSString *)pUrl : (NSURL *)filePath paramater:(SuccessBlock) success paramater:(FailedBlock) fail{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:pUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithRequest:request fromFile:filePath progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if(!error){
            NSData *data = responseObject;
            NSString *strData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            if (success) {
                success(strData);
            }
        }
        else{
            if (fail) {
                fail(error);
            }
        }
    }];
    [uploadTask resume];
}


+(instancetype) sharedHttpUtils{
    static id _instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

@end
