//
//  AnimViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/1/18.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "AnimViewController.h"

@interface AnimViewController ()
@property (weak, nonatomic) IBOutlet UIView *myView;

@end

@implementation AnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pinyi:(id)sender {
    [UIView animateWithDuration:3 animations:^{
        CGPoint point = _myView.center;
        point.y += 150;
        [_myView setCenter:point];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:3 animations:^{
            CGPoint point = _myView.center;
            point.y -= 150;
            [_myView setCenter:point];
        }];
    }];
}
- (IBAction)rotate:(id)sender {
    CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    animation.fromValue = 0;
    animation.toValue =  [NSNumber numberWithFloat: M_PI * 2];
    animation.duration  = 3;
    animation.autoreverses = NO;
    animation.fillMode =kCAFillModeForwards;
    animation.repeatCount = 0;
    [_myView.layer addAnimation:animation forKey:nil];
}
- (IBAction)scale:(id)sender {
    [UIView animateWithDuration:2 animations:^{
        _myView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        _myView.alpha = 0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2 animations:^{
            _myView.transform = CGAffineTransformIdentity;
            _myView.alpha = 1;
        }];
    }];
}


@end
