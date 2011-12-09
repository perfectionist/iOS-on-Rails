//
//  AppDelegate.m
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/05.
//  Copyright (c) 2011年 CabForward. All rights reserved.
//

#import "AppDelegate.h"

#import "EmployeeListViewController.h"

@implementation AppDelegate
@synthesize window = _window;
@synthesize navigationController = _navigationController;

- (void)dealloc {
    [_window release];
    [_navigationController release];
    [super dealloc];
}


#pragma mark - setter override

// These two setter methods overwrite the readonly property attribute for UIWindow 
// and UINavigationController

-(void)setWindow:(UIWindow *)window {
    [_window release];
    _window = [window retain];
}

-(void)setNavigationController:(UINavigationController *)navigationController {
    [_navigationController release];
    _navigationController = [navigationController retain];
}

#pragma mark 

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    EmployeeListViewController *viewController = [[[EmployeeListViewController alloc] initWithStyle:UITableViewStylePlain] autorelease];
    self.navigationController = [[[UINavigationController alloc] initWithRootViewController:viewController] autorelease];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    [self.window addSubview:self.navigationController.view];
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

// MARK: - Testing Mark


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
