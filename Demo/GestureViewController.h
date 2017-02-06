//
//  GestureViewController.h
//  Demo
//
//  Created by jinxinnan on 2017/1/12.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "BaseViewController.h"
typedef enum : NSInteger {
    kMoveDirectionNone,
    kMoveDirectionUp,
    kMoveDirectionDown,
    kMoveDirectionRight,
    kMoveDirectionLeft
} MoveDirection;

@interface GestureViewController : BaseViewController

@end
