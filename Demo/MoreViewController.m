//
//  MoreViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/2/14.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "MoreViewController.h"
#import "Tools.h"
#import "MoreView.h"
#import "ToolBarViewController.h"
#import "PickerViewController.h"
#import "PageControlViewController.h"
#import "ThreadViewController.h"

@interface MoreViewController ()<ButtonClickDelegete>

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [Tools getScreenWidth], [Tools getScreenHeight])];
    [self.view addSubview:scrollView];
    
    MoreView *moreView = [[MoreView alloc] init];
    moreView.delegate = self;
    [scrollView addSubview:moreView];
    scrollView.contentSize = CGSizeMake(0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonBeClicked:(id)sender{
    UIButton *button = (UIButton *)sender;
    if(button.tag==0){
        ToolBarViewController *toolBarViewController = [[ToolBarViewController alloc] initWithNibName:@"ToolBarViewController" bundle:nil];
        [self.navigationController pushViewController:toolBarViewController animated:YES];
    }else if(button.tag == 1){
        PickerViewController *pickerViewController = [[PickerViewController alloc] initWithNibName:@"PickerViewController" bundle:nil];
        [self.navigationController pushViewController:pickerViewController animated:YES];
    }else if(button.tag == 2){
        PageControlViewController *pageControlViewController = [[PageControlViewController alloc] initWithNibName:@"PageControlViewController" bundle:nil];
        [self.navigationController pushViewController:pageControlViewController animated:YES];
    }else if(button.tag == 3){
        ThreadViewController *threadViewController = [[ThreadViewController alloc] init];
        [self.navigationController pushViewController:threadViewController animated:YES];
    }
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
