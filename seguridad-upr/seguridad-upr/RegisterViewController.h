//
//  RegisterViewController.h
//  seguridad-upr
//
//  Created by Xiomara on 12/4/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

@property UITextField *name;
@property UITextField *email;
@property UITextField *passwd;
@property UITextField *lstn;

@property (retain, nonatomic) IBOutlet UIButton *registration; 
@end
