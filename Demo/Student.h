//
//  Student.h
//  Demo
//
//  Created by jinxinnan on 2017/1/12.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
    @property (nonatomic, assign) NSInteger ID;
    @property (nonatomic, retain) NSString *name;
    @property (nonatomic, retain) NSString *sex;
    @property (nonatomic, assign) NSInteger age;
@end
