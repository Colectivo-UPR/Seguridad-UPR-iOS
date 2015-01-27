//
//  LoginViewController.h
//  seguridad-upr
//
//  Created by Xiomara on 12/16/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface LoginViewController : UIViewController

@property UITextField *email;
@property UITextField *passw;
@property UIButton *login;
@property UIImageView *logo;
@property UIActivityIndicatorView *indicator;


-(void)loginRequest; 

@end
