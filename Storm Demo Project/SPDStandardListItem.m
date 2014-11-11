//
//  SPDStandardListItem.m
//  Storm Demo Project
//
//  Created by Sam Houghton on 11/11/2014.
//  Copyright (c) 2014 threesidedcube. All rights reserved.
//

#import "SPDStandardListItem.h"
#import "SPDEmbeddedLinksListItemCell.h"

@implementation SPDStandardListItem

- (Class)tableViewCellClass
{
    return [SPDEmbeddedLinksListItemCell class];
}

- (SPDEmbeddedLinksListItemCell *)tableViewCell:(SPDEmbeddedLinksListItemCell *)cell
{
    cell.links = self.embeddedLinks;
    cell.imageView.image = [cell.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    cell.imageView.tintColor = [[TSCThemeManager sharedTheme] mainColor];
    
    return cell;
}

@end
