//
//  NewEmployeeViewController.m
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/10.
//  Copyright (c) 2011年 Gowalla. All rights reserved.
//

#import "NewEmployeeViewController.h"

#import "CompanyDirectoryAPIClient.h"

@implementation NewEmployeeViewController
@synthesize nameTextField = _nameTextField;
@synthesize jobTitleTextField = _jobTitleTextField;
@synthesize salarySlider = _salarySlider;
@synthesize birthdayDatePicker = _birthdayDatePicker;
@synthesize salaryAmountLabel = _salaryAmountLabel;

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"New Employee", nil);
    
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self.navigationController action:@selector(dismissModalViewControllerAnimated:)] autorelease];
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(create:)] autorelease];
}

#pragma mark - IBAction

- (void)create:(id)sender {
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:self.nameTextField.text forKey:@"name"];
    [mutableParameters setValue:self.jobTitleTextField.text forKey:@"job_title"];
    [mutableParameters setValue:[NSNumber numberWithFloat:self.salarySlider.value] forKey:@"salary"];
    [mutableParameters setValue:[self.birthdayDatePicker.date description] forKey:@"birthday"];
    
    [[CompanyDirectoryAPIClient sharedClient] postPath:@"/employees" parameters:[NSDictionary dictionaryWithObject:mutableParameters forKey:@"employee"] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
//    NSLog(@"Name: %@, Job: %@, Salary: %f, Birthday: %@", self.nameTextField.text, self.jobTitleTextField.text, self.salarySlider.value, self.birthdayDatePicker.date);
}

- (IBAction)salarySliderDidChangeValue:(id)sender {
    UISlider *salarySlider = (UISlider *)sender;
    
    NSNumberFormatter *numberFormatter = [[[NSNumberFormatter alloc] init] autorelease];
    [numberFormatter setLocale:[NSLocale currentLocale]];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setRoundingIncrement:[NSNumber numberWithInteger:1000]];
    
    self.salaryAmountLabel.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:salarySlider.value]];
}

@end
