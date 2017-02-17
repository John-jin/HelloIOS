//
//  MoreView.m
//  Demo
//
//  Created by jinxinnan on 2017/2/14.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "MoreView.h"

@interface MoreView()

@end

@implementation MoreView

-(instancetype)init{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"MoreView" owner:nil options:nil] objectAtIndex:0];
    }
    return self;
}
- (IBAction)gotoToolBar:(id)sender {
    if (self.delegate) {
        [self.delegate buttonBeClicked:sender];
    }
}
- (IBAction)gotoPicker:(id)sender {
    if (self.delegate) {
        [self.delegate buttonBeClicked:sender];
    }
}
- (IBAction)gotoPage:(id)sender {
    if (self.delegate) {
        [self.delegate buttonBeClicked:sender];
    }
}
- (IBAction)gotoThread:(id)sender {
    if (self.delegate) {
        [self.delegate buttonBeClicked:sender];
    }
}
@end
