//
//  JHCollectionViewCell.m
//  WaterfallCollection
//
//  Created by Jivan on 2017/3/17.
//  Copyright © 2017年 Jivan. All rights reserved.
//

#import "JHCollectionViewCell.h"

@implementation JHCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
    
      self.contentView.backgroundColor = [UIColor colorWithRed:(arc4random()%251)/255.0 green:(arc4random()%251)/255.0 blue:(arc4random()%251)/255.0 alpha:1];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
