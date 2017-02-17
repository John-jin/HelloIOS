//
//  SaveInfoViewController.m
//  Demo
//
//  Created by jxn on 2017/1/9.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "SaveInfoViewController.h"

@interface SaveInfoViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation SaveInfoViewController
/*
 * NSUserDefaults 用户基本设置
 *
 * 沙盒
 * Documents  Library  tmp  三个文件夹
 * Documents Itunes同步设备时会备份该目录
 * Library/Caches 保存应用运行时的文件
 * Library/Preference 保存应用偏好设置
 * tmp 保存临时数据 应用关闭可能会删除
 *
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    _userNameLabel.delegate = self;
    [_userNameLabel resignFirstResponder];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
/**
 * NSUserDefaults 不能存储自定义对象
 */
- (IBAction)save:(UIButton *)sender {
    NSString *username = _userNameLabel.text;
    NSString *password = _passwordLabel.text;
    [[NSUserDefaults standardUserDefaults] setObject:username forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:@"password"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)getData:(UIButton *)sender {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *username = [user objectForKey:@"username"];
    NSString *password = [user objectForKey:@"password"];
    
    [_resultLabel setText:[NSString stringWithFormat:@"%@,%@",username,password]];
}
- (IBAction)getFromSandbox:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cacheDir = [paths objectAtIndex:0];
        NSString *filePath = [cacheDir stringByAppendingPathComponent:@"demo"];
    NSArray *data = [NSArray arrayWithContentsOfFile:filePath];
    @try {
        [_resultLabel setText:[NSString stringWithFormat:@"%@,%@",data[0],data[1]]];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_userNameLabel.isFirstResponder) {
        [_userNameLabel resignFirstResponder];
    }else if(_passwordLabel.isFirstResponder){
        [_passwordLabel resignFirstResponder];
    }
}
- (IBAction)saveSandbox:(id)sender {
    //存储的路径
//    NSString *homeDir = NSHomeDirectory();
    //获取Documents目录
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cacheDir = [paths objectAtIndex:0];
    //获取tmp目录
//    NSString *tmpDir = NSTemporaryDirectory();
    //library/cache
//    NSArray *a = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    //例子向Cache 存数据 处理方法一样
    NSString *filePath = [cacheDir stringByAppendingPathComponent:@"demo"];
    NSArray *array = [NSArray arrayWithObjects:_userNameLabel.text,_passwordLabel.text, nil];
    if([array writeToFile:filePath atomically:YES]){
        NSLog(@"写入成功");
    }

}

@end
