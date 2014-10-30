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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:@"Cell"];
    
    if(self) {
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(55, 10, 300, 30)];
        self.nameLabel.textColor = [UIColor blackColor];
        self.nameLabel.font = [UIFont fontWithName:@"Arial" size:12.0f];
        
        self.prepTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(55, 25, 300, 30)];
        self.prepTimeLabel.textColor = [UIColor blackColor];
        self.prepTimeLabel.font = [UIFont fontWithName:@"Arial" size:12.0f];
        
        self.infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, 300, 30)];
        self.infoLabel.textColor = [UIColor blackColor];
        self.infoLabel.font = [UIFont fontWithName:@"Arial" size:12.0f];
        
        self.thumbnailImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 30, 30)];
        
    }
    
    [self addSubview:nameLabel];
    [self addSubview:prepTimeLabel];
    [self addSubview:self.infoLabel];
    [self addSubview:thumbnailImageView]; 
    
    return self;
}

@end
