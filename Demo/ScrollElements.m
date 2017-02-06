//
//  ScrollElements.m
//  Demo
//
//  Created by jinxinnan on 2017/2/6.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "ScrollElements.h"

@interface ScrollElements()

@end

@implementation ScrollElements

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"elements" owner:nil options:nil] objectAtIndex:0];
    }
    return self;
}
-(CGFloat)getHeight{
    CGFloat height = 0;
    for (int i=0; i<self.subviews.count; i++) {
        height += self.subviews[i].bounds.size.height;
        if (i>0) {
            height += 10;
        }
    }
    return height;
}

@end
