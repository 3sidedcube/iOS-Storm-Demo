//
//  SPDEmbeddedLinksListItemCell.m
//  Storm Demo Project
//
//  Created by Sam Houghton on 11/11/2014.
//  Copyright (c) 2014 threesidedcube. All rights reserved.
//

#import "SPDEmbeddedLinksListItemCell.h"

@implementation SPDEmbeddedLinksListItemCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.links.count > 0) {
        float textLabelWidth = self.bounds.size.width - 30;
        float detailTextLabelWidth = self.bounds.size.width - 30;
        
        if (self.accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
            textLabelWidth = self.bounds.size.width - self.imageView.frame.size.width - 60;
            detailTextLabelWidth = self.bounds.size.width - self.imageView.frame.size.width - 60;
        }
        
        self.textLabel.frame = CGRectMake(self.textLabel.frame.origin.x, 12, textLabelWidth, self.textLabel.frame.size.height);
        
        float detailTextLabelY = 12;
        
        if (self.textLabel.text.length > 0) {
            detailTextLabelY = self.textLabel.frame.origin.y + self.textLabel.frame.size.height + 4;
        }
        
        self.detailTextLabel.frame = CGRectMake(self.detailTextLabel.frame.origin.x, detailTextLabelY, detailTextLabelWidth, self.detailTextLabel.frame.size.height);
        self.textLabel.textAlignment = self.detailTextLabel.textAlignment = [TSCThemeManager localisedTextDirectionForBaseDirection:NSTextAlignmentLeft];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [self layoutLinks];
    
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsZero];
        self.preservesSuperviewLayoutMargins = NO;
    }
    
    self.shouldDisplaySeparators = YES;
    
    self.imageView.frame = CGRectMake(12, 0, 36, 36);
    self.imageView.center = CGPointMake(self.imageView.center.x, self.contentView.center.y);
    
    if (self.imageView.image) {
        self.textLabel.frame = CGRectMake(self.imageView.frame.origin.x + self.imageView.frame.size.width + 10, self.textLabel.frame.origin.y, self.textLabel.frame.size.width, self.textLabel.frame.size.height);
    }
}

@end
