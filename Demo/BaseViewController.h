//
//  BaseViewController.h
//  Demo
//
//  Created by jxn on 2017/1/5.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BaseViewController : UIViewController

-(void)nextController:(UIViewController *) pVC :(NSString *) title;
-(void)backClick;
@end
