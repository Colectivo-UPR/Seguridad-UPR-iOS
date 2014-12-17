//
//  AlertasViewController.h
//  seguridad-upr
//
//  Created by Xiomara on 10/24/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface AlertasViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIBarButtonItem *connect;
@property (strong, nonatomic) UIBarButtonItem *alertButton;

@property AppDelegate *delegate; 
@property NSDictionary *incidents; 

@property UIButton *incidentsButton;
@property UIButton *reportsButton; 

@end
