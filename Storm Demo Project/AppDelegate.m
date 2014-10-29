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
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [TSCThemeManager setSharedTheme:[StormTheme new]];
    self.window.tintColor = [UIColor blackColor];
    
    self.window.rootViewController = [TSCAppViewController new];
    
    [self.window makeKeyAndVisible];
        
    return YES;
}

@end
