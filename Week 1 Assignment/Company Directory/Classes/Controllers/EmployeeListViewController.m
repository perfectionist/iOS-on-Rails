//
//  EmployeeListViewController.m
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/05.
//  Copyright (c) 2011年 CabForward. All rights reserved.
//

#import "EmployeeListViewController.h"
#import "Employee.h"
#import "EmployeeViewController.h"

@implementation EmployeeListViewController

@synthesize employees = _employees;

// TODO: Release instance variables from properties - DONE
- (void)dealloc {
    [self.employees release];
    [super dealloc];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Company Directory", nil);
    self.employees = [Employee sampleListOfEmployees];
    
//    [self.tableView reloadData];
//    [self.tableView setShowsVerticalScrollIndicator:YES];
//    [self.tableView setScrollEnabled:YES];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([self.tableView indexPathForSelectedRow]) {
        [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// TODO: Return a number of cells based on the employees array - DONE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.employees count]; 
}

// TODO: Configure your table view cell for the corresponding employee - DONE
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    Employee *employee = [self.employees objectAtIndex:[indexPath row]];
//    NSLog(@"%@", employee);
//    NSLog(@"%d", [indexPath row]);
    [[cell textLabel] setText:employee.name];
    [[cell detailTextLabel] setText:employee.jobTitle];
    
    return cell;
}

#pragma mark - UITableViewDelegate
// TODO: Create and push a new view configured for the corresponding employee - DONE
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Employee *employee = [self.employees objectAtIndex:indexPath.row];
    EmployeeViewController *viewController = [[[EmployeeViewController alloc] initWithEmployee:employee] autorelease];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
