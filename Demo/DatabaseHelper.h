//
//  DatabaseHelper.h
//  Demo
//
//  Created by jinxinnan on 2017/1/12.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface DatabaseHelper : NSObject
+ (NSMutableArray *)getAllStudents;
+ (Student *)getStudentWithID:(NSInteger)aID;
+ (BOOL)insertStudent:(Student *)aStudent;
+ (BOOL)updateStudentName:(NSString *)aName byID:(NSInteger)aID;
+ (BOOL)deleteStudentWithID:(NSInteger)aID;
@end
