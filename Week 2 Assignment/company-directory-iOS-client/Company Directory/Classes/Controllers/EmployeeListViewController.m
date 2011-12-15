//
//  EmployeeListViewController.m
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/05.
//  Copyright (c) 2011年 CabForward. All rights reserved.
//

#import "EmployeeListViewController.h"
#import "EmployeeViewController.h"
#import "NewEmployeeViewController.h"

#import "Employee.h"

@implementation EmployeeListViewController
@synthesize employees = _employees;

// Definite our own initialier as per Conway and Hillegass.
- (id)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
    }
    return self;
}

// This is the default initializer for UITableViewController.  We are overriding it to 
// force our style. Page 174 iOS Programming 2nd Edition.
-(id) initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (void)dealloc {
    [_employees release];
    [super dealloc];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad - EmployeeListViewController");
    self.title = NSLocalizedString(@"Company Directory", nil);
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addEmployee:)];
    
    [Employee employeesWithBlock:^(NSArray *employees) {
        self.employees = employees;
        [self.tableView reloadData];
    }];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    NSLog(@"viewDidUnload - EmployeeListViewController");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear - EmployeeListViewController");
    if ([self.tableView indexPathForSelectedRow]) {
        [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    }
    [Employee employeesWithBlock:^(NSArray *employees) {
        self.employees = employees;
        [self.tableView reloadData];
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear - EmployeeListViewController");
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear - EmployeeListViewController");
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear - EmployeeListViewController");
}

#pragma mark - Actions

- (void)addEmployee:(id)sender {
    NewEmployeeViewController *viewController = [[[NewEmployeeViewController alloc] initWithNibName:@"NewEmployeeViewController" bundle:nil] autorelease];
    UINavigationController *navigationController = [[[UINavigationController alloc] initWithRootViewController:viewController] autorelease];
    [self.navigationController presentModalViewController:navigationController animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.employees count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    Employee *employee = [self.employees objectAtIndex:indexPath.row];
    
    cell.textLabel.text = employee.name;
    cell.detailTextLabel.text = employee.jobTitle;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Employee *employee = [self.employees objectAtIndex:indexPath.row];
    EmployeeViewController *viewController = [[[EmployeeViewController alloc] initWithEmployee:employee] autorelease];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
