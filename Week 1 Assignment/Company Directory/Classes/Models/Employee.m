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

-(NSString *)description {
    return [NSString stringWithFormat:@"%@, %@, born %@, making $ %f", self.name, self.jobTitle, [self formatBirthdayString], self.salary]; 
}

-(NSString *)formatBirthdayString {
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    return [dateFormatter stringFromDate:self.birthday];
}


// MARK: - Test data

+ (id) randomEmployee {
    NSArray *randomFirstNames = [NSArray arrayWithObjects:@"Alfred", 
                                                          @"George", 
                                                          @"David", 
                                                          @"Art", 
                                                          @"Sam", 
                                                          @"Jennifer", 
                                                          @"Sally", 
                                                          @"Jill", 
                                                          @"Jimmy", nil];
    NSArray *randomLastNames = [NSArray arrayWithObjects:@"Noory", 
                                                         @"Bell", 
                                                         @"Flintstone", 
                                                         @"Brown", 
                                                         @"Smith", 
                                                         @"Washington", 
                                                         @"Jones", nil];
    int firstNameIndex = rand() % [randomFirstNames count];
    int lastNameIndex = rand() % [randomLastNames count];
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            [randomFirstNames objectAtIndex:firstNameIndex],
                            [randomLastNames objectAtIndex:lastNameIndex]];
    
    NSArray *randomTitlePrefixes = [NSArray arrayWithObjects:@"", 
                                                             @"Junior ", 
                                                             @"Senior ", 
                                                             @"Master ", nil];
    NSArray *randomTitleSuffixes = [NSArray arrayWithObjects:@"Plumber", 
                                                             @"Electrician", 
                                                             @"Carpenter", nil];
    int titlePrefixIndex = rand() % [randomTitlePrefixes count];
    int titlePostfixIndex = rand() % [randomTitleSuffixes count];
    NSString *randomTitle = [NSString stringWithFormat:@"%@%@", 
                             [randomTitlePrefixes objectAtIndex:titlePrefixIndex],
                             [randomTitleSuffixes objectAtIndex:titlePostfixIndex]];
    Employee *randomEmployee = [[Employee alloc] initWithName:randomName];
    randomEmployee.jobTitle = randomTitle;
//    randomEmployee.salary = rand() % 1000000;
    randomEmployee.salary = 50.0f;
    randomEmployee.birthday = BirthdayWithMonthDayYear(rand() % 12, rand() % 28, rand() % 111 + 1900);
//    NSLog(@"Employee %@", randomEmployee);
    return randomEmployee;
}

// TODO: Create a list of a couple employees with made-up data - DONE
+ (NSArray *)sampleListOfEmployees {
    NSMutableArray *randomEmployees = [NSMutableArray array];
    int sampleSize = rand() % 30 + 20;
    // For debugging
    // I am having problems when the number of employees in the sample are 
    sampleSize = 4;
    while (sampleSize > 0) {
        [randomEmployees addObject: [Employee randomEmployee]];
        sampleSize -= 1;
    }
    return [NSArray arrayWithArray:randomEmployees];
}

@end
