//
//  SegueViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/2/13.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "SegueViewController.h"

@interface SegueViewController ()

@property (weak, nonatomic) IBOutlet UIButton *back;
@property (strong,nonatomic) NSValue *intent;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *segmentedLabel;
@property (weak, nonatomic) IBOutlet UILabel *switchLabel;
@property (weak, nonatomic) IBOutlet UISlider *slide;
@property (weak, nonatomic) IBOutlet UILabel *slideLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation SegueViewController
- (IBAction)switchControl:(id)sender {
    UISwitch *switchView = (UISwitch *)sender;
    if (switchView.isOn) {
        [_switchLabel setText:@"打开"];
    }else
        [_switchLabel setText:@"关闭"];
}
- (IBAction)segmented:(id)sender {
    [_segmentedLabel setText:[NSString stringWithFormat:@"%ld",(long)_segmentedControl.selectedSegmentIndex]];
}
- (IBAction)slideControl:(id)sender {
    float percent = _slide.value;
    [_slideLabel setText:[NSString stringWithFormat:@"%f",percent]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [NSString stringWithFormat:@"%@",_intent];
    [_back addTarget:self action:@selector(onClick:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    _progressView.progress = 0;
    [NSTimer scheduledTimerWithTimeInterval:0.5 repeats:TRUE block:^(NSTimer * _Nonnull timer) {
        _progressView.progress += 0.1;
    }];
}
-(void)onClick:(UIButton *)button forEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
