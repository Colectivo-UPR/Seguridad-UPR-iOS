//
//  LoginViewController.h
//  seguridad-upr
//
//  Created by Xiomara on 12/16/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@protocol controllerDelegate;

@interface LoginViewController : UIViewController

@property UITextField *email;
@property UITextField *passw;
@property UIButton *login;
@property UIImageView *logo;
@property UIActivityIndicatorView *indicator;

@property id <controllerDelegate> delegate;

- (instancetype)initWithAlert:(NSDictionary *)alert;

@end

@protocol controllerDelegate <NSObject>

- (void)createAlert:(NSDictionary *)attributes;

@end