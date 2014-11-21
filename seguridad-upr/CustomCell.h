//
//  CustomCell.h
//  seguridad-upr
//
//  Created by Xiomara on 10/23/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "PureLayout.h"
#import "PureLayout+Internal.h"
#import "PureLayoutDefines.h"

@interface CustomCell : UITableViewCell

//@property (strong, nonatomic) UILabel * alertLabel;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *prepTimeLabel;
@property (nonatomic, strong) IBOutlet UILabel *infoLabel;
@property (nonatomic, strong) IBOutlet UIImageView *thumbnailImageView;
@property (nonatomic, strong) IBOutlet UIImageView *icon;

@end
