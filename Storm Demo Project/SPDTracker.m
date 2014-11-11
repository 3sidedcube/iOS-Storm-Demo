//
//  SPDTracker.m
//  Storm Demo Project
//
//  Created by Sam Houghton on 11/11/2014.
//  Copyright (c) 2014 threesidedcube. All rights reserved.
//

#import "SPDTracker.h"
#import "GAI.h"
#import "GAIFields.h"
#import "GAITracker.h"
#import "GAIDictionaryBuilder.h"

@implementation SPDTracker

+ (void)trackScreenNamed:(NSString *)name
{
    id tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker set:kGAIScreenName value:name];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

+ (void)trackEventWithCategory:(NSString *)category action:(NSString *)action label:(NSString *)label value:(NSNumber *)value
{
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:category action:action label:label value:value] build]];
}

@end
