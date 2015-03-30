//
//  UPRUIButton.h
//  seguridad-upr
//
//  Created by Xiomara on 3/17/15.
//  Copyright (c) 2015 Colectivo-UPR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UPRUIButton : UIControl

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *supportLabel;

+ (CGFloat)defaultHeight;

@end
