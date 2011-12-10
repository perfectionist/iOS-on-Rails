//
//  Employee.m
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/05.
//  Copyright (c) 2011年 CabForward. All rights reserved.
//

#import "Employee.h"

#import "AFJSONRequestOperation.h"

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

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.name = [attributes valueForKey:@"name"];
    self.jobTitle = [attributes valueForKey:@"job_title"];
    self.birthday = [NSDate date];
    self.salary = [NSNumber numberWithFloat:[[attributes valueForKey:@"salary"] floatValue]];
    
    return self;
}

- (void)dealloc {
    [_name release];
    [_jobTitle release];
    [_birthday release];
    [_salary release];
    [super dealloc];
}

- (NSString *)formattedBirthdayString {
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    return [dateFormatter stringFromDate:self.birthday];
}

- (NSString *)formattedSalaryString {
    NSNumberFormatter *numberFormatter = [[[NSNumberFormatter alloc] init] autorelease];
    [numberFormatter setLocale:[NSLocale currentLocale]];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    return [numberFormatter stringFromNumber:self.salary];
}

+ (void)employeesWithBlock:(void (^)(NSArray *employees))block {
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/employees.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSMutableArray *mutableEmployees = [NSMutableArray array];
        for (NSDictionary *attributes in [JSON valueForKey:@"employees"]) {
            Employee *employee = [[[Employee alloc] initWithAttributes:attributes] autorelease];
            [mutableEmployees addObject:employee];
        }
        
        if (block) {
            block(mutableEmployees);
        }
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"Error: %@", error);
    }] start];
}


@end
