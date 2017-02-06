//
//  SQLiteViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/1/12.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "SQLiteViewController.h"
#import "Student.h"
#import "DatabaseHelper.h"
#import "DataBase.h"
#import "NSObject+Ext.h"
#import "JsonOperation.h"

@interface SQLiteViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UITextField *No;
@property (weak, nonatomic) IBOutlet UITextField *sex;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *age;

@end

@implementation SQLiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [DataBase openDB];
    NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS Student (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, sex TEXT)";
    [DataBase execSql:sqlCreateTable];
    [DataBase closeDB];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)save:(id)sender {
    Student *student = [[Student alloc] init];
    NSInteger no = 0;
    no = [_No.text intValue];
    [student setID:no];
    [student setSex:_sex.text];
    [student setName:_name.text];
    [student setAge:[_age.text intValue]];
    [DatabaseHelper insertStudent:student];
    
    NSDictionary *dict = [self getDictionaryFromObject_Ext:student];
    NSLog(@"%@",dict);
    
    [JsonOperation convertToJSONData:dict];
}
- (IBAction)get:(id)sender {
    Student *student = [DatabaseHelper getStudentWithID:[_No.text intValue]];
    
    NSString *result = [NSString stringWithFormat:@"查询结果：%ld,%@,%@,%ld",(long)student.ID,student.sex,student.name,student.age];
    [_resultLabel setText:result];
}

@end
