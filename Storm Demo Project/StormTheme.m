//
//  Theme.m
//  Storm Demo Project
//
//  Created by Simon Mitchell on 27/10/2014.
//  Copyright (c) 2014 threesidedcube. All rights reserved.
//

#define TSCMainColor [[NSBundle mainBundle] infoDictionary][@"TSCAppTintColor"]
#define TSCStatusBarStyle [[NSBundle mainBundle] infoDictionary][@"TSCStatusBarStyle"]

#import "StormTheme.h"
@import ThunderBasics;

@implementation StormTheme

- (UIColor *)mainColor
{
    return [UIColor colorWithHexString:TSCMainColor];
}

- (UIColor *)primaryLabelColor
{
    if ([TSCStatusBarStyle isEqualToString:@"White"]) {
        return [UIColor whiteColor];
    } else {
        return [UIColor blackColor];
    }
}

@end
