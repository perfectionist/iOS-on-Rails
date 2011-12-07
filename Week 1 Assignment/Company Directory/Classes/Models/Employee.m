//
//  Employee.m
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/05.
//  Copyright (c) 2011年 CabForward. All rights reserved.
//

#import "Employee.h"

static NSDate * BirthdayWithMonthDayYear(NSUInteger month, NSUInteger day, NSUInteger year) {
    NSCalendar *gregorianCalendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    
    NSDateComponents *birthdayComponents = [[[NSDateComponents alloc] init] autorelease];
    [birthdayComponents setMonth:month];
    [birthdayComponents setDay:day];
    [birthdayComponents setYear:year];
    
    return [gregorianCalendar dateFromComponents:birthdayComponents];
}

@implementation Employee
@synthesize name = _name;
@synthesize jobTitle = _jobTitle;
@synthesize birthday = _birthday;
@synthesize salary = _salary;

- (id)initWithName:(NSString *)name {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.name = name;
    
    return self;
}

- (void)dealloc {
    [_name release];
    [_jobTitle release];
    [_birthday release];
    [_salary release];
    [super dealloc];
}

+ (NSArray *)sampleListOfEmployees {
    NSMutableArray *mutableEmployees = [NSMutableArray array];
    
    Employee *peterGibbons = [[[Employee alloc] initWithName:@"Peter Gibbons"] autorelease];
    peterGibbons.jobTitle = @"Programmer";
    peterGibbons.birthday = BirthdayWithMonthDayYear(6, 5, 1967);
    peterGibbons.salary = [NSNumber numberWithInteger:58000];
    [mutableEmployees addObject:peterGibbons];
    
    Employee *michaelBolton = [[[Employee alloc] initWithName:@"Michael Bolton"] autorelease];
    michaelBolton.jobTitle = @"Programmer";
    michaelBolton.birthday = BirthdayWithMonthDayYear(2, 20, 1967);
    michaelBolton.salary = [NSNumber numberWithInteger:58000];
    [mutableEmployees addObject:michaelBolton];
    
    Employee *samirNagheenanajar = [[[Employee alloc] initWithName:@"Samir Nagheenanajar"] autorelease];
    samirNagheenanajar.jobTitle = @"Programmer";
    samirNagheenanajar.birthday = BirthdayWithMonthDayYear(2, 12, 1972);
    samirNagheenanajar.salary = [NSNumber numberWithInteger:58000];
    [mutableEmployees addObject:samirNagheenanajar];
    
    Employee *billLumbergh = [[[Employee alloc] initWithName:@"Bill Lumbergh"] autorelease];
    billLumbergh.jobTitle = @"Division Vice President";
    billLumbergh.birthday = BirthdayWithMonthDayYear(9, 20, 1956);
    billLumbergh.salary = [NSNumber numberWithInteger:144000];
    [mutableEmployees addObject:billLumbergh];
 
    return [NSArray arrayWithArray:mutableEmployees];
}

@end
