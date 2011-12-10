//
//  NewEmployeeViewController.m
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/10.
//  Copyright (c) 2011年 Gowalla. All rights reserved.
//

#import "NewEmployeeViewController.h"

@implementation NewEmployeeViewController
@synthesize salaryAmountLabel = _salaryAmountLabel;

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"New Employee", nil);
    
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self.navigationController action:@selector(dismissModalViewControllerAnimated:)] autorelease];
}

#pragma mark - IBAction

- (IBAction)salarySliderDidChangeValue:(id)sender {
    UISlider *salarySlider = (UISlider *)sender;
    
    NSNumberFormatter *numberFormatter = [[[NSNumberFormatter alloc] init] autorelease];
    [numberFormatter setLocale:[NSLocale currentLocale]];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setRoundingIncrement:[NSNumber numberWithInteger:1000]];
    
    self.salaryAmountLabel.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:salarySlider.value]];
}

@end
