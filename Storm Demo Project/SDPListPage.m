//
//  SDPListPage.m
//  Storm Demo Project
//
//  Created by Sam Houghton on 10/11/2014.
//  Copyright (c) 2014 threesidedcube. All rights reserved.
//

#import "SDPListPage.h"

@implementation SDPListPage

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.1)];
}

@end
