//
//  Employee.m
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/05.
//  Copyright (c) 2011年 CabForward. All rights reserved.
//

#import "Employee.h"

@implementation Employee

// @todo Synthesize properties in interface
@synthesize name=_name;
@synthesize jobTitle=_jobTitle;
@synthesize birthday=_birthday;
@synthesize salary=_salary;

- (id)initWithName:(NSString *)name {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    // @todo Set name
    _name=name;
    return self;
}

- (void)dealloc {
    // @todo Release instance variables from properties
    [super dealloc];
}

+ (NSArray *)sampleListOfEmployees {
    // @todo Create a list of a couple employees with made-up data
    return [NSArray array];
}

@end
