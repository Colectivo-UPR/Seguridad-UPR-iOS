//
//  LoginViewController.m
//  seguridad-upr
//
//  Created by Xiomara on 12/16/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "LoginViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "HTTPRequestsViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        self.title = @"Trolleys";
        
        self.view.tintColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UILabel *elabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 180, self.view.bounds.size.width, 40)];
    UILabel *plabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 210, self.view.bounds.size.width, 40)];
    
    elabel.text = @"Email: ";
    elabel.font = [UIFont systemFontOfSize:12.0];
    
    plabel.text = @"Contraseña: ";
    plabel.font = [UIFont systemFontOfSize:12.0];
    
    self.email = [[UITextField alloc]initWithFrame:CGRectMake(120, 180, self.view.bounds.size.width, 40)];
    self.passw = [[UITextField alloc]initWithFrame:CGRectMake(120, 210, self.view.bounds.size.width, 40)];
    
    self.email.backgroundColor = [UIColor whiteColor];
    self.email.keyboardType = UIKeyboardTypeEmailAddress;
    self.email.font = [UIFont systemFontOfSize:12.0];
    self.email.placeholder = @"estudante@upr.edu";
    
    
    self.passw.backgroundColor = [UIColor whiteColor];
    self.passw.secureTextEntry = true;
    self.passw.font = [UIFont systemFontOfSize:12.0];
    self.passw.placeholder = @"ex. 1234567890";
    
    UIButton *login = [[UIButton alloc]initWithFrame:CGRectMake(20, 400, self.view.bounds.size.width - 40, 40)];
    [login setTitle:@"Entrar" forState:UIControlStateNormal];
    login.backgroundColor = [UIColor redColor];
    login.tintColor = [UIColor redColor];
    [login addTarget:self action:@selector(didTapLogin:) forControlEvents:UIControlEventAllTouchEvents];
    
    [self.view addSubview:elabel];
    [self.view addSubview:plabel];
    
    [self.view addSubview:self.email];
    [self.view addSubview:self.passw];
    [self.view addSubview:login]; 
    
    
}

-(void)didTapLogin:(id)sender {
    
    HTTPRequestsViewController *requests = [[HTTPRequestsViewController alloc]init];
    [requests auth:self.passw.text user:self.email.text]; 
    
    
    NSLog(@"email %@", self.email.text);
    NSLog(@"passw %@", self.passw.text);
    
}

- (UIColor *)getUIColorObjectFromHexString:(NSString *)hexStr alpha:(CGFloat)alpha {
    // Convert hex string to an integer
    unsigned int hexint = [self intFromHexString:hexStr];
    
    // Create color object, specifying alpha as well
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:alpha]; //f6f0e9
    
    return color;
}

- (unsigned int)intFromHexString:(NSString *)hexStr {
    unsigned int hexInt = 0;
    
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    
    // Scan hex value
    [scanner scanHexInt:&hexInt];
    
    return hexInt;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
