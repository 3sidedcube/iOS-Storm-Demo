//
//  AppDelegate.m
//  Testing
//
//  Created by Simon Mitchell on 16/09/2014.
//  Copyright (c) 2014 threesidedcube. All rights reserved.
//

#import "AppDelegate.h"
#import "StormTheme.h"
#import "SDPWelcomeViewController.h"
#import "SDPListPage.h"
#import "SPDStandardListItem.h"
#import "GAI.h"
#import "SPDTracker.h"
@import ThunderCloud;

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    // Setup the window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [TSCStormViewController registerNativePageName:@"intro" toViewControllerClass:[SDPWelcomeViewController class]];
    [TSCStormObject overideClass:[TSCListPage class] with:[SDPListPage class]];
    [TSCStormObject overideClass:[TSCStandardListItem class] with:[SPDStandardListItem class]];
    
    self.window.rootViewController = [TSCAppViewController new];
    
    [self.window makeKeyAndVisible];
    
    // Setup the shared theme
    
    StormTheme *stormTheme = [StormTheme new];
    
    [TSCThemeManager setSharedTheme:stormTheme];
    
    [[TSCDeveloperController sharedController] installDeveloperModeToWindow:self.window currentTheme:stormTheme];
    
    // Customise the app colours based on the values in the info.plist
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    [navigationBar setBarTintColor:[[TSCThemeManager sharedTheme] mainColor]];
    
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
    
    UITabBar *tabBar = [UITabBar appearance];
    tabBar.barTintColor = [UIColor whiteColor];
    
    self.window.tintColor = [[TSCThemeManager sharedTheme] mainColor];
    
    // Register for notifications
    [TSCStormNotificationHelper setupNotifications];
    
    GAI *tracker = [GAI sharedInstance];
    [tracker trackerWithTrackingId:[[NSBundle mainBundle] infoDictionary][@"TSCTrackingId"]];
    [tracker setTrackUncaughtExceptions:YES];
    [tracker setDispatchInterval:20];
    
    [SPDTracker trackEventWithCategory:[[NSBundle mainBundle] infoDictionary][@"CFBundleDisplayName"] action:[[NSBundle mainBundle] infoDictionary][@"CFBundleDisplayName"] label:[[NSBundle mainBundle] infoDictionary][@"CFBundleDisplayName"] value:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stormTrackingEvent:) name:@"TSCStatEventNotification" object:nil];
    
    return YES;
}

// Registering for notifications
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    [TSCStormNotificationHelper registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSLog(@"Token:%@", deviceToken.description);
    [TSCStormNotificationHelper registerPushToken:deviceToken];
}

// Handling developer mode
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[TSCDeveloperController sharedController] appResumedFromBackground];
}

- (void)stormTrackingEvent:(NSNotification *)notification
{
    NSDictionary *dictionary = notification.userInfo;
    
    if ([dictionary[@"type"] isEqualToString:@"event"]) {
        [SPDTracker trackEventWithCategory:[[NSBundle mainBundle] infoDictionary][@"CFBundleDisplayName"] action:dictionary[@"action"] label:dictionary[@"category"] value:nil];
    }
    
    if ([dictionary[@"type"] isEqualToString:@"screen"]) {
        [SPDTracker trackScreenNamed:[NSString stringWithFormat:@"%@ > %@", [[NSBundle mainBundle] infoDictionary][@"CFBundleDisplayName"], dictionary[@"name"]]];
    }
}

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    UINavigationController *navController = (UINavigationController *)self.window.rootViewController.presentedViewController;
    
    if ([navController respondsToSelector:@selector(visibleViewController)]) {
        
        if ([navController.visibleViewController isKindOfClass:[TSCMultiVideoPlayerViewController class]] || [navController.visibleViewController isKindOfClass:[TSCVideoLanguageSelectionViewController class]]) {
            return UIInterfaceOrientationMaskAllButUpsideDown;
        } else {
            return UIInterfaceOrientationMaskPortrait;
        }
    }
    
    if ([navController isKindOfClass:[TSCMultiVideoPlayerViewController class]] || [NSStringFromClass([navController class]) isEqualToString:@"TSCMediaPlayerViewController"]) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    
    return UIInterfaceOrientationMaskPortrait;
}

@end
