//
//  SecondViewController.h
//  Demo
//
//  Created by jxn on 2017/1/5.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "BaseViewController.h"
#import "ViewController.h"
#import "PutExtra.h"


@interface SecondViewController : BaseViewController
@property(nonatomic,assign) NSObject<PutExtraDelegate> *delegate;
@property(nonatomic,strong) NSString *value;
@end
