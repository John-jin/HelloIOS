//
//  DataBase.m
//  Demo
//
//  Created by jinxinnan on 2017/1/12.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "DataBase.h"
#import "sqlite3.h"

#define FILE_NAME @"Database.sqlite"

static sqlite3 *db = nil;
@implementation DataBase

+(void)execSql:(NSString *)sql
{
    char *err;
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库操作数据失败!");
    }
}

//打开数据库
+(sqlite3 *)openDB
{
    if (!db) {
        //1 获取document文件夹的路径
        //参数1: 文件夹的名字 参数2: 查找域 参数3: 是否使用绝对路径
        NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        //获取数据库文件的路径
        NSString *dbPath = [docPath stringByAppendingPathComponent:FILE_NAME];
        sqlite3_open([dbPath UTF8String], &db);
    }
    return db;
}

//关闭数据库
+(void)closeDB
{
    sqlite3_close(db);
    db = nil;
}
@end
