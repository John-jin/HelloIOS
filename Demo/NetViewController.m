//
//  NetViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/1/10.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "NetViewController.h"
#import "HttpTools.h"

@interface NetViewController ()<HttpResult>
@property (weak, nonatomic) IBOutlet UITextView *textview;

@end


@implementation NetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)httpResponse:(NSString *)result{
    [_textview setText:result];
}

- (IBAction)getRequest:(UIButton *)sender {
    HttpTools *httpTools = [[HttpTools alloc] init];
    httpTools.delegate = self;
    [httpTools getMethod:@"https://www.baidu.com" paramatar:^(NSString *result) {
        [self httpResponse:result];
    }];
}
- (IBAction)postRequest:(UIButton *)sender {
    HttpTools *httpTools = [[HttpTools alloc] init];
    httpTools.delegate = self;
    NSDictionary *dict = @{@"phoneNo":@"18752837508",@"password":@"521732"};
    [httpTools postMethod:@"http://192.168.2.54:8080/CourseTable/user!userLogin.action" :dict];
}
- (IBAction)downloadFile:(UIButton *)sender {
}
- (IBAction)uploadFile:(UIButton *)sender {
}

@end
