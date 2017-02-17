//
//  ViewController.m
//  Demo
//
//  Created by jxn on 2017/1/5.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "BaseViewController.h"
#import "ViewController.h"
#import "SecondViewController.h"
#import "NewTableViewController.h"
#import "NewImageViewController.h"
#import "SaveInfoViewController.h"
#import "NetViewController.h"
#import "AFNetWorkingViewController.h"
#import "SQLiteViewController.h"
#import "GestureViewController.h"
#import "ContactsViewController.h"
#import "NotificationViewController.h"
#import "SlideMenuViewController.h"
#import "TabBarViewController.h"
#import "ToastViewController.h"
#import "AnimViewController.h"
#import "ViewUtils.h"
#import "UIScrollViewViewController.h"

#import "NSObject+Ext.h"
#import "Student.h"
#import "MoreViewController.h"
@interface ViewController ()

@end

@implementation ViewController
UIVisualEffectView *view;
/**
 * 第二个页面返回的数据
 */
-(void)PassValue:(NSString *)value{
    self.navigationItem.title = value;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    Student *stu = [[Student alloc] init];
//    stu.age = 18;
//    stu.sex = @"男";
//    stu.name = @"张三";
//    NSArray *array = @[@"1",@"2",@"3"];
//    [stu setValue:array forKey:@"array"];
//    NSDictionary *dict = [stu dictionaryFromModel];
//    NSLog(@"%@",dict);
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"更多" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    self.navigationItem.rightBarButtonItem = right;
}
-(void)rightClick{
    MoreViewController *cv = [[MoreViewController alloc] init];
    [self nextController:cv :@"more"];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    view = [ViewUtils BlurEffect:self.view :view];
}
- (IBAction)gotoTableView:(UIButton *)sender {
    NewTableViewController *cv = [self.storyboard instantiateViewControllerWithIdentifier:@"tableviewcv"];
    [self nextController:cv :@"列表"];
    
}
- (IBAction)gotoImageView:(id)sender {
    NewImageViewController *imageViewCv = [self.storyboard instantiateViewControllerWithIdentifier:@"imageviewCV"];
    [self nextController:imageViewCv :@"选择照片"];
}

- (IBAction)nextVC:(UIButton *)sender {
    SecondViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"secondvc"];
    vc.delegate = self;
    vc.value = @"传参数1234567890poiuyw";
    [self nextController:vc :@"导航栏"];
    
}
- (IBAction)gotoSave:(UIButton *)sender {
    SaveInfoViewController *saveVc = [self.storyboard instantiateViewControllerWithIdentifier:@"saveinfo"];
    [self nextController:saveVc :@"数据存储"];
}
- (IBAction)gotoHttpRequest:(UIButton *)sender {
    NetViewController *netcv = [self.storyboard instantiateViewControllerWithIdentifier:@"netvc"];
    [self nextController:netcv :@"网络请求"];
}
- (IBAction)gotoGestureVC:(id)sender {
    GestureViewController *gestureVC = [[GestureViewController alloc] initWithNibName:@"GestureViewController" bundle:nil];
    [self nextController:gestureVC :@"手势识别"];
}
- (IBAction)gotoAFNetWorking:(UIButton *)sender {
    AFNetWorkingViewController *netVc = [self.storyboard instantiateViewControllerWithIdentifier:@"afnetvc"];
    [self nextController:netVc :@"AFNetWorking"];
}
- (IBAction)gotoSqlite:(UIButton *)sender {
    SQLiteViewController *sqliteVc = [[SQLiteViewController alloc] initWithNibName:@"SQLiteViewController" bundle:nil];
    [self nextController:sqliteVc :@"数据库使用"];
}
- (IBAction)gotoContactVc:(id)sender {
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 9){
        ContactsViewController *contactVc =[[ContactsViewController alloc] initWithNibName:@"ContactsViewController" bundle:nil];
        [self nextController:contactVc :@"读取联系人"];
    }
}
- (IBAction)gotoNotification:(id)sender {
    NotificationViewController *notificationVC = [[NotificationViewController alloc] initWithNibName:@"NotificationViewController" bundle:nil];
    [self nextController:notificationVC :@"通知"];
}
- (IBAction)gotoSlideMenuVC:(id)sender {
    SlideMenuViewController *slideMenuVC = [[SlideMenuViewController alloc] initWithNibName:@"SlideMenuViewController" bundle:nil];
    [self nextController:slideMenuVC :@"侧滑菜单"];
}
- (IBAction)gotoTabBarVC:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"tabBar" bundle:nil];
    TabBarViewController *tabBarVC = [sb instantiateViewControllerWithIdentifier:@"tabbarvc"];
    [self nextController:tabBarVC :@"tabBar使用"];
}
- (IBAction)gotoToastVC:(id)sender {
    ToastViewController *toastCV = [[ToastViewController alloc] initWithNibName:@"ToastViewController" bundle:nil];
    [self nextController:toastCV :@"toast" ];
}
- (IBAction)gotoAnim:(id)sender {
    AnimViewController *animVC = [[AnimViewController alloc] initWithNibName:@"AnimViewController" bundle:nil];
    [self nextController:animVC :@"IOS动画" ];
}

- (IBAction)gotoScrollview:(id)sender {
    UIScrollViewViewController *scrollviewVC = [[UIScrollViewViewController alloc] init];
    [self nextController:scrollviewVC :@"UIScrollViewVC"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
