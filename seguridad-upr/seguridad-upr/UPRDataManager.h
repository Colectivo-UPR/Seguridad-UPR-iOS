//
//  UPRDataManager.h
//  seguridad-upr
//
//  Created by Xiomara on 3/29/15.
//  Copyright (c) 2015 Colectivo-UPR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UPRDataManager : UITableViewController

@property NSString *titleAlert;
@property NSString *inactiveMessage;
@property NSString *generalMessage;
@property NSString *invalidMessage;
@property NSString *actionMessage;
@property NSString *activeTitle; 

+ (instancetype)sharedManager;

@end
