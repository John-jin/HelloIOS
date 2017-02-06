//
//  GestureViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/1/12.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "GestureViewController.h"


CGFloat const gestureMinimumTranslation = 20.0 ;


@interface GestureViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UITextView *clickResult;


@end


@implementation GestureViewController
UIPinchGestureRecognizer *pinch;
UIRotationGestureRecognizer *rotate;
UIPanGestureRecognizer *pan;
MoveDirection direction;

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleClick)];
    [self.view addGestureRecognizer:tap];
    
    UITapGestureRecognizer *doubletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClick)];
    doubletap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubletap];
    
    UILongPressGestureRecognizer *longClick = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longClick)];
    [self.view addGestureRecognizer:longClick];
    
    pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch)];
    [self.view addGestureRecognizer:pinch];
    
    rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate)];
    [self.view addGestureRecognizer:rotate];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUp)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDown];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    //拖动和滑动 互斥
    pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan)];
    [self.view addGestureRecognizer:pan];
    
}
-(void)singleClick{
    [_clickResult setText:@"单击"];
}
-(void)doubleClick{
    [_clickResult setText:@"双击"];
}
-(void)longClick{
    [_clickResult setText:@"长按"];
}
-(void)pinch{
    NSLog(@"%f",pinch.scale);
    if (pinch.scale>1) {
        [_clickResult setText:@"放大"];
    }else{
        [_clickResult setText:@"缩小"];
    }
    self.view.transform=CGAffineTransformScale(self.view.transform, pinch.scale, pinch.scale);
}
-(void)rotate{
    CGFloat angle = rotate.rotation;
    if (angle>0) {
        [_clickResult setText:[NSString stringWithFormat:@"顺时针旋转%f",angle]];
    }else
        [_clickResult setText:[NSString stringWithFormat:@"逆时针旋转%f",angle]];
    
}
-(void)swipeUp{
    [_clickResult setText:@"上滑动"];
}
-(void)swipeDown{
    [_clickResult setText:@"下滑动"];
}
-(void)swipeLeft{
    [_clickResult setText:@"左滑动"];
}
-(void)swipeRight{
    [_clickResult setText:@"右滑动"];
}

-(void)pan{
    CGPoint translation = [pan translationInView:self.view];
    if (pan.state == UIGestureRecognizerStateBegan )
        direction = kMoveDirectionNone;
    else if(pan.state == UIGestureRecognizerStateChanged && direction == kMoveDirectionNone){
        direction = [ self determineDirectionIfNeeded:translation];
        switch (direction) {
            case kMoveDirectionUp:
                [_clickResult setText:@"向上拖动"];
                break;
            case kMoveDirectionDown:
                [_clickResult setText:@"向下拖动"];
                break;
            case kMoveDirectionLeft:
                [_clickResult setText:@"向左拖动"];
                break;
            case kMoveDirectionRight:
                [_clickResult setText:@"向右拖动"];
                break;
            default:
                break;
        }
    }
}
- (MoveDirection )determineDirectionIfNeeded:( CGPoint )translation
{
    if (direction != kMoveDirectionNone)
        return direction;
    // determine if horizontal swipe only if you meet some minimum velocity
    if (fabs(translation.x) > gestureMinimumTranslation)
    {
        BOOL gestureHorizontal = NO;
        if (translation.y == 0.0 )
            gestureHorizontal = YES;
        else
            gestureHorizontal = (fabs(translation.x / translation.y) > 5.0 );
        if (gestureHorizontal)
        {
            if (translation.x > 0.0 )
                return kMoveDirectionRight;
            else
                return kMoveDirectionLeft;
        }
    }
    // determine if vertical swipe only if you meet some minimum velocity
    else if (fabs(translation.y) > gestureMinimumTranslation)
    {
        BOOL gestureVertical = NO;
        if (translation.x == 0.0 )
            gestureVertical = YES;
        else
            gestureVertical = (fabs(translation.y / translation.x) > 5.0 );
        if (gestureVertical)
        {
            if (translation.y > 0.0 )
                return kMoveDirectionDown;
            else
                return kMoveDirectionUp;
        }
    }
    return direction;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
