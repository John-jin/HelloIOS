//
//  NotificationViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/1/16.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "NotificationViewController.h"

@interface NotificationViewController ()

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //可能多次调用 以最后一次为准
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showKeyboard:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissKeyboard:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)showKeyboard :(NSNotification*)notification{
    CGRect keyboardFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSLog(@"高度：%f,宽度：%f",keyboardFrame.size.height,keyboardFrame.size.width);
}
-(void)dismissKeyboard :(NSNotification*)notification{
    CGRect keyboardFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSLog(@"高度：%f,宽度：%f",keyboardFrame.size.height,keyboardFrame.size.width);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
