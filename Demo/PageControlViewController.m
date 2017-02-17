//
//  PageControlViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/2/14.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "PageControlViewController.h"
#import "Tools.h"
@interface PageControlViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *mScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *mPageControl;

@end

@implementation PageControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = [Tools getScreenWidth];
    CGFloat height = [Tools getScreenHeight];
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    redView.backgroundColor = [UIColor redColor];
    [self.mScrollView addSubview:redView];
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(width, 0, width, height)];
    greenView.backgroundColor = [UIColor greenColor];
    [self.mScrollView addSubview:greenView];
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(width*2, 0, width, height)];
    blueView.backgroundColor = [UIColor blueColor];
    [self.mScrollView addSubview:blueView];
    self.mScrollView.delegate = self;
    self.mScrollView.contentSize = CGSizeMake(width*3,0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.mPageControl.currentPage = self.mScrollView.bounds.origin.x/[Tools getScreenWidth];
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
