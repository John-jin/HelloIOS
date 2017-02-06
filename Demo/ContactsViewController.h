//
//  ContactsViewController.h
//  Demo
//
//  Created by jinxinnan on 2017/1/13.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "BaseViewController.h"
/**
 * IOS9之后采用Contacts框架访问
 * CNContactStore 封装访问通讯录的接口 查询 保存通讯录
 * CNContact 封装联系人信息数据
 * CNGroup 封装通讯录信息数据 一个组可以有多个联系人。一个联系人也可以有多个组
 * CNContainer 封装通讯录容器信息 一个容器可以包含多个联系人 一个联系人只能隶属于一个容器
 */
@interface ContactsViewController : BaseViewController

@end
