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

// TODO: Synthesize properties in interface - DONE
@synthesize name=_name;
@synthesize jobTitle=_jobTitle;
@synthesize birthday=_birthday;
@synthesize salary=_salary;

// TODO: Set name - DONE
- (id)initWithName:(NSString *)name {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    _name=name;
    return self;
}

- (void)dealloc {
    // @todo Release instance variables from properties
    [_name release];
    [_jobTitle release];
    [_birthday release];
    [super dealloc];
}

// TODO: Create a list of a couple employees with made-up data - DONE
+ (NSArray *)sampleListOfEmployees {
    // Total Random set of current and past employees ;-)
    Employee *emp1 = [[Employee alloc] initWithName:@"Fred Flintstone"];
    emp1.jobTitle = @"Gravel Pit Operator";
    emp1.birthday = BirthdayWithMonthDayYear(12, 12, 1950);
    emp1.salary = 200.0;
    Employee *emp2 = [[Employee alloc] initWithName:@"George Noory"];
    emp2.jobTitle = @"Radio Broadcaster";
    emp2.birthday = BirthdayWithMonthDayYear(1, 1, 1943);
    emp2.salary = 75000.0;
    Employee *emp3 = [[Employee alloc] initWithName:@"Art Bell"];
    emp3.jobTitle = @"Retired Radio Host";
    emp3.birthday = BirthdayWithMonthDayYear(2, 2, 1935);
    emp3.salary = 0.0;
    
    return [[NSArray alloc] initWithObjects: emp1, emp2, emp3, nil];
}

@end
