//
//  UIScrollViewViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/2/6.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "UIScrollViewViewController.h"
#import "ScrollElements.h"
#import "Tools.h"

@interface UIScrollViewViewController ()

@end

@implementation UIScrollViewViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    ScrollElements *elements = [[ScrollElements alloc] init];
    CGFloat height = elements.getHeight;
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [Tools getScreenWidth], [Tools getScreenHeight])];
    [scrollview addSubview:elements];
    [self.view addSubview:scrollview];
    scrollview.contentSize = CGSizeMake([Tools getScreenWidth], height);
    
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
