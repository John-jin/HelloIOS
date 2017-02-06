//
//  DataBase.h
//  Demo
//
//  Created by jinxinnan on 2017/1/12.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface DataBase : NSObject
+(void)execSql:(NSString *)sql;
+(sqlite3 *)openDB;
+(void)closeDB;
@end
