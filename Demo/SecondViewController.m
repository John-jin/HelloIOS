//
//  SecondViewController.m
//  Demo
//
//  Created by jxn on 2017/1/5.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end


@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _label.numberOfLines = 0;
    
    [_label setText:self.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)backClick{
    [self.delegate PassValue:@"更改标题"];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.delegate PassValue:@"更改标题"];
}
@end
