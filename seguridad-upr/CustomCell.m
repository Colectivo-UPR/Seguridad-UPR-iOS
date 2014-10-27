//
//  CustomCell.m
//  seguridad-upr
//
//  Created by Xiomara on 10/23/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize nameLabel = nameLabel;
@synthesize prepTimeLabel = prepTimeLabel;
@synthesize thumbnailImageView = thumbnailImageView;

- (void)updateConstraints{

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
