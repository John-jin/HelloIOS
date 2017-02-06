//
//  ContactsViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/1/13.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "ContactsViewController.h"
#import "AddContactViewController.h"
#import <Contacts/Contacts.h>

@interface ContactsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(nonatomic,strong) NSMutableArray *contactlist;
@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addContact)];
    self.navigationItem.rightBarButtonItem = addBtn;
    _tableview.delegate = self;
    _tableview.dataSource = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.contactlist = [self findAllContacts];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableview reloadData];
        });
    });
    UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 60)];
    [head setBackgroundColor:[UIColor redColor]];
    [_tableview setTableHeaderView:head];
    UIEdgeInsets inset = UIEdgeInsetsMake(-60, 0, 0, 0);
    [_tableview setContentInset:inset];
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.y;
    if (offset>60||offset<0) {
        return;
    }
    NSLog(@"%f",scrollView.contentOffset.y);
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (scrollView.contentOffset.y<30) {
        NSLog(@"开始刷新");
    }
}
-(void)addContact{
    AddContactViewController *addContactVC = [[AddContactViewController alloc] initWithNibName:@"AddContactViewController" bundle:nil];
    [self nextController:addContactVC :@"添加联系人"];
}

-(NSMutableArray *) findAllContacts{
    NSMutableArray *contacts = [[NSMutableArray alloc] init];
    NSArray *keyToFetch = @[CNContactFamilyNameKey,CNContactGivenNameKey,CNContactPhoneNumbersKey];
    CNContactFetchRequest *fetchRequest = [[CNContactFetchRequest alloc] initWithKeysToFetch:keyToFetch];
    CNContactStore *contactStore = [[CNContactStore alloc] init];
    NSError *error = nil;
    [contactStore enumerateContactsWithFetchRequest:fetchRequest error:&error usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
        if(!error){
            [contacts addObject:contact];
        }else
            NSLog(@"%@",error.description);
    }];
    return contacts;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _contactlist.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identity = @"cell";
    UITableViewCell *cell;
    cell = [self.tableview dequeueReusableCellWithIdentifier:identity];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identity];
    }
    CNMutableContact *contact = _contactlist[indexPath.row];
    NSString *name = [NSString stringWithFormat:@"%@,%@",contact.familyName,contact.givenName];
    cell.textLabel.text = name;
    
    NSArray<CNLabeledValue<CNPhoneNumber *>*> *array = contact.phoneNumbers;
    if (array.count>0) {
        CNLabeledValue<CNPhoneNumber *> *phone = array[0];
        CNPhoneNumber *number = phone.value;
        if ([phone.label isEqualToString:CNLabelPhoneNumberMobile]) {
            NSLog(@"mobile:%@",number.stringValue);
        }else if([phone.label isEqualToString:CNLabelPhoneNumberiPhone]){
            NSLog(@"iPhone");
        }else{
            NSLog(@"其他号码");
        }
        cell.detailTextLabel.text = number.stringValue;
    }
    return cell;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self delContact:_contactlist[indexPath.row]];
    // 从数据源中删除
    [_contactlist removeObjectAtIndex:indexPath.row];
    // 从列表中删除
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//删除联系人
-(BOOL) delContact :(CNContact *)pContact{
    CNMutableContact *contact = [pContact mutableCopy];
    CNSaveRequest *request = [[CNSaveRequest alloc] init];
    [request deleteContact:contact];
    // 获取通讯录
    CNContactStore *store = [[CNContactStore alloc] init];
    // 保存联系人
    [store executeSaveRequest:request error:nil];
    return YES;
}

@end
