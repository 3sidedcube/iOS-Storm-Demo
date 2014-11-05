//
//  AppDelegate.m
//  Testing
//
//  Created by Simon Mitchell on 16/09/2014.
//  Copyright (c) 2014 threesidedcube. All rights reserved.
//

#import "AppDelegate.h"
#import "StormTheme.h"
@import ThunderCloud;

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [TSCAppViewController new];
    
    [self.window makeKeyAndVisible];
    
    [TSCThemeManager setSharedTheme:[StormTheme new]];
    
    if (![[[NSBundle mainBundle] infoDictionary][@"TSCMainColor"] isEqualToString:@"000000"]) {
        UINavigationBar *navigationBar = [UINavigationBar appearance];
        [navigationBar setBarTintColor:[[TSCThemeManager sharedTheme] mainColor]];
    }
    
    if ([[[NSBundle mainBundle] infoDictionary][@"TSCStatusBarStyle"] isEqualToString:@"Black"]) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        UINavigationBar *navigationBar = [UINavigationBar appearance];
        [navigationBar setTintColor:[UIColor blackColor]];
        [navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
    }
    
    if ([[[NSBundle mainBundle] infoDictionary][@"TSCStatusBarStyle"] isEqualToString:@"White"]) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        UINavigationBar *navigationBar = [UINavigationBar appearance];
        [navigationBar setTintColor:[UIColor whiteColor]];
        [navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    }
    
    
    self.window.tintColor = [[TSCThemeManager sharedTheme] mainColor];
    
    return YES;
}

@end
