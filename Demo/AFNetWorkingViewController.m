//
//  AFNetWorkingViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/1/11.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "AFNetWorkingViewController.h"
#import "AFNetworking/AFNetworking.h"
#import "AFHttpUtils.h"

@interface AFNetWorkingViewController ()
@property (weak, nonatomic) IBOutlet UITextView *tv;

@end

@implementation AFNetWorkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)getByAFNet:(UIButton *)sender {
      [[AFHttpUtils sharedHttpUtils] getByAFNet:@"https://www.baidu.com" paramater:^(NSString *result) {
          [_tv setText:result];
      } paramater:^(NSError *error) {
          NSLog(@"error %@",error.localizedDescription);
      }];
}
- (IBAction)postByAFNet:(UIButton *)sender {
    NSDictionary *dict = @{@"phoneNo":@"18752837508",@"password":@"521732"};
    NSString *urlStr = @"http://192.168.2.54:8080/CourseTable/user!userLogin.action";
    [[AFHttpUtils sharedHttpUtils] postByAFNet:urlStr :dict paramater:^(NSString *result) {
         [_tv setText:result];
    } paramater:^(NSError *error) {
        NSLog(@"error %@",error.localizedDescription);

    }];
}
- (IBAction)downloadByAFNet:(UIButton *)sender {

    
    NSURL *URL = [NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"File downloaded to: %@", filePath);
    }];
    [downloadTask resume];
}
- (IBAction)uploadByAFNet:(UIButton *)sender {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://example.com/upload"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURL *filePath = [NSURL fileURLWithPath:@"file://path/to/image.png"];
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithRequest:request fromFile:filePath progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"Success: %@ %@", response, responseObject);
        }
    }];
    [uploadTask resume];
}


@end
