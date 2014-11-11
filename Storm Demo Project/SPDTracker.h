//
//  SPDTracker.h
//  Storm Demo Project
//
//  Created by Sam Houghton on 11/11/2014.
//  Copyright (c) 2014 threesidedcube. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPDTracker : NSObject

+ (void)trackScreenNamed:(NSString *)name;
+ (void)trackEventWithCategory:(NSString *)category action:(NSString *)action label:(NSString *)label value:(NSNumber *)value;

@end
