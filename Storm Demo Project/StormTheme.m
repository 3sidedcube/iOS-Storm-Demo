//
//  Theme.m
//  Storm Demo Project
//
//  Created by Simon Mitchell on 27/10/2014.
//  Copyright (c) 2014 threesidedcube. All rights reserved.
//

#define TSCMainColor [[NSBundle mainBundle] infoDictionary][@"TSCMainColor"]

#import "StormTheme.h"
@import ThunderBasics;

@implementation StormTheme

- (UIColor *)mainColor
{
    return [UIColor colorWithHexString:TSCMainColor];
}

@end
