//
//  SDPWelcomeViewController.m
//  Storm Demo Project
//
//  Created by Sam Houghton on 06/11/2014.
//  Copyright (c) 2014 threesidedcube. All rights reserved.
//

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
#import "SDPWelcomeViewController.h"
@import ThunderTable;

@interface SDPWelcomeViewController ()

@property (nonatomic, strong) UIImageView *flashImage;
@property (nonatomic, strong) UIView *logoView;
@property (nonatomic, assign) BOOL flipped;

@end

@implementation SDPWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addParticles];
    
    self.view.backgroundColor = [[TSCThemeManager sharedTheme] mainColor];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 55, self.view.frame.size.width, 35)];
    nameLabel.font = [UIFont boldSystemFontOfSize:28];
    nameLabel.text = @"You're in, Dan!";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.textColor = [[TSCThemeManager sharedTheme] primaryLabelColor];
    [self.view addSubview:nameLabel];
    
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, nameLabel.frame.origin.y + nameLabel.frame.size.height + 15, 250, 35)];
    messageLabel.font = [UIFont systemFontOfSize:26];
    messageLabel.text = @"Welcome to the Storm Corp initiative.";
    messageLabel.textColor = [[TSCThemeManager sharedTheme] primaryLabelColor];
    messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
    messageLabel.numberOfLines = 2;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:messageLabel];
    [messageLabel sizeToFit];
    messageLabel.center = CGPointMake(self.view.center.x, messageLabel.center.y);
    
    UIImageView *stormImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"outer-logo"]];
    stormImage.frame = CGRectMake(0, messageLabel.frame.origin.y + messageLabel.frame.size.height + 30, stormImage.frame.size.width + 20, stormImage.frame.size.height + 20);
    stormImage.center = CGPointMake(self.view.center.x, stormImage.center.y);
    [self.view addSubview:stormImage];
    
    UILabel *shakeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, stormImage.frame.size.height + stormImage.frame.origin.y + 50, 250, 35)];
    shakeLabel.font = [UIFont boldSystemFontOfSize:35];
    shakeLabel.text = @"Shake to begin!";
    shakeLabel.textColor = [[TSCThemeManager sharedTheme] primaryLabelColor];
    [shakeLabel sizeToFit];
    shakeLabel.center = CGPointMake(self.view.center.x, shakeLabel.center.y);
    [self.view addSubview:shakeLabel];
    [self shakeItBaby:shakeLabel];
    
    self.flashImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"flash"]];
    self.flashImage.frame = CGRectMake(0, 0, self.flashImage.frame.size.width - 60, self.flashImage.frame.size.height - 70);
    [self.view addSubview:self.flashImage];
    
    self.logoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    self.logoView.backgroundColor = [UIColor whiteColor];
    self.logoView.layer.cornerRadius = self.logoView.frame.size.width/2;
    self.logoView.center = stormImage.center;
    
    UIView *containterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    containterView.center = stormImage.center;
    [self.view addSubview:containterView];
    [containterView addSubview:self.flashImage];
    self.flashImage.center = CGPointMake(containterView.frame.size.width/2, containterView.frame.size.height/2);
    self.logoView.center = CGPointMake(containterView.frame.size.width/2, containterView.frame.size.height/2);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self performSelector:@selector(flipCenter) withObject:nil afterDelay:5.0];
}

- (void)flipCenter
{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        if (self.flipped) {
            [UIView transitionFromView:self.logoView toView:self.flashImage duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
                if (finished) {
                    self.flipped = NO;
                    [self performSelector:@selector(flipCenter) withObject:nil afterDelay:5.0];
                }
            }];
        } else {
            [UIView transitionFromView:self.flashImage toView:self.logoView duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
                if (finished) {
                    self.flipped = YES;
                    [self performSelector:@selector(flipCenter) withObject:nil afterDelay:5.0];
                }
            }];
        }
    }];
}

- (void)shakeItBaby:(UIView *)view
{
    view.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(-6));
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 0.35;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.autoreverses = YES;
    animation.repeatCount = INFINITY;
    animation.toValue = [NSNumber numberWithFloat:DEGREES_TO_RADIANS(12)];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [view.layer addAnimation:animation forKey:@"allMyAnimations"];
}

- (void)addParticles
{
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.emitterPosition = CGPointMake(self.view.bounds.size.width/2-25, self.view.bounds.size.height + 300);
    emitterLayer.emitterZPosition = 10;
    emitterLayer.emitterSize = CGSizeMake(50, 0);
    emitterLayer.emitterShape = kCAEmitterLayerLine;
    
    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
    emitterCell.scale = 0.4;
    emitterCell.scaleRange = 0.2;
    emitterCell.emissionRange = DEGREES_TO_RADIANS(100);
    emitterCell.lifetime = 50.0;
    emitterCell.birthRate = 0.5;
    emitterCell.velocity = 50;
    emitterCell.velocityRange = 10;
    emitterCell.yAcceleration = -1;
    emitterCell.xAcceleration = 0;
    emitterCell.alphaSpeed = -1.0/50.0;
    emitterCell.contents = (id)[[UIImage imageNamed:@"power"] CGImage];
    
    CAEmitterCell *emitterCell2 = [CAEmitterCell emitterCell];
    emitterCell2.scale = 0.4;
    emitterCell2.scaleRange = 0.2;
    emitterCell2.emissionRange = DEGREES_TO_RADIANS(100);;
    emitterCell2.lifetime = 50.0;
    emitterCell2.birthRate = 0.5;
    emitterCell2.velocity = 50;
    emitterCell2.velocityRange = 10;
    emitterCell2.yAcceleration = -1;
    emitterCell2.xAcceleration = 0;
    emitterCell2.alphaSpeed = -1.0/50.0;
    emitterCell2.contents = (id)[[UIImage imageNamed:@"settings"] CGImage];
    
    CAEmitterCell *emitterCell3 = [CAEmitterCell emitterCell];
    emitterCell3.scale = 0.4;
    emitterCell3.scaleRange = 0.2;
    emitterCell3.emissionRange = DEGREES_TO_RADIANS(100);;
    emitterCell3.lifetime = 50.0;
    emitterCell3.birthRate = 0.5;
    emitterCell3.velocity = 50;
    emitterCell3.velocityRange = 10;
    emitterCell3.yAcceleration = -1;
    emitterCell3.xAcceleration = 0;
    emitterCell3.alphaSpeed = -1.0/50.0;
    emitterCell3.contents = (id)[[UIImage imageNamed:@"slideshow"] CGImage];
    
    CAEmitterCell *emitterCell4 = [CAEmitterCell emitterCell];
    emitterCell4.scale = 0.4;
    emitterCell4.scaleRange = 0.2;
    emitterCell4.emissionRange = DEGREES_TO_RADIANS(100);
    emitterCell4.lifetime = 50.0;
    emitterCell4.birthRate = 0.5;
    emitterCell4.velocity = 50;
    emitterCell4.velocityRange = 10;
    emitterCell4.yAcceleration = -1;
    emitterCell4.xAcceleration = 0;
    emitterCell4.alphaSpeed = -1.0/50.0;
    emitterCell4.contents = (id)[[UIImage imageNamed:@"tools"] CGImage];
    
    emitterLayer.emitterCells = @[emitterCell, emitterCell2, emitterCell3, emitterCell4];
    [self.view.layer addSublayer:emitterLayer];
}

@end
