//
//  ToastViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/1/18.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "ToastViewController.h"
#import "UIView+Toast.h"

@interface ToastViewController ()

@end

@implementation ToastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showToast:(id)sender {
    //最基本使用 默认3秒
//    [self.view makeToast:@"This is a piece of toast"];
    //设置时间和位置
//    [self.view makeToast:@"This is a piece of toast"
//                duration:3.0
//                position:CSToastPositionCenter];
    //网络加载 avtivity
    [self.view makeToastActivity:CSToastPositionCenter];
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        sleep(3);
        [self.view hideToastActivity];
    }];
    [thread start];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
