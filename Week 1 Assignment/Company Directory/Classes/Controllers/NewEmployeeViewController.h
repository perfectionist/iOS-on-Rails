//
//  NewEmployeeViewController.h
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/10.
//  Copyright (c) 2011年 Gowalla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewEmployeeViewController : UIViewController

@property (nonatomic, assign) IBOutlet UILabel *salaryAmountLabel;

- (IBAction)salarySliderDidChangeValue:(id)sender;

@end
