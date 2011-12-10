//
//  Employee.h
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/05.
//  Copyright (c) 2011年 CabForward. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *jobTitle;
@property (nonatomic, retain) NSDate *birthday;
@property (nonatomic, retain) NSNumber *salary;

- (id)initWithAttributes:(NSDictionary *)attributes;

- (NSString *)formattedBirthdayString;
- (NSString *)formattedSalaryString;

+ (void)employeesWithBlock:(void (^)(NSArray *employees))block;

@end
