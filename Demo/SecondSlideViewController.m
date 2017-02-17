//
//  SecondSlideViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/2/13.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "SecondSlideViewController.h"
#import "Tools.h"

@interface SecondSlideViewController ()

@end

@implementation SecondSlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,[Tools getScreenWidth], [Tools getScreenHeight])];
    [scrollView setContentSize:CGSizeMake(5.0/3*scrollView.frame.size.width, 0)];
    [scrollView setBackgroundColor:[UIColor redColor]];
    scrollView.showsHorizontalScrollIndicator = FALSE;
    scrollView.bounces = NO;
    [self.view addSubview:scrollView];
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 40, 20)];
    [btn setBackgroundColor:[UIColor blackColor]];
    [btn setTitle:@"左边" forState:UIControlStateNormal];
    [scrollView addSubview:btn];
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
