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
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *prepTimeLabel;
@property (nonatomic, weak) IBOutlet UILabel *infoLabel; 
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@end
