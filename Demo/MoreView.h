//
//  MoreView.h
//  Demo
//
//  Created by jinxinnan on 2017/2/14.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ButtonClickDelegete <NSObject>
@optional
// 当button点击后做的事情
- (void)buttonBeClicked:(id)sender;
@end

@interface MoreView : UIView
//委托回调接口
@property (nonatomic, weak) id <ButtonClickDelegete> delegate;

@end
