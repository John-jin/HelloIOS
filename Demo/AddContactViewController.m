//
//  AddContactViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/1/16.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "AddContactViewController.h"
#import <Contacts/Contacts.h>

@interface AddContactViewController ()
@property (weak, nonatomic) IBOutlet UITextField *familyName;
@property (weak, nonatomic) IBOutlet UITextField *givenName;
@property (weak, nonatomic) IBOutlet UITextField *mobile;
@property (weak, nonatomic) IBOutlet UITextField *iphone;

@end

@implementation AddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changed) name:CNContactStoreDidChangeNotification object:nil];
}
- (IBAction)save:(id)sender {
    CNMutableContact *contact = [[CNMutableContact alloc] init];
    contact.familyName = self.familyName.text;
    contact.givenName = self.givenName.text;
    
    CNPhoneNumber *mobileNum = [[CNPhoneNumber alloc] initWithStringValue:self.mobile.text];
    CNLabeledValue *mobileNumberValue = [[CNLabeledValue alloc] initWithLabel:CNLabelPhoneNumberMobile value:mobileNum];
    
    CNPhoneNumber *iphoneNum = [[CNPhoneNumber alloc] initWithStringValue:self.iphone.text];
    CNLabeledValue *iphoneValue = [[CNLabeledValue alloc] initWithLabel:CNLabelPhoneNumberiPhone value:iphoneNum];
    
    contact.phoneNumbers = @[mobileNumberValue,iphoneValue];
    
    CNSaveRequest *request = [[CNSaveRequest alloc] init];
    [request addContact:contact toContainerWithIdentifier:nil];
    
    // 获取通讯录
    CNContactStore *store = [[CNContactStore alloc] init];
    // 保存联系人
    [store executeSaveRequest:request error:nil];
}
-(void)changed{
    NSLog(@"添加成功");
}
- (void)didReceiveMemoryWarning {
}


@end
