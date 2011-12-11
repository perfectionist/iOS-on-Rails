//
//  EmployeeViewController.h
//  Company Directory
//
//  Created by David Loeffler on 12/9/11.
//  Copyright (c) 2011 Gowalla. All rights reserved.
//

// This controller is for a table view of one employee so we just need to know which one.

#import <UIKit/UIKit.h>
// #import "Employee.h"
// Fix problem with multiple headers - simplify and a little less overhead.
@class Employee;

@interface EmployeeViewController : UITableViewController

@property(readonly, nonatomic, retain) Employee *employee;

-(id) initWithEmployee:(Employee *) employee;

@end
