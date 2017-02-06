//
//  BaseViewController.m
//  Demo
//
//  Created by jxn on 2017/1/5.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    UIBarButtonItem *back =[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    [self.navigationItem setBackBarButtonItem:back];
    [super viewDidLoad];
}

-(void)nextController:(UIViewController *) pVC :(NSString *) title{

    [pVC setTitle:title];
    [self.navigationController pushViewController:pVC animated:YES];
    
}
-(void)backClick{
    NSLog(@"click");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
