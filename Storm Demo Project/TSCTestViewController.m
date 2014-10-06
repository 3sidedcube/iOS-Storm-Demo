//
//  TSCTestViewController.m
//  Testing
//
//  Created by Sam Houghton on 16/09/2014.
//  Copyright (c) 2014 threesidedcube. All rights reserved.
//

#import "TSCTestViewController.h"
@import ThunderCloud;
@import ThunderBasics;

@interface TSCTestViewController ()

@end

@implementation TSCTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.title = [NSString stringWithLocalisationKey:@"_TEST_STRING"];
//    
//    self.view.backgroundColor = [UIColor whiteColor];
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 200, 100)];
//    label.text = [NSString stringWithLocalisationKey:@"_TEST_STRING"];
//    [self.view addSubview:label];
//    
//    UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 150, 200, 44)];
//    newLabel.text = [NSString stringWithLocalisationKey:@"_TEST_NEW_STRING"];
//    [self.view addSubview:newLabel];
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button addTarget:self action:@selector(showAlertView) forControlEvents:UIControlEventTouchUpInside];
//    [button setTitle:[NSString stringWithLocalisationKey:@"_BUTTON_TITLE"] forState:UIControlStateNormal];
//    [button setBackgroundColor:[UIColor yellowColor]];
//    button.frame = CGRectMake(100, 300, 200, 200);
//    [button sizeToFit];
//    [self.view addSubview:button];
}

- (void)showAlertView
{
//    TSCAlertViewController *alert = [TSCAlertViewController alertControllerWithTitle:[NSString stringWithLocalisationKey:@"_ALERT_TITLE"] message:[NSString stringWithLocalisationKey:@"_ALERT_MESSAGE"] preferredStyle:TSCAlertViewControllerStyleAlert];
//    
//    [alert addAction:[TSCAlertAction actionWithTitle:[NSString stringWithLocalisationKey:@"_ALERT_ADD_TITLE"] style:TSCAlertActionStyleDefault handler:nil]];
//    [alert addAction:[TSCAlertAction actionWithTitle:[NSString stringWithLocalisationKey:@"_ALERT_CANCEL_TITLE"] style:TSCAlertActionStyleCancel handler:nil]];
//    
//    [alert showInView:self.view];
}

@end
