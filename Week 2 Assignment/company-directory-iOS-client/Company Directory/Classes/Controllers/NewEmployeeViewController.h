//
//  NewEmployeeViewController.h
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/10.
//  Copyright (c) 2011年 Gowalla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewEmployeeViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, assign) IBOutlet UITextField *nameTextField;
@property (nonatomic, assign) IBOutlet UITextField *jobTitleTextField;
@property (nonatomic, assign) IBOutlet UISlider *salarySlider;
@property (nonatomic, assign) IBOutlet UIDatePicker *birthdayDatePicker;
@property (nonatomic, assign) IBOutlet UILabel *salaryAmountLabel;

- (IBAction)salarySliderDidChangeValue:(id)sender;

@end
