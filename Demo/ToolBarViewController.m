//
//  ToolBarViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/2/14.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "ToolBarViewController.h"
#import "RedViewController.h"
#import "GreenViewController.h"
#import "BlueViewController.h"
#import "Tools.h"

@interface ToolBarViewController ()

@end

@implementation ToolBarViewController
    UIStoryboard *sb;
- (void)viewDidLoad {
    [super viewDidLoad];
    sb = [UIStoryboard storyboardWithName:@"tabBar" bundle:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)red:(id)sender {
    RedViewController *redVC = [sb instantiateViewControllerWithIdentifier:@"red"];
    [self nextController:redVC :@""];
}
- (IBAction)green:(id)sender {
    GreenViewController *greenVC = [sb instantiateViewControllerWithIdentifier:@"green"];
    [self nextController:greenVC :@""];
}
- (IBAction)blue:(id)sender {
    BlueViewController *blueVC = [sb instantiateViewControllerWithIdentifier:@"blue"];
    [self nextController:blueVC :@""];
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
