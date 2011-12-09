//
//  AppDelegate.h
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/05.
//  Copyright (c) 2011年 CabForward. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
// UIWindow should be readwrite
@property (readwrite, nonatomic, retain) UIWindow *window;
// Keeping readonly and override in implementation file.
@property (readonly, nonatomic, retain) UINavigationController *navigationController;


@end
