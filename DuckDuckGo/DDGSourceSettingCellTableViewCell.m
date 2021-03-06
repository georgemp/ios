//
//  DDGSourceSettingCellTableViewCell.m
//  DuckDuckGo
//
//  Created by Sean Reilly on 01/09/2015.
//
//

#import "DDGSourceSettingCellTableViewCell.h"

@implementation DDGSourceSettingCellTableViewCell


-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if(self) {
        self.tintColor = [UIColor duckRed];
        
        self.selectedBackgroundView.backgroundColor = [UIColor duckTableSeparator];
        
        self.textLabel.font = [UIFont duckFontWithSize:18.0f];
        self.detailTextLabel.font = [UIFont duckFontWithSize:15.0f];
        
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.autoresizingMask = UIViewAutoresizingNone;
    }
    return self;
}

-(void)setFeed:(DDGStoryFeed *)feed
{
    //self.imageView.alpha = 0;
    self.imageView.image = feed.image;
    self.textLabel.text = feed.title;
    self.detailTextLabel.text = feed.descriptionString;
    
    if(feed.feedState == DDGStoryFeedStateEnabled) {
        self.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        self.accessoryType = UITableViewCellAccessoryNone;
    }

}

-(void)layoutSubviews {
    self.imageView.frame = CGRectMake(15, 5, 40, 40);
    
    CGRect tmpFrame = self.textLabel.frame;
    tmpFrame.origin.x = 70;
    self.textLabel.frame = tmpFrame;

    tmpFrame.origin.y += tmpFrame.size.height + 4;
    tmpFrame.size.width = self.frame.size.width - self.frame.size.height - tmpFrame.origin.x;
    self.detailTextLabel.frame = tmpFrame;
    [super layoutSubviews];
}

@end
