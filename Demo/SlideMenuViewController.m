//
//  SlideMenuViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/1/16.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "SlideMenuViewController.h"
#import "GestureViewController.h"

@interface SlideMenuViewController ()

@property (weak, nonatomic) IBOutlet UIView *slideMenu;
@property (weak, nonatomic) IBOutlet UIView *mainMenu;
@property (assign, nonatomic) CGFloat    x;
@property (assign,nonatomic) BOOL isFirst;
@property (assign,nonatomic) CGFloat startX;
@end

@implementation SlideMenuViewController
UIPanGestureRecognizer *slidePan;
MoveDirection pDirection;
- (void)viewDidLoad {
    [super viewDidLoad];
    _isFirst = YES;
    slidePan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan)];
    [_mainMenu addGestureRecognizer:slidePan];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)pan{
    CGPoint translation = [slidePan translationInView:_mainMenu];
    if(slidePan.state == UIGestureRecognizerStateEnded){
        _isFirst = YES;
        if (_mainMenu.frame.origin.x<0) {
            [_mainMenu setFrame:CGRectMake(0, 0, slidePan.view.frame.size.width, slidePan.view.frame.size.height)];
        }
        if (_mainMenu.frame.origin.x>[UIScreen mainScreen].bounds.size.width * 0.75*0.5) {
            [_mainMenu setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 0.75, 0, slidePan.view.frame.size.width, slidePan.view.frame.size.height)];
        }else{
            [_mainMenu setFrame:CGRectMake(0, 0, slidePan.view.frame.size.width, slidePan.view.frame.size.height)];
        }
    }
    if (_mainMenu.frame.origin.x<0) {
        return;
    }
    if(translation.x>= [UIScreen mainScreen].bounds.size.width * 0.75){
        return;
    }
    NSLog(@"正在拖动%f",translation.x);
    if (_isFirst) {
        _startX = _mainMenu.frame.origin.x;
        _isFirst = NO;
    }else
        [_mainMenu setFrame:CGRectMake(translation.x+_startX, 0, slidePan.view.frame.size.width, slidePan.view.frame.size.height)];
    [slidePan setTranslation:translation inView:_mainMenu];
    
  
}
@end
