//
//  RedViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/1/18.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "RedViewController.h"
#import "Tools.h"

@interface RedViewController ()

@end

@implementation RedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setFrame:CGRectMake(0, 0, [Tools getScreenWidth], [Tools getScreenHeight] -44)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
