//
//  ThreadViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/2/15.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "ThreadViewController.h"

@interface ThreadViewController ()

@end

@implementation ThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.NSThread 可以cancel
//    [[[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil] start];
//    [[[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil] start];
    
    //2.GCD 自动管理线程生命周期
    [self useGCD];
}
#pragma 任务 —— 同步（sync） 和 异步（async）
#pragma 队列 —— 串行 FIFO（先进先出） 和 并行 开很多线程，一起执行
#pragma 主队列(ispatch_get_main_queue()) —— 特殊的 串行队列 任何需要刷新 UI 的工作都要在主队列执行，不一定crash，一般耗时的任务都要放到别的线程执行。
-(void) useGCD{
    //串行
    dispatch_queue_t queue1 = dispatch_queue_create("标记", NULL);
//    dispatch_queue_t queue2 = dispatch_queue_create("1", DISPATCH_QUEUE_SERIAL);
//    //并行
//    dispatch_queue_t queue3 = dispatch_queue_create("tk.bourne.testQueue", DISPATCH_QUEUE_CONCURRENT);
//    //全局并行队列
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //阻塞
//    dispatch_sync(queue1, ^{
//        [self run];
//    });
    //不阻塞
//    dispatch_async(queue1, ^{
//        [self run];
//    });
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 50, 30)];
    NSLog(@"%@", [NSThread currentThread]);
    dispatch_async(queue1, ^{
        [self run];
        NSLog(@"%@", [NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%@", [NSThread currentThread]);
            [button setTitle:@"hehe" forState:UIControlStateNormal];
            [self.view addSubview:button];
        });
    });
 
    

}
-(void)run {
    for (int i =0; i<10; i++) {
        NSLog(@"%d",i);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
